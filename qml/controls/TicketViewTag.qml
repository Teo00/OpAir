import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

import "../others"


Rectangle {
    id: rectangle

    width: 1200
    height: 200

    color: "#09ffffff"
    radius: 20
    border.color: "#1c1c2b"
    border.width: 3


    QtObject {

        id: internal
        property color colorDefault: "#00ffffff"
        property color colorHover: "#2affffff"
        property color colorPressed: "#1affffff"

        property var flightColor: if(flightBtn.checked) {
                                      flightBtn.checked ? internal.colorPressed : internal.colorDefault
                                  }else {
                                      flightBtn.hovered ? internal.colorHover : internal.colorDefault
                                  }
        property var passengerColor: if(passengerBtn.checked) {
                                         passengerBtn.checked ? internal.colorPressed : internal.colorDefault
                                     }else {
                                         passengerBtn.hovered ? internal.colorHover : internal.colorDefault
                                     }
        property var baggageColor: if(baggageBtn.checked) {
                                       baggageBtn.checked ? internal.colorPressed : internal.colorDefault
                                   }else {
                                       baggageBtn.hovered ? internal.colorHover : internal.colorDefault
                                   }

    }




    Button {
        id: flightBtn
        x: 275
        y: 0
        width: 210
        height: 200
        text: ""
        autoExclusive: true
        checked: true
        checkable: true

        background: Rectangle {

            color: internal.flightColor
        }

        onCheckedChanged: {
            if(flightBtn.checked){
                content.clear(StackView.Immediate)
                content.push(Qt.resolvedUrl("../pages/ticket/FlightInfoZoneView.qml"))
            }

        }



        Text {
            text: "FLIGHT"
            font.family: "Inter Medium"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            color: "#ffffff"
            opacity: 0.5
            y: 83
        }

        Image {
            id: flight
            y: 35
            width: 39
            height: 39
            source: "../../img/flight.svg"
            anchors.horizontalCenter: parent.horizontalCenter
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: flightCodeVar
            y: 111
            color: "#ffffff"
            text: backend.getFlightCode()
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Jetbrains Mono"
        }

        Text {
            id: flightRouteVar
            y: 154
            opacity: 0.5
            color: "#b3ffffff"
            text: backend.getFromShort() + " - " + backend.getToShort()
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Inter"
        }
    }

    Button {
        id: passengerBtn
        x: 485
        y: 0
        width: 210
        height: 200
        text: ""
        autoExclusive: true
        checkable: true

        background: Rectangle {

            color: internal.passengerColor
        }

        onCheckedChanged: {
            if(passengerBtn.checked){
                content.clear(StackView.Immediate)
                content.push(Qt.resolvedUrl("../pages/ticket/PassengerInfoZoneView.qml"))
            }

        }


        Text {
            text: "PASSENGER"
            font.family: "Inter Medium"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            color: "#ffffff"
            opacity: 0.5
            y: 83
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: passenger
            x: 91
            y: 35
            width: 27
            height: 39
            source: "../../img/passenger.svg"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: passengerIDVar
            y: 111
            color: "#ffffff"
            text: qsTr(backend.getPassengerID())
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Jetbrains Mono"
        }

        Text {
            id: passengerNameSurnameVar
            y: 154
            opacity: 0.5
            color: "#b3ffffff"
            text: backend.getPassengerFullName()
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            font.family: "Inter"
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
        }
    }

    Button {
        id: baggageBtn
        x: 695
        y: 0
        width: 210
        height: 200
        text: ""
        checkable: true
        autoExclusive: true

        onCheckedChanged: {
            if(baggageBtn.checked){
                content.clear(StackView.Immediate)
                content.push(Qt.resolvedUrl("../pages/ticket/BaggageInfoZone.qml"))
            }

        }


        Text {
            y: 83
            opacity: 0.5
            color: "#ffffff"
            text: "BAGGAGE"
            font.pixelSize: 20
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Inter Medium"
        }

        Image {
            id: baggage
            x: 87
            y: 35
            source: "../../img/baggage.svg"
            fillMode: Image.PreserveAspectFit
        }

        Text {
            id: baggageIDVar
            x: -596
            y: 106
            color: "#ffffff"
            text: qsTr("-")
            font.pixelSize: 28
            horizontalAlignment: Text.AlignHCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Jetbrains Mono"
        }
        background: Rectangle {
            color: internal.baggageColor
        }
    }

    Rectangle {
        id: pnrBg
        x: 0
        y: 0
        width: 275
        height: 200
        color: "#00ffffff"

        Text {
            y: 60
            opacity: 0.5
            color: "#ffffff"
            text: "PNR NUMBER"
            font.pixelSize: 20
            anchors.horizontalCenterOffset: 0
            anchors.horizontalCenter: parent.horizontalCenter
            font.family: "Inter"
        }

        Text {
            id: pnrVar
            x: 74
            y: 100
            color: "#ffffff"
            text: backend.getPNR()
            font.pixelSize: 35
            horizontalAlignment: Text.AlignHCenter
            font.family: "Jetbrains Mono"
        }
    }

    Rectangle {
        id: otherInfoBg
        x: 920
        y: 0
        width: 280
        height: 200
        color: "#00ffffff"

        Text {
            x: 175
            y: 40
            opacity: 0.5
            color: "#ffffff"
            text: "CHECK-IN"
            anchors.left: parent.left
            font.pixelSize: 20
            anchors.leftMargin: 40
            font.family: "Inter"
        }

        Tick {
            id: checkInTick
            x: 199
            y: 37
            isEnabled: backend.hasCheckedIn()

            onClicked: {
                backend.setCheckedIn(checkInTick.isEnabled)
            }
        }

        Text {
            x: 184
            y: 82
            opacity: 0.5
            color: "#ffffff"
            text: "BOARDED"
            anchors.left: parent.left
            font.pixelSize: 20
            font.family: "Inter"
            anchors.leftMargin: 40
        }

        Tick {
            id: boardedTick
            x: 199
            y: 79
            isEnabled: backend.hasBoarded()

            onClicked: {
                backend.setBoarded(boardedTick.isEnabled)
            }
        }

        Text {
            id: fareLabel
            x: 40
            y: 140
            width: 53
            height: 24
            color: "#80ffffff"
            text: "FARE"
            font.pixelSize: 20
            horizontalAlignment: Text.AlignLeft
            verticalAlignment: Text.AlignVCenter
            font.family: "Inter"
        }

        Text {
            id: fareVar
            x: 75
            y: 136
            width: 189
            height: 32
            color: "#ffffff"
            text: backend.getFare()
            font.pixelSize: 28
            horizontalAlignment: Text.AlignRight
            verticalAlignment: Text.AlignVCenter
            font.styleName: "Regular"
            font.bold: false
            font.family: "Jetbrains Mono"
        }
    }


    Shape {
        ShapePath {
            fillColor: "#00ffffff"
            strokeWidth: 1.5
            strokeStyle: ShapePath.DashLine
            dashPattern: [4, 10]
            capStyle: ShapePath.RoundCap
            strokeColor: "#1C1C2B"

            startX: 920
            startY: 1
            PathLine { x: 920; y: 198 }
        }
    }







}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}
}
##^##*/
