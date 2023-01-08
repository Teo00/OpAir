import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../../controls"

Item {

    id: crewSearchTag
    property color colorBackground: "#00ffffff"

    //DATA

    property string crewID: "UNKNOWN"
    property string name: "UNKNOWN"
    property string surname: "UNKNOWN"
    property string crewType: "UNKNOWN"


    width: 1255
    height: 150

    Rectangle {

        id: innerBg
        color: crewSearchTag.colorBackground
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
                PathLine { x: 215; y: crewSearchTag.height}
            }
        }
        NavigatorButton {
            id: crewVar
            x: 33
            y: 74
            width: 145
            height: 40
            customFontSize: 28
            btnText: crewSearchTag.crewID
            onClicked: backend.openWindow(6, 1, crewSearchTag.crewID, false)


        }

        Text {
            id: crewLabel
            x: 70
            y: 41
            color: "#ffffff"
            text: qsTr("Crew")
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
            x: 379
            y: 45
            font.pixelSize: 22
            font.family: "Inter"
            color: "#ffffff"
            text: crewSearchTag.name
        }

        Text {
            id: surnameLabel
            x: 255
            y: 82
            color: "#80ffffff"
            text: "SURNAME"
            font.pixelSize: 20
            font.family: "Inter"
        }

        Text {
            id: surnameVar
            x: 379
            y: 82
            color: "#ffffff"
            text: crewSearchTag.surname
            font.pixelSize: 22
            font.family: "Inter"
        }

        Text {
            id: crewTypeLabel
            x: 598
            y: 45
            color: "#80ffffff"
            text: "CREW TYPE"
            font.pixelSize: 20
            font.family: "Inter"
        }

        Text {
            id: crewTypeVar
            x: 755
            y: 45
            color: "#ffffff"
            text: crewSearchTag.crewType
            font.pixelSize: 22
            font.family: "Inter"
        }

    }



}






