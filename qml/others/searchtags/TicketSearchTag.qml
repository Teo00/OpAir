import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../../controls"
import "../../others"

Item {

    id: ticketSearchTag
    property color colorBackground: "#00ffffff"

    //DATA

    property var ticketID
    property string ticketPNR: "UNKNOWN"
    property string deptShort: "UNK"
    property string arrShort: "UNK"
    property string deptDate: "01.01.1900"
    property bool hasBoarded: false
    property bool hasCheckedIn: false
    property string passengerName: "Unknown"
    property string passengerSurname: "Unknown"
    property double fare


    width: 1255
    height: 150
    Rectangle {

        id: innerBg
        color: "#00ffffff"
        radius: 10
        border.color: "#1affffff"
        border.width: 1.5
        anchors.fill: parent

        Shape {
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 1.5
                strokeStyle: ShapePath.DashLine
                dashPattern: [4, 10]
                capStyle: ShapePath.RoundCap
                strokeColor: "#10ffffff"

                startX: 960
                startY: 1
                PathLine { x: 960; y: ticketSearchTag.height - 2 }
            }
        }
        NavigatorButton {
            id: ticketPNRVar
            x: 33
            y: 74
            width: 145
            height: 40
            customFontSize: 28
            btnText: ticketSearchTag.ticketPNR
            onClicked: backend.openWindow(4, 1, ticketSearchTag.ticketID, true)
        }

        Text {
            id: ticketLabel
            x: 74
            y: 41
            color: "#ffffff"
            text: qsTr("Ticket")
            font.pixelSize: 22
            font.family: "Inter"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: passengerLabel
            x: 245
            y: 29
            font.pixelSize: 20
            font.family: "Inter"
            color: "#80ffffff"
            text: "PASSENGER"
        }

        Text {
            id: passengerFullNameVar
            y: 62
            font.pixelSize: 22
            anchors.leftMargin: 0
            font.family: "Inter"
            color: "#ffffff"
            text: ticketSearchTag.passengerName + " " + ticketSearchTag.passengerSurname
            anchors.left: passengerLabel.left
        }

        Text {
            id: flightLabel
            x: 731
            y: 31
            color: "#80ffffff"
            text: "FLIGHT"
            anchors.right: parent.right
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            anchors.rightMargin: 453
            font.family: "Inter"
        }

        Text {
            id: routeVar
            y: 62
            color: "#ffffff"
            text: ticketSearchTag.deptShort + " - " + ticketSearchTag.arrShort
            anchors.left: flightLabel.left
            font.pixelSize: 22
            horizontalAlignment: Text.AlignLeft
            anchors.leftMargin: 0
            font.family: "Inter"
        }

        Text {
            id: deptVar
            y: 93
            color: "#ffffff"
            text: ticketSearchTag.deptDate
            anchors.left: flightLabel.left
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            anchors.leftMargin: 0
            font.family: "Inter"
        }

        Text {
            id: checkinLabel1
            x: 1000
            width: 136
            height: 24
            color: "#80ffffff"
            text: "CHECK-IN"
            anchors.top: parent.top
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 24
            font.family: "Inter"
        }

        Tick {
            id: checkinTick1
            x: 1199
            anchors.top: parent.top
            anchors.topMargin: 20
            isEnabled: ticketSearchTag.hasCheckedIn
            isButton: false
            enabled: false
        }

        Text {
            id: boardedLabel1
            x: 1000
            width: 136
            height: 24
            color: "#80ffffff"
            text: "BOARDED"
            anchors.top: checkinLabel1.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.topMargin: 15
            font.family: "Inter"

        }

        Tick {
            id: boardedTick1
            x: 1199
            y: -4
            anchors.top: checkinTick1.bottom
            anchors.topMargin: 3
            isEnabled: ticketSearchTag.hasBoarded

            isButton: false
            enabled: false
        }

        Text {
            id: fareLabel1
            x: 1000
            y: 152
            width: 53
            height: 24
            color: "#80ffffff"
            text: "FARE"
            anchors.bottom: parent.bottom
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 24
            font.family: "Inter"
        }

        Text {
            id: fareVar1
            x: 1042
            y: 98
            width: 189
            height: 32
            color: "#ffffff"
            text: ticketSearchTag.fare + "₺"
            anchors.bottom: parent.bottom
            font.pixelSize: 28
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            anchors.bottomMargin: 20
            font.styleName: "Regular"
            font.bold: false
            font.family: "Jetbrains Mono"
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
