import QtQuick 2.15
import "../controls"
import "../others"
import "flight"

Item {
    id: item1

    width: 1850
    height: 865

    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        NavigatorButton {
            id: passangerIDBtn
            y: 35
            anchors.left: parent.left
            anchors.leftMargin: 40
            customFontSize: 38
            customWidth: 190
            customHeight: 70
            btnText: backend.getPassengerID()

            enabled: false

        }

        EditRecordButton {
            id: editRecordButton
            y: 35
            anchors.left: deleteRecordButton.right
            anchors.leftMargin: 16
        }

        DeleteRecordButton {
            id: deleteRecordButton
            y: 35
            anchors.left: passangerIDBtn.right
            anchors.leftMargin: 106
        }

        Text {
            id: nameLabel
            y: 140
            width: 136
            height: 26

            text: "NAME"
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            color: "#80ffffff"
        }

        Text {
            id: nameVar
            y: 180
            width: 136
            height: 26

            text: backend.getName()
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            color: "#ffffff"
        }

        Text {
            id: surnameLabel
            x: 336
            y: 140
            width: 136
            height: 26
            color: "#80ffffff"
            text: "SURNAME"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: surnameVar
            x: 336
            y: 180
            width: 222
            height: 26
            color: "#ffffff"
            text: backend.getSurname()
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: emailLabel
            y: 240
            width: 178
            height: 26
            color: "#80ffffff"
            text: "E-MAIL ADDRESS"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: emailVar
            y: 280
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getEmail()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: addressLabel
            y: 340
            width: 106
            height: 26
            color: "#80ffffff"
            text: "ADDRESS"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: addressVar
            y: 380
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getAddress()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: phoneLabel
            y: 440
            width: 178
            height: 26
            color: "#80ffffff"
            text: "PHONE NUMBER"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: phoneVar
            y: 480
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getPhone()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: idNumberLabel
            y: 540
            width: 395
            height: 26
            color: "#80ffffff"
            text: "Identity Number (TC for Turkish Citizens)"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: idNumberVar
            y: 580
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getIDNO()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        InnerSearchBar {
            id: innerSearchBar
            x: 615
            y: 35
            anchors.right: newRecordButton.left
            anchors.rightMargin: 15

            onTextChanged: {
                pageSelectButton.currentPage = 1
                ticketsArea.internal.updateDb() //TODO
            }
        }

        NewRecordButton {
            id: newRecordButton
            x: 1620
            y: 35

            onClicked: {
                backend.changeMode(3)
                mainWindow.close()
            }
        }

        PageSelectButton {
            id: pageSelectButton
            x: 1585
            y: 782
        }

        TicketsArea {
            id: ticketsArea
            x: 615
            y: 121
            windowID: 2
        }





    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}
}
##^##*/
