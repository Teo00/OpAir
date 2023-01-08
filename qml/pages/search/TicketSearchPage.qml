import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import "../../controls"
import "../../others"
import "../../others/searchtags"

Item {

    id: content
    width: 1850
    height: 890

    property var dbData: [[1]]

    QtObject {

        id: internal

        function updateDb() {
            content.dbData = (innerSearchBar.text.length > 0) ? backend.search(4, pageSelectButton.currentPage, innerSearchBar.text) : [[1]]
            updateData()
        }

        function updateData() {

            // totalPage(index 0) + ticket: [ticketID, PNR, fromShort, toShort, deptDate, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare]

            if(dbData.length-1 >= 1){
                ticketSearchTag1.visible = true
                ticketSearchTag1.ticketID = dbData[1][0]
                ticketSearchTag1.ticketPNR = dbData[1][1]
                ticketSearchTag1.deptShort = dbData[1][2]
                ticketSearchTag1.arrShort = dbData[1][3]
                ticketSearchTag1.deptDate = dbData[1][4]
                ticketSearchTag1.passengerName = dbData[1][5]
                ticketSearchTag1.passengerSurname = dbData[1][6]
                ticketSearchTag1.hasCheckedIn = dbData[1][7]
                ticketSearchTag1.hasBoarded = dbData[1][8]
                ticketSearchTag1.fare = dbData[1][9]
            }else {
                ticketSearchTag1.visible = false
            }

            if(dbData.length-1 >= 2){
                ticketSearchTag2.visible = true
                ticketSearchTag2.ticketID = dbData[2][0]
                ticketSearchTag2.ticketPNR = dbData[2][1]
                ticketSearchTag2.deptShort = dbData[2][2]
                ticketSearchTag2.arrShort = dbData[2][3]
                ticketSearchTag2.deptDate = dbData[2][4]
                ticketSearchTag2.passengerName = dbData[2][5]
                ticketSearchTag2.passengerSurname = dbData[2][6]
                ticketSearchTag2.hasCheckedIn = dbData[2][7]
                ticketSearchTag2.hasBoarded = dbData[2][8]
                ticketSearchTag2.fare = dbData[2][9]
            }else {
                ticketSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                ticketSearchTag3.visible = true
                ticketSearchTag3.ticketID = dbData[3][0]
                ticketSearchTag3.ticketPNR = dbData[3][1]
                ticketSearchTag3.deptShort = dbData[3][2]
                ticketSearchTag3.arrShort = dbData[3][3]
                ticketSearchTag3.deptDate = dbData[3][4]
                ticketSearchTag3.passengerName = dbData[3][5]
                ticketSearchTag3.passengerSurname = dbData[3][6]
                ticketSearchTag3.hasCheckedIn = dbData[3][7]
                ticketSearchTag3.hasBoarded = dbData[3][8]
                ticketSearchTag3.fare = dbData[3][9]
            }else {
                ticketSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                ticketSearchTag4.visible = true
                ticketSearchTag4.ticketID = dbData[4][0]
                ticketSearchTag4.ticketPNR = dbData[4][1]
                ticketSearchTag4.deptShort = dbData[4][2]
                ticketSearchTag4.arrShort = dbData[4][3]
                ticketSearchTag4.deptDate = dbData[4][4]
                ticketSearchTag4.passengerName = dbData[4][5]
                ticketSearchTag4.passengerSurname = dbData[4][6]
                ticketSearchTag4.hasCheckedIn = dbData[4][7]
                ticketSearchTag4.hasBoarded = dbData[4][8]
                ticketSearchTag4.fare = dbData[4][9]
            }else {
                ticketSearchTag4.visible = false
            }

        }

    }
    Rectangle {
        color: "#00ffffff"
        anchors.fill: parent
        InnerSearchBar {
            id: innerSearchBar
            x: 295
            y: 24
            width: 976
            height: 70
            customText: "Search tickets by giving PNR, flight code or passenger info..."

            onTextChanged: {
                pageSelectButton.currentPage = 1
                internal.updateDb()
            }

        }

        CreateNewButton {
            id: createNewButton
            x: 1291
            y: 24

            onClicked: {
                backend.openWindow(4, 3, "", true)
                mainWindow.close()
            }
        }

        Column {
            id: column
            x: 297
            y: 113
            width: 1256
            height: 666
            spacing: 10



            TicketSearchTag {
                id: ticketSearchTag1

                visible: false
            }

            TicketSearchTag {
                id: ticketSearchTag2

                visible: false
            }

            TicketSearchTag {
                id: ticketSearchTag3

                visible: false
            }

            TicketSearchTag {
                id: ticketSearchTag4

                visible: false
            }
            Text {
                id: endLabel
                color: "#80ffffff"
                text: qsTr("End of results.")
                font.pixelSize: 24
                font.family: "Inter"
                visible: pageSelectButton.currentPage == pageSelectButton.lastPage
            }
        }

        PageSelectButton {
            id: pageSelectButton
            x: 1301
            y: 787

            lastPage: content.dbData[0][0]

            onPageChanged: internal.updateDb()
        }

        Connections {
            target: backend
        }


    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
