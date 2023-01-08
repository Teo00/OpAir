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

        TicketEditTag {
            id: ticketEditTag
            x: 325
            y: 30

        }

        ApproveButton {
            id: approveButton
            x: 1544
            y: 160

            onClicked: {

                //fare,hasBoarded,hasCheckedIn
                var goData = [ticketEditTag.fareVar, ticketEditTag.boardedTick, ticketEditTag.checkInTick]
                backend.updateAllData(goData)
                backend.changeMode(1)
                mainWindow.close()
            }
        }

        RejectButton {
            id: rejectButton
            x: 1544
            y: 30
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
