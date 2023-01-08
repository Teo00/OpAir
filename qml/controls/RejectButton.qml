import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: rejectBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"
    icon.color: "#ffffff"

    property bool isTicketClose: false

    property bool isEditMode: backend.isEditMode()

    QtObject {
        id: internal

        property var dynamicColor: if(rejectBtn.down) {
                                       rejectBtn.down ? colorPressed : colorDefault
                                   }else {
                                       rejectBtn.hovered ? colorHover : colorDefault
                                   }
    }


    width: 70
    height: 70

    implicitWidth: 70
    implicitHeight: 70

    onClicked: {
        if(!isTicketClose){
            if(!isEditMode)
                backend.changeMode(1)
            else
                backend.openWindow(0, 0, 0, true)
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
                PathSvg { path: "M 24 24 l 22 22 z m 22 0 l -22 22 z" }
            }
        }
    }

}





/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
