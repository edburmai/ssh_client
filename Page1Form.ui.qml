import QtQuick 2.9
import QtQuick.Controls 2.2
import QtQuick.Window 2.2

Page {
    width: Screen.width
    height: Screen.height

    header: Label {
        text: qsTr("Sessions")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }
}
