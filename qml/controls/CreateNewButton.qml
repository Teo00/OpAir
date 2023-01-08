import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: createNewBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    width: 260
    height: 70

    implicitWidth: 260
    implicitHeight: 70

    QtObject {
        id: internal

        property var dynamicColor: if(createNewBtn.down) {
                                       createNewBtn.down ? colorPressed : colorDefault
                                   }else {
                                       createNewBtn.hovered ? colorHover : colorDefault
                                   }
    }

    Text {
        id: text1
        x: 80
        y: 19
        color: internal.dynamicColor
        text: "Create New"
        font.pointSize: 20
        font.family: "Inter"
        textFormat: Text.RichText
    }

    background: Rectangle {
        color: "#1affffff"
        radius: 10
        Shape {
            ShapePath {
                fillColor: internal.dynamicColor
                strokeWidth: 3
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 40 17.5 l 0 35 z m -17.5 17.5 l 35 0 z" }
            }
        }
    }

}




