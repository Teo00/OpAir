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
            content.dbData = (innerSearchBar.text.length > 0) ? backend.search(1, pageSelectButton.currentPage, innerSearchBar.text) : [[1]]
            updateData()
        }

        function updateData() {

            // totalPage(index 0) + flight: [flightID, flightCode, fromShort, fromLong, toShort, toLong, deptDate, arrDate]

            if(dbData.length-1 >= 1){
                flightSearchTag1.visible = true
                flightSearchTag1.flightID = dbData[1][0]
                flightSearchTag1.flightCode = dbData[1][1]
                flightSearchTag1.deptShort = dbData[1][2]
                flightSearchTag1.deptLong = dbData[1][3]
                flightSearchTag1.arrShort = dbData[1][4]
                flightSearchTag1.arrLong = dbData[1][5]
                flightSearchTag1.deptDate = dbData[1][6]
                flightSearchTag1.arrDate = dbData[1][7]
            }else {
                flightSearchTag1.visible = false
            }

            if(dbData.length-1 >= 2){
                flightSearchTag2.visible = true
                flightSearchTag2.flightID = dbData[2][0]
                flightSearchTag2.flightCode = dbData[2][1]
                flightSearchTag2.deptShort = dbData[2][2]
                flightSearchTag2.deptLong = dbData[2][3]
                flightSearchTag2.arrShort = dbData[2][4]
                flightSearchTag2.arrLong = dbData[2][5]
                flightSearchTag2.deptDate = dbData[1][6]
                flightSearchTag2.arrDate = dbData[1][7]
            }else {
                flightSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                flightSearchTag3.visible = true
                flightSearchTag3.flightID = dbData[3][0]
                flightSearchTag3.flightCode = dbData[3][1]
                flightSearchTag3.deptShort = dbData[3][2]
                flightSearchTag3.deptLong = dbData[3][3]
                flightSearchTag3.arrShort = dbData[3][4]
                flightSearchTag3.arrLong = dbData[3][5]
                flightSearchTag3.deptDate = dbData[1][6]
                flightSearchTag3.arrDate = dbData[1][7]
            }else {
                flightSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                flightSearchTag4.visible = true
                flightSearchTag4.flightID = dbData[4][0]
                flightSearchTag4.flightCode = dbData[4][1]
                flightSearchTag4.deptShort = dbData[4][2]
                flightSearchTag4.deptLong = dbData[4][3]
                flightSearchTag4.arrShort = dbData[4][4]
                flightSearchTag4.arrLong = dbData[4][5]
                flightSearchTag4.deptDate = dbData[1][6]
                flightSearchTag4.arrDate = dbData[1][7]
            }else {
                flightSearchTag4.visible = false
            }

        }

    }

    InnerSearchBar {
        id: innerSearchBar
        x: 295
        y: 24
        width: 976
        height: 70
        customText: "Search flights by giving flight code or airport info..."

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
            backend.openWindow(1, 3, "", true)
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

        FlightSearchTag {
            id: flightSearchTag1

            visible: false

        }


        FlightSearchTag {
            id: flightSearchTag2

            visible: false
        }

        FlightSearchTag {
            id: flightSearchTag3

            visible: false
        }

        FlightSearchTag {
            id: flightSearchTag4

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

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
