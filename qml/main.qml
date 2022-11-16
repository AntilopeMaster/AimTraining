import QtQuick 2.9
import QtQuick.Window 2.11
import QtQuick.Controls 1.5


Window {
    id:  mainWindow
    visible: true
    width: Screen.width
    height: Screen.height
    visibility: "FullScreen"

//    Component.onCompleted: console.log(Screen.width , " ", Screen.height)

    title: qsTr("Aim")


    MouseArea {
        id: aimArea
        z: 5
        anchors.fill: parent
        cursorShape: Qt.CrossCursor
        propagateComposedEvents: true

        visible: false

        Rectangle {
            color: "red"
            width: 20
            height: width
            radius: width
            x: aim ? aim.target ? aim.target.x : 0 : 0
            y: aim ? aim.target ? aim.target.y : 0 : 0

            MouseArea {
                onClicked: aim.setNextTarget()
                anchors.fill: parent
            }
        }

        Text {
            id: timer
            text: "Temps restant : " + aim.aimTimer.toFixed(2) + " s"
            height: 30
            width: parent.width
            horizontalAlignment: Text.AlignHCenter
        }
    }



    ConfigurationMenu {
        id: configurationMenu

    }

}
