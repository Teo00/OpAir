import QtQuick 2.15
import QtQuick.Controls 2.15
import "../controls"
import "../others"

Item {
    id: item1

    width: 1850
    height: 865


    Rectangle {
        id: tempBg
        color: "#030313"
        border.width: 0
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom

        TicketViewTag {
            id: ticketViewTag
            x: 325
            y: 30



        }

        StackView {
            id: content
            x: 325
            y: 260
            width: 1200
            height: 580
            initialItem: Qt.resolvedUrl("ticket/FlightInfoZoneView.qml")
        }

        DeleteRecordButton {
            id: deleteRecordButton
            x: 1546
            y: 160
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
