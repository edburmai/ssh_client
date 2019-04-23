import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2
import QtQuick.LocalStorage 2.0

ApplicationWindow {
    visible: true
    width: Screen.width
    height: Screen.height
    title: qsTr("Tabs")

    SwipeView {
        id: swipeView
        anchors.fill: parent
        currentIndex: tabBar.currentIndex

        Page1Form {
            property string dbId: "MyDatabase"
            property string dbVersion: "1.0"
            property string dbDescription: "SSH client application database"
            property int dbSize: 100000
            property var db

            Component.onCompleted: {
                db = LocalStorage.openDatabaseSync(dbId, dbVersion,
                                                   dbDescription, dbSize)
                db.transaction(function (tx) {
                    var sql = "CREATE TABLE IF NOT EXISTS svrr"
                    + "(id INTEGER PRIMARY KEY AUTOINCREMENT,"
                    + "ip TEXT NOT NULL)";
                    tx.executeSql(sql);
                });

                db.transaction(function (tx) {
                    var sql = "INSERT INTO svrr"
                    + "(ip)"
                    + "VALUES ('192.168.25.1')";
                    tx.executeSql(sql);
                });

                db.transaction(function (tx) {
                    var sql = "SELECT id, ip FROM svrr";
                    var rs = tx.executeSql(sql);
                    var myId, myIp;
                    for (var ix = 0; ix < rs.rows.length; ++ix) {
                        mainModel.append({name: "MyServer2", ip: rs.rows.item(ix).ip});
                    }
                });
            }

            ListView {
                        anchors.fill: parent


                        highlightFollowsCurrentItem: true

                        model: ListModel {
                            id: mainModel
                        }

                        delegate: Item {
                            anchors.left: parent.left
                            anchors.leftMargin: 10
                            height: 40; width: parent.width
                            Rectangle {
                                anchors.fill: parent
                                id:rect;
                                //color: "lightblue"
                                Column {
                                    Text { text: "<b>Server name: </b>" + name }
                                    Text { text: "<b>IP: </b>" + ip }
                                }
                            }

                            MouseArea {
                                id: quitMouse
                                anchors.fill: parent
                                onPressed: {rect.color = "lightblue"}
                                onReleased: {rect.color = "white"}

                            }
                        }
            }
        }

        Page2Form {
        }
    }

    footer: TabBar {
        id: tabBar
        currentIndex: swipeView.currentIndex

        TabButton {
            text: qsTr("Sessions")
        }
        TabButton {
            text: qsTr("Terminal")
        }
    }
}
