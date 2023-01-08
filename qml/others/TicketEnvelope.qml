import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: ticketEnvelope
    property color colorBackground: "#00ffffff"

    property bool dashed: true
    property bool destinationLine: false


    width: 1200
    height: 200
    icon.color: "#ffffff"

    background: Rectangle {

        id: innerBg
        color: ticketEnvelope.colorBackground
        radius: 10
        border.color: "#1c1c2b"
        border.width: 1.5

        Shape {
            visible: ticketEnvelope.dashed
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 1.5
                strokeStyle: ShapePath.DashLine
                dashPattern: [4, 8]
                capStyle: ShapePath.RoundCap
                strokeColor: "#1C1C2B"

                startX: ticketEnvelope.width * 75 / 100
                startY: 1
                PathLine { x: ticketEnvelope.width * 75 / 100; y: ticketEnvelope.height - 2}
            }
        }

        Shape {
            visible: ticketEnvelope.destinationLine
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 1.5
                capStyle: ShapePath.RoundCap
                strokeColor: "#32ffffff"

                startX: 200 + (ticketEnvelope.width/10)
                startY: ticketEnvelope.height / 2
                PathLine { x: ticketEnvelope.width - (ticketEnvelope.width/10); y: ticketEnvelope.height / 2 }
            }
        }

    }

}




