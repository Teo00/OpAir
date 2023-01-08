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
            content.dbData = (innerSearchBar.text.length > 0) ? backend.search(2, pageSelectButton.currentPage, innerSearchBar.text) : [[1]]
            updateData()
        }

        function updateData() {

            if(dbData.length-1 >= 1){
                passengerSearchTag1.visible = true
                passengerSearchTag1.passengerID = dbData[1][0]
                passengerSearchTag1.name = dbData[1][1]
                passengerSearchTag1.surname = dbData[1][2]
                passengerSearchTag1.idNum = dbData[1][3]
            }else {
                passengerSearchTag1.visible = false
            }

            if(dbData.length-1 >= 2){
                passengerSearchTag2.visible = true
                passengerSearchTag2.passengerID = dbData[2][0]
                passengerSearchTag2.name = dbData[2][1]
                passengerSearchTag2.surname = dbData[2][2]
                passengerSearchTag2.idNum = dbData[2][3]
            }else {
                passengerSearchTag2.visible = false
            }

            if(dbData.length-1 >= 3){
                passengerSearchTag3.visible = true
                passengerSearchTag3.passengerID = dbData[3][0]
                passengerSearchTag3.name = dbData[3][1]
                passengerSearchTag3.surname = dbData[3][2]
                passengerSearchTag3.idNum = dbData[3][3]
            }else {
                passengerSearchTag3.visible = false
            }

            if(dbData.length-1 >= 4){
                passengerSearchTag4.visible = true
                passengerSearchTag4.passengerID = dbData[4][0]
                passengerSearchTag4.name = dbData[4][1]
                passengerSearchTag4.surname = dbData[4][2]
                passengerSearchTag4.idNum = dbData[4][3]
            }else {
                passengerSearchTag4.visible = false
            }

        }

    }

    InnerSearchBar {
        id: innerSearchBar
        x: 295
        y: 24
        width: 976
        height: 70
        customText: "Search passengers by giving id, name, surname or document id number..."

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
            backend.openWindow(2, 3, "", true)
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

        PassengerSearchTag {
            id: passengerSearchTag1

            visible: false

        }


        PassengerSearchTag {
            id: passengerSearchTag2

            visible: false
        }

        PassengerSearchTag {
            id: passengerSearchTag3

            visible: false
        }

        PassengerSearchTag {
            id: passengerSearchTag4

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
