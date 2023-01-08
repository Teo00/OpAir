import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Rectangle {

    id: pageSelectBg

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    property color colorBackground: "#1dffffff"

    property int currentPage: 1
    property int lastPage: 1

    signal pageChanged

    width: 250
    height: 70

    implicitWidth: 250
    implicitHeight: 70

    color: colorBackground

    radius: 10


    QtObject {
        id: internal

        property var leftDynamicColor: if(leftBtn.down) {
                                       leftBtn.down ? colorPressed : colorDefault
                                   }else {
                                       leftBtn.hovered ? colorHover : colorDefault
                                   }

        property var rightDynamicColor: if(rightBtn.down) {
                                       rightBtn.down ? colorPressed : colorDefault
                                   }else {
                                       rightBtn.hovered ? colorHover : colorDefault
                                   }
    }

    Button {
        id: leftBtn
        text: qsTr("")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 180
        anchors.leftMargin: 0
        anchors.bottomMargin: 0
        anchors.topMargin: 0

        enabled: currentPage!=1

        background: Shape {
            ShapePath {
                fillColor: internal.leftDynamicColor
                strokeWidth: 1
                capStyle: ShapePath.RoundCap
                strokeColor: internal.leftDynamicColor
                PathSvg { path: "M 25 35 l 11.424 -11.6952 c 0.7272 -0.744 0.7128 -1.9296 -0.0288 -2.652 c -0.7416 -0.7296 -1.9272 -0.7032 -2.652 0.0288 l -12.732 13.0392 c -0.7272 0.744 -0.7104 1.932 0.0288 2.652 l 13.0392 12.7368 c 0.3648 0.3552 0.84 0.5352 1.3128 0.5352 c 0.4872 0 0.9744 -0.192 1.3416 -0.5664 c 0.7272 -0.7416 0.708 -1.9272 -0.0288 -2.6496 l -11.7048 -11.4288 z" }
            }
        }

        onClicked: {
            currentPage = currentPage - 1
            pageSelectButton.pageChanged()
        }
    }

    Button {
        id: rightBtn
        text: qsTr("")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.topMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 180

        enabled: currentPage!=lastPage

        background: Shape {
            ShapePath {
                fillColor: internal.rightDynamicColor
                strokeWidth: 1
                capStyle: ShapePath.RoundCap
                strokeColor: internal.rightDynamicColor
                PathSvg { path: "M 45 35 l -11.424 -11.6952 c -0.7272 -0.744 -0.7128 -1.9296 0.0288 -2.652 c 0.7416 -0.7296 1.9272 -0.7032 2.652 0.0288 l 12.7344 13.0392 c 0.7296 0.744 0.7104 1.932 -0.0288 2.652 l -13.0368 12.7368 c -0.3648 0.3552 -0.84 0.5352 -1.3128 0.5352 c -0.4872 0 -0.9744 -0.192 -1.3416 -0.5664 c -0.7272 -0.7416 -0.708 -1.9272 0.0288 -2.6496 l 11.7 -11.4288 z" }

            }
        }

        onClicked: {
            currentPage = currentPage + 1
            pageSelectButton.pageChanged()
        }
    }

    Text {
        id: pageNumber
        x: 88
        y: 18
        color: "#bfffffff"
        textFormat: Text.RichText
        font.family: "Inter"
        font.pixelSize: 28
        text: currentPage + " ... " + lastPage

    }

}




