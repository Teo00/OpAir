import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: approveBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"
    icon.color: "#ffffff"

    QtObject {
        id: internal

        property var dynamicColor: if(approveBtn.down) {
                                       approveBtn.down ? colorPressed : colorDefault
                                   }else {
                                       approveBtn.hovered ? colorHover : colorDefault
                                   }
    }


    width: 70
    height: 70

    implicitWidth: 70
    implicitHeight: 70


    background: Rectangle {

        id: innerBg
        color: "#1a7eff8b"
        radius: 10

        Shape {
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 2.5
                capStyle: ShapePath.RoundCap
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 21.832 34.782 l 9.9999 9.9999 l 20 -20" }
            }
        }
    }

}






