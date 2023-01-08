import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../others"

Item {
    id: item1

    width: 1850
    height: 865

    property var flightID: backend.getFlightID()

    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        NavigatorButton {
            id: flightIDBtn
            y: 35
            anchors.left: parent.left
            btnText: backend.getFlightCode()
            anchors.leftMargin: 40
            customFontSize: 38
            customWidth: 190
            customHeight: 70
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
            anchors.left: flightIDBtn.right
            anchors.leftMargin: 106

            onClicked: {

                //[airplaneID, fromID, toID, deptDate, arrivalDate, gate, flightCode]
                var goData = [airplaneVar.model[airplaneVar.currentIndex], fromVar.itemID[fromVar.currentIndex], toVar.itemID[toVar.currentIndex], (departureVar.text.length == 0 ? departureVar.placeholderText : departureVar.text), (arrivalVar1.text.length == 0 ? arrivalVar1.placeholderText : arrivalVar1.text), (gateVar.text.length == 0 ? gateVar.placeholderText : gateVar.text), flightIDBtn.btnText] //TODO
                backend.updateAllData(goData)
                backend.changeMode(1)
                mainWindow.close()
            }
        }

        Text {
            id: fromLabel
            y: 140
            width: 136
            height: 26

            text: "FROM"
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            color: "#80ffffff"
        }

        Text {
            id: toLabel
            x: 336
            y: 140
            width: 136
            height: 26
            color: "#80ffffff"
            text: "TO"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: departureLabel
            y: 245
            width: 178
            height: 26
            color: "#80ffffff"
            text: "DEPARTURE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: gateLabel
            y: 445
            width: 106
            height: 26
            color: "#80ffffff"
            text: "Gate"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Text {
            id: airplaneLabel
            y: 445
            width: 178
            height: 26
            color: "#80ffffff"
            text: "AIRPLANE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 336
            font.family: "Inter"
        }

        InnerSearchBar {
            id: innerSearchBar
            x: 1070
            y: 35
            width: 536

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

        Text {
            id: arrivalLabel
            y: 345
            width: 178
            height: 26
            color: "#80ffffff"
            text: "ARRIVAL"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 39
        }

        DoubleSwitch {
            id: doubleSwitch
            x: 615
            y: 35
            enabled: false
        }

        CustomCombobox {
            id: fromVar
            y: 170
            width: 135
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 41
            model: backend.getAllAirports()
            itemID: backend.getAllAirportIDs()
            currentIndex: backend.getFromShort() == '' ? 0 : backend.getAirportIndexOnCombobox(backend.getFromShort())
        }

        CustomCombobox {
            id: toVar
            y: 170
            width: 135
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 334
            model: backend.getAllAirports()
            itemID: backend.getAllAirportIDs()
            currentIndex: backend.getToShort() == '' ? 0 : backend.getAirportIndexOnCombobox(backend.getToShort())
        }

        CustomTextBox {
            id: departureVar
            y: 285
            width: 305
            height: 50
            anchors.left: parent.left
            placeholderText: backend.getDeptDate()
            anchors.leftMargin: 40
            horizontalAlignment: Text.AlignLeft
        }

        CustomTextBox {
            id: arrivalVar1
            y: 385
            width: 305
            height: 50
            anchors.left: parent.left
            placeholderText: backend.getArrDate()
            anchors.leftMargin: 40
            horizontalAlignment: Text.AlignLeft
        }

        CustomTextBox {
            id: gateVar
            y: 485
            width: 110
            height: 50
            anchors.left: parent.left
            placeholderText: backend.getGate()
            anchors.leftMargin: 40
            horizontalAlignment: Text.AlignLeft
        }

        CustomCombobox {
            id: airplaneVar
            y: 477
            width: 135
            height: 50
            anchors.left: parent.left
            anchors.leftMargin: 337
            model: backend.getAllAirplaneIDs()
        }

        StackView {
            id: rightContent
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 120
            anchors.bottomMargin: 105
            anchors.rightMargin: 15
            anchors.leftMargin: 615


            initialItem: Qt.resolvedUrl("flight/TicketsArea.qml")
        }





    }


    Connections {

        target: backend

    }

}





/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
