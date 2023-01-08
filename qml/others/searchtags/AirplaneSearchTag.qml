import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../../controls"

Item {

    id: airplaneSearchTag
    property color colorBackground: "#00ffffff"

    //DATA

    property string airplaneID: "UNKNOWN"
    property string name: "UNKNOWN"


    width: 1255
    height: 150

    Rectangle {

        id: innerBg
        color: airplaneSearchTag.colorBackground
        radius: 10
        border.color: "#1affffff"
        border.width: 1.5
        anchors.fill: parent

        Shape {
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 1.5
                capStyle: ShapePath.RoundCap
                strokeColor: "#10ffffff"

                startX: 215
                startY: 0
                PathLine { x: 215; y: airplaneSearchTag.height}
            }
        }
        NavigatorButton {
            id: airplaneVar
            x: 33
            y: 74
            width: 145
            height: 40
            customFontSize: 28
            btnText: airplaneSearchTag.airplaneID
            onClicked: backend.openWindow(5, 1, airplaneSearchTag.airplaneID, false)


        }

        Text {
            id: airplaneLabel
            x: 70
            y: 41
            color: "#ffffff"
            text: qsTr("Airplane")
            font.pixelSize: 22
            font.family: "Inter"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: nameLabel
            x: 255
            y: 45
            font.pixelSize: 20
            font.family: "Inter"
            color: "#80ffffff"
            text: "MODEL NAME"
        }

        Text {
            id: nameVar
            x: 423
            y: 45
            font.pixelSize: 22
            font.family: "Inter"
            color: "#ffffff"
            text: airplaneSearchTag.name
        }

    }



}






