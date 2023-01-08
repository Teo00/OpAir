import QtQuick 2.15
import QtQuick.Controls 2.15

import "../../controls"
import "../../others"

Item {
    id: item1

    width: 1200
    height: 580

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
            btnText: backend.getFlightCode()
            y: 14
            anchors.left: parent.left
            anchors.leftMargin: 25
            customFontSize: 38
            customWidth: 190
            customHeight: 70
            onClicked: {
                backend.openWindow(1, 1, backend.getFlightID(), false)
            }
        }

        EditRecordButton {
            id: editRecordButton
            x: 1100
            y: 14
            anchors.leftMargin: 18
            isTicketEdit: true
            onClicked: {

                content.replace(Qt.resolvedUrl("FlightInfoZoneEdit.qml"))

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
            anchors.leftMargin: 25
            color: "#80ffffff"
        }

        Text {
            id: toLabel
            x: 321
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
            anchors.leftMargin: 25
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
            anchors.leftMargin: 24
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
            anchors.leftMargin: 24
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
            anchors.leftMargin: 320
            font.family: "Inter"
        }

        NavigatorButton {
            id: fromBtn
            x: 26
            y: 151
            width: 70
            customFontSize: 24
            dataID: backend.getFromID()
            btnText: backend.getFromShort()
            onClicked: backend.openWindow(3, 1, backend.getFromID(), false)
        }

        NavigatorButton {
            id: toBtn
            x: 321
            y: 151
            width: 70
            customFontSize: 24
            dataID: backend.getToID()
            btnText: backend.getToShort()
            onClicked: backend.openWindow(3, 1, backend.getToID(), false)
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
            anchors.leftMargin: 25
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
            anchors.leftMargin: 25
        }

        NavigatorButton {
            id: airplaneBtn
            x: 321
            y: 456
            width: 120
            height: 50
            customFontSize: 24
            btnText: backend.getAirplaneID()
            onClicked: backend.openWindow(5, 1, backend.getAirplaneID(), false)
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
            anchors.leftMargin: 25
        }
    }
}
