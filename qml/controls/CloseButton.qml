import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: closeBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"


    QtObject {
        id: internal

        property var dynamicColor: if(closeBtn.down) {
                                       closeBtn.down ? colorPressed : colorDefault
                                   }else {
                                       closeBtn.hovered ? colorHover : colorDefault
                                   }
    }


    implicitWidth: 48
    implicitHeight: 48

    background: Shape {
        ShapePath {
            fillColor: internal.dynamicColor
            strokeWidth: 3
            strokeColor: internal.dynamicColor
            PathSvg { path: "M 13 13 L 35 35 Z M 35 13 L 13 35 Z" }
        }
    }

}


