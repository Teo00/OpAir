import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../../controls"

Item {

    id: airportSearchTag
    property color colorBackground: "#00ffffff"

    //DATA

    property string airportID: "UNKNOWN"
    property string name: "UNKNOWN"
    property string shortName: "UNK"


    width: 1255
    height: 150
    Rectangle {

        id: innerBg
        color: airportSearchTag.colorBackground
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
                PathLine { x: 215; y: airportSearchTag.height}
            }
        }
        NavigatorButton {
            id: airportVar
            x: 33
            y: 74
            width: 145
            height: 40
            customFontSize: 28
            btnText: airportSearchTag.shortName
            onClicked: backend.openWindow(3, 1, airportSearchTag.airportID, false)


        }

        Text {
            id: airportLabel
            x: 70
            y: 41
            color: "#ffffff"
            text: qsTr("Airport")
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
            text: "NAME"
        }

        Text {
            id: nameVar
            x: 406
            y: 45
            font.pixelSize: 22
            font.family: "Inter"
            color: "#ffffff"
            text: airportSearchTag.name
        }

        Text {
            id: shortNameLabel
            x: 255
            y: 82
            color: "#80ffffff"
            text: "SHORT NAME"
            font.pixelSize: 20
            font.family: "Inter"
        }

        Text {
            id: shortNameVar
            x: 406
            y: 82
            color: "#ffffff"
            text: airportSearchTag.shortName
            font.pixelSize: 22
            font.family: "Inter"
        }

    }



}






