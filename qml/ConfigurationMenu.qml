import QtQuick 2.11
import QtQuick.Controls 2.4


Item {
    anchors.fill: parent

    Rectangle {
        border.width: 1
        border.color: "blue"
        anchors.centerIn: parent

        width: parent.width * 0.4
        height: parent.height * 0.4

        Item {
            id: targetNbrItem
            width: parent.width * 0.9
            height: parent.height * 0.25
            anchors.top: parent.top
            anchors.topMargin: parent.height * 0.05
            anchors.left: parent.left
            anchors.leftMargin: parent.width * 0.05

            Text {
                id: targetNbrText
                text: "Nombre de cibles : "
                width: parent.width /** 0.8*/
                height: parent.height * 0.4
                verticalAlignment: Text.AlignVCenter
            }

            TextInput {
                id : targetNbrInput
                width: parent.width /** 0.9*/
                height: parent.height * 0.4
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.top: targetNbrText.bottom
                anchors.topMargin: parent.height * 0.2
                validator: RegExpValidator { regExp: /^[1-9][0-9]?|100$/}
                color: focus ? "lightblue": "black"

                Rectangle {
                    anchors.fill: parent
                    border.width: 1
                    border.color: parent.focus ? "lightblue": "black"
                    color: "transparent"
                }
            }
        }

        Button {
            text: "Sauvegarder la configuration"
            anchors.horizontalCenter: parent.horizontalCenter
            height: parent.height * 0.1
            anchors.bottom: parent.bottom
            anchors.bottomMargin: parent.height * 0.05
            width: parent.width * 0.3

            onClicked: {
                configurationMenu.visible = false
                aimArea.visible = true
                aim.initialize(targetNbrInput.text)
            }
        }
    }
}
