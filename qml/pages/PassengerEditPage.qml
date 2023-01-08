import QtQuick 2.15
import "../controls"
import "../others"
import "flight"

Item {
    id: item1
    width: 1850
    height: 865

    property var passengerID: backend.getPassengerID()

    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom


        NavigatorButton {
            id: passengerIDBtn
            y: 35
            anchors.left: parent.left
            anchors.leftMargin: 40
            customFontSize: 38
            customWidth: 190
            customHeight: 70
            btnText: passengerID
            enabled: false
        }

        RejectButton {
            id: rejectButton
            y: 35
            anchors.left: approveButton.right
            anchors.leftMargin: 16
        }

        ApproveButton {
            id: approveButton
            y: 35
            anchors.left: passengerIDBtn.right
            anchors.leftMargin: 106

            onClicked: {

                //[name, surname, email, address, phone, id, passengerID]
                var goData = [(nameVar.text.length == 0 ? nameVar.placeholderText : nameVar.text), (surnameVar.text.length == 0 ? surnameVar.placeholderText : surnameVar.text), (emailVar.text.length == 0 ? emailVar.placeholderText : emailVar.text), (addressVar.text.length == 0 ? addressVar.placeholderText : addressVar.text), (phoneVar.text.length == 0 ? phoneVar.placeholderText : phoneVar.text), (idNumberVar.text.length == 0 ? idNumberVar.placeholderText : idNumberVar.text)] //TODO
                backend.updateAllData(goData)
                backend.changeMode(1)
                mainWindow.close()
            }

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
            id: idNumberLabel
            y: 540
            width: 392
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

        InnerSearchBar {
            id: innerSearchBar
            x: 615
            y: 35

            onTextChanged: {
                pageSelectButton.currentPage = 1
                internal.updateDb()
            }
        }

        PageSelectButton {
            id: pageSelectButton
            x: 1585
            y: 782
        }

        CustomTextBox {
            id: nameVar
            x: 33
            y: 168
            width: 249
            height: 50
            horizontalAlignment: Text.AlignLeft
            placeholderText: backend.getName()
        }

        CustomTextBox {
            id: surnameVar
            x: 328
            y: 168
            width: 249
            height: 50
            horizontalAlignment: Text.AlignLeft
            placeholderText: backend.getSurname()
        }

        CustomTextBox {
            id: emailVar
            x: 33
            y: 268
            width: 407
            height: 50
            placeholderText: backend.getEmail()
            horizontalAlignment: Text.AlignLeft
        }

        CustomTextBox {
            id: addressVar
            x: 33
            y: 368
            width: 407
            height: 50
            horizontalAlignment: Text.AlignLeft
            placeholderText: backend.getAddress()
        }

        CustomTextBox {
            id: phoneVar
            x: 33
            y: 468
            width: 249
            height: 50
            horizontalAlignment: Text.AlignLeft
            placeholderText: backend.getPhone()
        }

        CustomTextBox {
            id: idNumberVar
            x: 33
            y: 568
            width: 249
            height: 50
            horizontalAlignment: Text.AlignLeft
            placeholderText: backend.getIDNO()
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
