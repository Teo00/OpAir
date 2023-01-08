import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../../controls"

Item {

    id: passengerSearchTag
    property color colorBackground: "#00ffffff"

    //DATA

    property string passengerID: "UNKNOWN"
    property string name: "UNKNOWN"
    property string surname: "UNK"
    property string idNum: "11111111111"


    width: 1255
    height: 150
    Rectangle {

        id: innerBg
        color: passengerSearchTag.colorBackground
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
                PathLine { x: 215; y: passengerSearchTag.height}
            }
        }
        NavigatorButton {
            id: passengerVar
            x: 33
            y: 74
            width: 145
            height: 40
            customFontSize: 28
            btnText: passengerSearchTag.passengerID
            onClicked: backend.openWindow(2, 1, passengerSearchTag.passengerID, true)


        }

        Text {
            id: passengerLabel
            x: 51
            y: 41
            color: "#ffffff"
            text: qsTr("Passenger")
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
            x: 395
            y: 45
            font.pixelSize: 22
            font.family: "Inter"
            color: "#ffffff"
            text: passengerSearchTag.name
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
            x: 395
            y: 82
            color: "#ffffff"
            text: passengerSearchTag.surname
            font.pixelSize: 22
            font.family: "Inter"
        }

        Text {
            id: idLabel
            x: 591
            y: 45
            color: "#80ffffff"
            text: "IDENTITY NUMBER"
            font.pixelSize: 20
            font.family: "Inter"
        }

        Text {
            id: idVar
            x: 816
            y: 45
            width: 112
            height: 27
            color: "#ffffff"
            text: passengerSearchTag.idNum
            font.pixelSize: 22
            font.family: "Inter"
        }

    }



}






