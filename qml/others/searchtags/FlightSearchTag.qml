import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15
import "../../controls"

Item {

    id: flightSearchTag
    property color colorBackground: "#00ffffff"

    //DATA

    property var flightID
    property string flightCode: "UNKNOWN"
    property string deptLong: "UNKNOWN"
    property string deptShort: "UNK"
    property string arrLong: "UNKNOWN"
    property string arrShort: "UNK"
    property string deptDate: "01.01.1900"
    property string arrDate: "01.01.1900"

    property bool isUsedOnMain: false

    width: 1255
    height: 150
    Rectangle {

        id: innerBg
        color: flightSearchTag.colorBackground
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

                startX: 200 + (flightSearchTag.width / 10)
                startY: flightSearchTag.height / 2
                PathLine { x: flightSearchTag.width - (flightSearchTag.width/10); y: flightSearchTag.height / 2 }
            }
        }
        NavigatorButton {
            id: flightCodeVar
            x: 33
            y: 74
            width: 145
            height: 40
            customFontSize: 28
            btnText: flightSearchTag.flightCode
            onClicked: backend.openWindow(1, 1, flightSearchTag.flightID, !isUsedOnMain)
        }

        Text {
            id: flightLabel
            x: 77
            y: 41
            color: "#ffffff"
            text: qsTr("Flight")
            font.pixelSize: 22
            font.family: "Inter"
            horizontalAlignment: Text.AlignHCenter
        }

        Text {
            id: departureDateVar
            x: 245
            y: 29
            text: flightSearchTag.deptDate
            font.pixelSize: 20
            font.family: "Inter"
            color: "#80ffffff"
        }

        Text {
            id: departureShortVar
            x: 245
            y: 62
            text: flightSearchTag.deptShort
            font.pixelSize: 22
            font.family: "Inter"
            color: "#ffffff"
        }

        Text {
            id: departureLongVar
            x: 245
            y: 97
            text: flightSearchTag.deptLong
            font.pixelSize: 20
            font.family: "Inter"
            color: "#80ffffff"
        }

        Text {
            id: arrivalDateVar
            x: 1104
            y: 31
            color: "#80ffffff"
            text: flightSearchTag.arrDate
            anchors.right: parent.right
            font.pixelSize: 20
            horizontalAlignment: Text.AlignRight
            anchors.rightMargin: 53
            font.family: "Inter"
        }

        Text {
            id: arrivalShortVar
            x: 1155
            y: 62
            color: "#ffffff"
            text: flightSearchTag.arrShort
            anchors.right: parent.right
            font.pixelSize: 22
            horizontalAlignment: Text.AlignRight
            anchors.rightMargin: 53
            font.family: "Inter"
        }

        Text {
            id: arrivalLongVar
            x: 1095
            y: 95
            color: "#80ffffff"
            text: flightSearchTag.arrLong
            anchors.right: parent.right
            font.pixelSize: 20
            horizontalAlignment: Text.AlignRight
            anchors.rightMargin: 53
            font.family: "Inter"
        }

    }

    Connections {
        target: backend
    }



}






