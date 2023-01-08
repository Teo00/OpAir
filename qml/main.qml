import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"
import "others"

Window {
    id: mainWindow
    width: 1900
    height: 1000
    visible: true
    color: "#a2000000"
    title: qsTr("OpAir - Airline Management System")



    //Remove Title Bar
    flags: Qt.Window | Qt.FramelessWindowHint

    Component.onCompleted: {
        x = Screen.width / 2 - width / 2
        y = (Screen.height / 2 - height / 2) - 10
    }

    //Internal Functions
    QtObject {

        id: internal

        function func(){
            mainWindow.deleteLater()
        }

    }

    Rectangle {
        id: appContainer
        x: 11
        y: 11
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: topBar
            height: 85
            color: "#00ff0000"
            border.width: 0
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 25
            anchors.leftMargin: 25
            anchors.topMargin: 10

            DragHandler {

                onActiveChanged: if(active){
                                     mainWindow.startSystemMove()
                                 }

            }

            Text {
                id: topIndicatorVar
                y: 26
                color: "#ffffff"
                text: backend.getTitle()
                anchors.left: parent.left
                anchors.right: parent.right
                font.pointSize: 20
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 765
                font.family: "Inter"
                textFormat: Text.RichText
                anchors.leftMargin: 765
            }

            CloseButton {
                id: closeButton
                x: 1774
                y: 19
                anchors.right: parent.right
                anchors.rightMargin: 25
                onClicked: mainWindow.close()
            }

            MinimizeButton {
                id: minimizeButton
                x: 1725
                y: 19
                anchors.right: parent.right
                anchors.rightMargin: 75
                onClicked: mainWindow.showMinimized()
            }

            BackButton {
                id: backButton
                y: 19
                anchors.left: parent.left
                anchors.leftMargin: 10
            }
        }


        Rectangle {
            id: content
            color: "#00ffffff"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 25
            anchors.bottomMargin: 25
            anchors.rightMargin: 25
            anchors.topMargin: 110

            StackView {
                id: cstackView
                anchors.fill: parent
                initialItem: Qt.resolvedUrl(backend.getPageForStackView())
            }
        }
    }

    Connections {

        target: backend

    }

    
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
