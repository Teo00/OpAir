import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: searchButton

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    QtObject {
        id: internal

        property var dynamicColor: if(searchButton.down) {
                                       searchButton.down ? colorPressed : colorDefault
                                   }else {
                                       searchButton.hovered ? colorHover : colorDefault
                                   }
    }

    width: 70
    height: 70
    background: Rectangle {

        id: innerBg
        color: "#0dffffff"
        radius: 10

        Shape {
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 2
                capStyle: ShapePath.RoundCap
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 50 50 l -9.3333 -9.3333 m 3.1111 -7.7778 c 0 6.0138 -4.8751 10.8889 -10.8889 10.8889 c -6.0138 0 -10.8889 -4.8751 -10.8889 -10.8889 c 0 -6.0138 4.8751 -10.8889 10.8889 -10.8889 c 6.0138 0 10.8889 4.8751 10.8889 10.8889" }
            }
        }
    }

}
