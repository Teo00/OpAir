import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "controls"
import "others"
import "others/searchtags"
import "pages/search"

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

        stackView.push(Qt.resolvedUrl("pages/search/FlightSearchPage.qml"))
    }

    //Internal Functions
    QtObject {

        id: internal

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
                height: 32
                color: "#ffffff"
                text: "Search in"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                font.pixelSize: 26
                horizontalAlignment: Text.AlignLeft
                anchors.leftMargin: 772
                font.family: "Inter"
                textFormat: Text.RichText
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

            CustomCombobox {
                id: customCombobox
                x: 876
                width: 180
                height: 43
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: parent.right
                anchors.rightMargin: 772

                model: ["Flight", "Passenger", "Airport", "Ticket", "Airplane", "Crew"]

                onActivated: {
                    stackView.clear(StackView.Immediate)
                    stackView.push(Qt.resolvedUrl("pages/search/" + model[currentIndex] + "SearchPage.qml"))
                }

            }




        }

        StackView {
            id: stackView
            x: 25
            y: 102
            width: 1850
            height: 890
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
