import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: newRecordBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"
    icon.color: "#ffffff"

    QtObject {
        id: internal

        property var dynamicColor: if(newRecordBtn.down) {
                                       newRecordBtn.down ? colorPressed : colorDefault
                                   }else {
                                       newRecordBtn.hovered ? colorHover : colorDefault
                                   }
    }


    width: 100
    height: 70

    implicitWidth: 100
    implicitHeight: 70


    background: Rectangle {

        id: innerBg
        color: "#1dffffff"
        radius: 10

        Shape {
            ShapePath {
                fillColor: internal.dynamicColor
                strokeWidth: 3
                capStyle: ShapePath.RoundCap
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 50 17.5 L 50 52.5 Z M 32.5 35 L 67.5 35 Z" }
            }
        }
    }

}


