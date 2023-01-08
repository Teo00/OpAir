import QtQuick 2.15
import QtQuick.Controls 2.15

import "../../controls"
import "../../others"

Item {
    id: item1

    width: 1200
    height: 580

    property string flightID: backend.getFlightID()



    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        CustomSearchableComboBox {
            id: customSearchableComboBox
            x: 25
            y: 14
            width: 190
            height: 70

            model: backend.getFlights()
            placeholderText: backend.getFlightCode()

            Component.onCompleted: {
                customSearchableComboBox.displayText = ""
            }



        }

        Text {
            id: fromLabel
            y: 119
            width: 136
            height: 26

            text: "FROM"
            anchors.left: parent.left
            font.family: "Inter"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 24
            color: "#80ffffff"
        }

        Text {
            id: toLabel
            x: 320
            y: 119
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
            y: 224
            width: 178
            height: 26
            color: "#80ffffff"
            text: "DEPARTURE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 24
            font.family: "Inter"
        }

        Text {
            id: gateLabel
            y: 424
            width: 106
            height: 26
            color: "#80ffffff"
            text: "GATE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 23
            font.family: "Inter"
        }

        Text {
            id: gateVar
            y: 464
            width: 80
            height: 26
            color: "#ffffff"
            text: backend.getGate()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 23
            font.family: "Inter"
        }

        Text {
            id: airplaneLabel
            y: 424
            width: 178
            height: 26
            color: "#80ffffff"
            text: "AIRPLANE"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 319
            font.family: "Inter"
        }

        NavigatorButton {
            id: fromBtn
            x: 25
            y: 151
            width: 70
            customFontSize: 24
            dataID: backend.getFromID()
            btnText: backend.getFromShort()
        }

        NavigatorButton {
            id: toBtn
            x: 320
            y: 151
            width: 70
            customFontSize: 24
            dataID: backend.getToID()
            btnText: backend.getToShort()
        }

        Text {
            id: arrivalLabel
            y: 324
            width: 178
            height: 26
            color: "#80ffffff"
            text: "ARRIVAL"
            anchors.left: parent.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 24
        }

        Text {
            id: arrivalVar
            y: 364
            width: 308
            height: 26
            color: "#ffffff"
            text: backend.getArrDate()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 24
        }

        NavigatorButton {
            id: airplaneBtn
            x: 320
            y: 456
            width: 120
            height: 50
            customFontSize: 24
            btnText: backend.getAirplaneID()
        }

        Text {
            id: departureVar
            y: 264
            width: 308
            height: 26
            color: "#ffffff"
            text: backend.getDeptDate()
            anchors.left: parent.left
            font.pixelSize: 26
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
            anchors.leftMargin: 24
        }

        ApproveButton {
            id: approveButton
            y: 14
            anchors.left: rejectButton.right
            anchors.leftMargin: 20

            onClicked: {
                backend.updateFlight(customSearchableComboBox.typedText)
                backend.openWindow(4, 1, backend.getTicketID(), false)
                mainWindow.close()
            }
        }

        RejectButton {
            id: rejectButton
            x: 1000
            y: 14

            isTicketClose: true

            onClicked: {

               content.replace(Qt.resolvedUrl("FlightInfoZoneView.qml"))

            }

        }


    }
}


