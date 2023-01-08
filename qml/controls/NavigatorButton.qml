import QtQuick 2.15
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.15

Button {

    id: navigatorBtn

    property color colorDefault: "#ffffff"
    property color colorHover: "#cccccc"
    property color colorPressed: "#333333"

    property string btnText: "Unknown"

    property var dataID

    property int customWidth: 135
    property int customHeight: 50

    property int customFontSize: 20

    QtObject {
        id: internal

        property var dynamicColor: if(navigatorBtn.down) {
                                       navigatorBtn.down ? colorPressed : colorDefault
                                   }else {
                                       navigatorBtn.hovered ? colorHover : colorDefault
                                   }
    }

    implicitWidth: customWidth
    implicitHeight: customHeight

    background: Rectangle {

        id: innerBg
        color: "#1dffffff"
        radius: 10
    }

    contentItem: Text {
        text: navigatorBtn.btnText
        color: internal.dynamicColor
        font.family: "Jetbrains Mono"
        font.pixelSize: customFontSize
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter

        textFormat: Text.RichText

        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        anchors.rightMargin: 8
        anchors.leftMargin: 8
        anchors.bottomMargin: 5
        anchors.topMargin: 5
    }

    onClicked: {
        mainWindow.close()
    }

}



/*##^##
Designer {
    D{i:0;formeditorZoom:1.75;height:50;width:135}
}
##^##*/
