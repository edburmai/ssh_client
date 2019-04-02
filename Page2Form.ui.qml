import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Controls.Styles 1.4

Page {
    id: page
    width: Screen.width
    height: Screen.height

    header: Label {
        text: qsTr("Terminal")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
        Button {
            width:  40
            height: 35
            x: parent.width - 70
            y: 0
            anchors.top: parent.top
            anchors.topMargin: 15
            Rectangle {
                width: parent.width
                height: parent.height
                color: "#FFFFFF"
            }
            Image {
                width: parent.width
                height: parent.height
                id: keydoard
                source: "60759.png"
            }
        }
    }

    Row {
        id: row
        x: 0
        y: 0
        height: parent.height / 1.5
        anchors.right: parent.right
        anchors.rightMargin: 5
        anchors.left: parent.left
        anchors.leftMargin: 5
        Rectangle {
            id: rect
            x: parent.x
            y: parent.y
            width: parent.width
            height: parent.height - 50
            anchors.left: parent.left
            anchors.leftMargin: 4
            anchors.right: parent.right
            anchors.rightMargin: 4
            anchors.top: parent.top
            anchors.topMargin: 10
            border.width: 2
            border.color: "#FFFFFF"
            color: "#000000"
            radius: 6.
            ScrollView {
                id: textInputScroll
                width: parent.width
                height: parent.height
                anchors.left: parent.left
                anchors.leftMargin: 5
                anchors.right: parent.right
                anchors.rightMargin: 5
                anchors.top: parent.top
                anchors.topMargin: 10
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 10
                TextArea {
                    color: "#FFFFFF"
                    id: textInput
                    width: parent.width
                    height: parent.height
                    textFormat: Text.AutoText
                    wrapMode: Text.WrapAnywhere
                    anchors.left: parent.left
                    anchors.top: parent.top
                    renderType: Text.NativeRendering
                    font.pixelSize: 12
                    text: "TextArea"
                    font.bold: true
                    inputMethodHints: "ImhNoPredictiveText"
                }
            }
        }
        Button {
            x: 0
            y: parent.height - 40
            anchors.left: parent.left
            anchors.leftMargin: 9
            anchors.right: parent.right
            anchors.rightMargin: 9
            text: "Done"
        }
    }
}
