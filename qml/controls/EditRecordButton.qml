import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: editRecordBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"
    icon.color: "#ffffff"

    property bool isTicketEdit: false

    QtObject {
        id: internal

        property var dynamicColor: if(editRecordBtn.down) {
                                       editRecordBtn.down ? colorPressed : colorDefault
                                   }else {
                                       editRecordBtn.hovered ? colorHover : colorDefault
                                   }
    }


    width: 70
    height: 70

    implicitWidth: 70
    implicitHeight: 70

    onClicked: {
        if(!isTicketEdit){
            backend.changeMode(2)
            mainWindow.close()
        }
    }

    background: Rectangle {

        id: innerBg
        color: "#1affffff"
        radius: 10

        Shape {
            ShapePath {
                fillColor: "#00ffffff"
                strokeWidth: 2.5
                capStyle: ShapePath.RoundCap
                strokeColor: internal.dynamicColor
                PathSvg { path: "M 20.753 48.867 h 7.3334 l 19.25 -19.25 c 0.9724 -0.9725 1.5188 -2.2914 1.5188 -3.6667 c 0 -1.3752 -0.5464 -2.6941 -1.5188 -3.6666 c -0.9725 -0.9725 -2.2914 -1.5188 -3.6667 -1.5188 c -1.3752 0 -2.6941 0.5464 -3.6666 1.5188 l -19.25 19.25 v 6.2099 z m 17.4169 -24.75 l 7.3334 7.3333" }
            }
        }
    }

}


