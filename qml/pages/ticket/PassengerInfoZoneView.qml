import QtQuick 2.15
import "../../controls"
import "../../others"

Item {
    id: item1

    width: 1200
    height: 600

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
            y: 14
            anchors.left: parent.left
            anchors.leftMargin: 25
            customFontSize: 38
            customWidth: 190
            customHeight: 70
            btnText: backend.getPassengerID()
            onClicked: backend.openWindow(1, 1, backend.getPassengerID(), false)

        }

        EditRecordButton {
            id: editRecordButton
            x: 1100
            y: 14
            anchors.leftMargin: 18
            isTicketEdit: true
            onClicked: {
                content.replace(Qt.resolvedUrl("PassengerInfoZoneEdit.qml"))
            }
        }

        Text {
            id: nameLabel
            y: 119
            width: 136
            height: 26

            text: "NAME"
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            color: "#80ffffff"
        }

        Text {
            id: nameVar
            y: 159
            width: 136
            height: 26

            text: backend.getName()
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            color: "#ffffff"
        }

        Text {
            id: surnameLabel
            x: 321
            y: 119
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
            x: 321
            y: 159
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
            y: 219
            width: 178
            height: 26
            color: "#80ffffff"
            text: "E-MAIL ADDRESS"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: emailVar
            y: 259
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getEmail()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: addressLabel
            y: 319
            width: 106
            height: 26
            color: "#80ffffff"
            text: "ADDRESS"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: addressVar
            y: 359
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getAddress()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: phoneLabel
            y: 419
            width: 178
            height: 26
            color: "#80ffffff"
            text: "PHONE NUMBER"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: phoneVar
            y: 459
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getPhone()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: idNumberLabel
            y: 519
            width: 395
            height: 26
            color: "#80ffffff"
            text: "Identity Number (TC for Turkish Citizens)"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }

        Text {
            id: idNumberVar
            y: 559
            width: 136
            height: 26
            color: "#ffffff"
            text: backend.getIDNO()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 25
            font.family: "Inter"
        }





    }

}


