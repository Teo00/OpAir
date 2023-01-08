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
            content.dbData = (innerSearchBar.text.length > 0) ? backend.search(3, pageSelectButton.currentPage, innerSearchBar.text) : [[1]]
            updateData()
        }

        function updateData() {

            if(dbData.length-1 >= 1){
                airportSearchTag1.visible = true
                airportSearchTag1.airportID = dbData[1][0]
                airportSearchTag1.shortName = dbData[1][1]
                airportSearchTag1.name = dbData[1][2]
            }else {
                airportSearchTag1.visible = false
            }

            if(dbData.length-1 >= 2){
                airportSearchTag2.visible = true
                airportSearchTag2.airportID = dbData[2][0]
                airportSearchTag2.name = dbData[2][2]
                airportSearchTag2.shortName = dbData[2][1]
            }else {
                airportSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                airportSearchTag3.visible = true
                airportSearchTag3.airportID = dbData[3][0]
                airportSearchTag3.name = dbData[3][2]
                airportSearchTag3.shortName = dbData[3][1]
            }else {
                airportSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                airportSearchTag4.visible = true
                airportSearchTag4.airportID = dbData[4][0]
                airportSearchTag4.name = dbData[4][2]
                airportSearchTag4.shortName = dbData[4][1]
            }else {
                airportSearchTag4.visible = false
            }

        }

    }

    InnerSearchBar {
        id: innerSearchBar
        x: 295
        y: 24
        width: 976
        height: 70
        customText: "Search airports by giving name or code..."

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
            backend.openWindow(1, 2, innerSearchBar.text)
        }
    }

    Column {
        id: column
        x: 297
        y: 113
        width: 1256
        height: 666
        spacing: 10

        AirportSearchTag {
            id: airportSearchTag1

            visible: false

        }


        AirportSearchTag {
            id: airportSearchTag2

            visible: false
        }

        AirportSearchTag {
            id: airportSearchTag3

            visible: false
        }

        AirportSearchTag {
            id: airportSearchTag4

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


