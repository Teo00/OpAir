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
                id: backText1
                y: 26
                color: "#ffffff"
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p align=\"center\" style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Inter'; font-size:20pt;\">Passenger / 123456</span></p></body></html>"
                anchors.left: parent.left
                anchors.right: parent.right
                font.pixelSize: 26
                horizontalAlignment: Text.AlignHCenter
                anchors.rightMargin: 765
                font.family: "Tahoma"
                textFormat: Text.RichText
                anchors.leftMargin: 765
            }

            CloseButton {
                id: closeButton
                x: 1774
                y: 19
                anchors.right: parent.right
                anchors.rightMargin: 28
                onClicked: mainWindow.close()
            }

            MinimizeButton {
                id: minimizeButton
                x: 1725
                y: 19
                anchors.right: parent.right
                anchors.rightMargin: 77
                onClicked: mainWindow.showMinimized()
            }

            BackButton {
                id: backButton
                x: 8
                y: 19
            }




        }



        Rectangle {
            id: content
            x: 25
            width: 1850
            color: "#00ffffff"
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.rightMargin: 25
            anchors.topMargin: 110

            LinkRecordButton {
                id: linkRecordButton
                x: 1720
                anchors.top: parent.top
                anchors.topMargin: 36
            }

            NewRecordButton {
                id: newRecordButton
                x: 1601
                anchors.top: parent.top
                anchors.topMargin: 36
            }

            TicketEnvelope {
                id: ticketEnvelope
                x: 580
                y: 147
                width: 1240
                height: 200

                Tick {
                    id: greenTick
                    x: 1138
                    y: 23
                }

                Text {
                    id: checkInText
                    x: 974
                    y: 24
                    color: "#80000000"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Inter'; font-size:18pt; color:rgba(255,255,255,0.501961);\">CHECK IN</span></p></body></html>"
                    font.pixelSize: 12
                    textFormat: Text.RichText
                }

                Text {
                    id: boardedText
                    x: 975
                    y: 79
                    color: "#80000000"
                    text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><meta charset=\"utf-8\" /><style type=\"text/css\">\np, li { white-space: pre-wrap; }\nhr { height: 1px; border-width: 0; }\n</style></head><body style=\" font-family:'Segoe UI'; font-size:9pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-family:'Inter'; font-size:18pt; color:rgba(255,255,255,0.5);\">BOARDED</span></p></body></html>"
                    font.pixelSize: 12
                    textFormat: Text.RichText
                }

                NavigatorButton {
                    id: navigatorButton
                    x: 580
                    y: 108
                }
            }

            PageSelectButton {
                id: pageSelectButton
                x: 1567
                y: 757
                lastPage: 5
                currentPage: 3
            }

            InnerSearchBar {
                id: innerSearchBar
                x: 586
                y: 36
                width: 990
                height: 70
            }

            DoubleSwitch {
                id: doubleSwitch
                x: 1299
                y: 624
            }

            EditRecordButton {
                id: editRecordButton
                x: 269
                y: 28
            }

            DeleteRecordButton {
                id: deleteRecordButton
                x: 373
                y: 28
            }
        }
    }
}




