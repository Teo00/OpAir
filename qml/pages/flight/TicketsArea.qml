import QtQuick 2.15
import QtQuick.Controls 2.15
import "../../controls"
import "../../others"

Item {
    id: ticketsArea

    width: 1220
    height: 640

    property var dbData: [[1]]

    property int windowID: 1

    Component.onCompleted: {


        internal.updateDb()
    }

    QtObject {

        id: internal

        function updateDb() {
            if(windowID == 1)
                ticketsArea.dbData = backend.search(1, pageSelectButton.currentPage, innerSearchBar.text, backend.getFlightID())
            else if(windowID == 2)
                ticketsArea.dbData = backend.search(2, pageSelectButton.currentPage, innerSearchBar.text, backend.getPassengerID())
            updateData()
        }

        function updateData() {

            // totalPage(index 0) + [ticketID, PNR, passengerID fromShort, toShort, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare, flightCode]

            if(dbData.length-1 >= 1){
                ticketEnvelope1.visible = true
                ticketEnvelope1.ticketID = dbData[1][0]
                ticketEnvelope1.ticketPNR = dbData[1][1]
                passengerBtn1.btnText = dbData[1][2]
                flightRouteVar1.text = dbData[1][3] + " - " + dbData[1][4]
                passengerVar1.text = dbData[1][5] + " " + dbData[1][6]
                checkinTick1.isEnabled = dbData[1][7]
                boardedTick1.isEnabled = dbData[1][8]
                fareVar1.text = dbData[1][9] + "₺"
                if(windowID == 2)
                    flightCode1.btnText = dbData[1][10]
                else if(windowID == 1)
                    flightCode1.btnText = backend.getFlightCode()
            }else {
                ticketEnvelope1.visible = false
            }

            if(dbData.length-1 >= 2){
                ticketEnvelope2.visible = true
                ticketEnvelope2.ticketID = dbData[2][0]
                ticketEnvelope2.ticketPNR = dbData[2][1]
                passengerBtn2.btnText = dbData[2][2]
                flightRouteVar2.text = dbData[2][3] + " - " + dbData[2][4]
                passengerVar2.text = dbData[2][5] + " " + dbData[2][6]
                checkinTick2.isEnabled = dbData[2][7]
                boardedTick2.isEnabled = dbData[2][8]
                fareVar2.text = dbData[2][9] + "₺"
                if(windowID == 2)
                    flightCode2.btnText = dbData[2][10]
                else if(windowID == 1)
                    flightCode2.btnText = backend.getFlightCode()
            }else {
                ticketEnvelope2.visible = false
            }

            if(dbData.length-1 >= 3){
                ticketEnvelope3.visible = true
                ticketEnvelope3.ticketID = dbData[3][0]
                ticketEnvelope3.ticketPNR = dbData[3][1]
                passengerBtn3.btnText = dbData[3][2]
                flightRouteVar3.text = dbData[3][3] + " - " + dbData[3][4]
                passengerVar3.text = dbData[3][5] + " " + dbData[3][6]
                checkinTick3.isEnabled = dbData[3][7]
                boardedTick3.isEnabled = dbData[3][8]
                fareVar3.text = dbData[3][9] + "₺"
                if(windowID == 2)
                    flightCode3.btnText = dbData[3][10]
                else if(windowID == 1)
                    flightCode3.btnText = backend.getFlightCode()
            }else {
                ticketEnvelope3.visible = false
            }

            if(dbData.length-1 >= 4){
                ticketEnvelope4.visible = true
                ticketEnvelope4.ticketID = dbData[1][0]
                ticketEnvelope4.ticketPNR = dbData[1][1]
                passengerBtn4.btnText = dbData[1][2]
                flightRouteVar4.text = dbData[1][3] + " - " + dbData[1][4]
                passengerVar4.text = dbData[1][5] + " " + dbData[1][6]
                checkinTick4.isEnabled = dbData[1][7]
                boardedTick4.isEnabled = dbData[1][8]
                fareVar4.text = dbData[1][9] + "₺"
                if(windowID == 2)
                    flightCode4.btnText = dbData[4][10]
                else if(windowID == 1)
                    flightCode4.btnText = backend.getFlightCode()
            }else {
                ticketEnvelope4.visible = false
            }

        }

    }


    Rectangle {
        id: tempBg
        x: 0
        y: 0
        width: 1220
        height: 640
        color: "#030313"

        TicketEnvelope {
            id: ticketEnvelope1
            x: 0
            y: 0
            width: 1220
            height: 150

            property var ticketID
            property string ticketPNR: ""

            NavigatorButton {
                id: ticketPNRVar1
                x: 54
                y: 55
                width: 145
                height: 40
                btnText: ticketEnvelope1.ticketPNR
                customFontSize: 28
                onClicked: backend.openWindow(4, 1, ticketEnvelope1.ticketID, false)
            }

            Text {
                id: ticketLabel1
                x: 95
                y: 22
                color: "#ffffff"
                text: qsTr("Ticket")
                font.pixelSize: 22
                font.family: "Inter"
                horizontalAlignment: Text.AlignHCenter
            }

            Text {
                id: passengerLabel1
                x: 286
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "PASSENGER"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: passengerBtn1
                x: 277
                width: 155
                anchors.top: passengerLabel1.bottom
                anchors.topMargin: 10
                btnText: "123456"
                customFontSize: 28
                enabled: windowID == 2 ? false : true
                onClicked: backend.openWindow(2, 1, btnText, false)


            }

            Text {
                id: passengerVar1
                x: 276
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: passengerBtn1.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 10
                font.family: "Inter"
                enabled: windowID == 2 ? false : true
            }

            Text {
                id: checkinLabel1
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "CHECK-IN"
                anchors.top: parent.top
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 21
                font.family: "Inter"
            }

            Tick {
                id: checkinTick1
                x: 1161
                anchors.top: parent.top
                anchors.topMargin: 21
                isButton: false
            }

            Text {
                id: boardedLabel1
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "BOARDED"
                anchors.top: checkinLabel1.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 12
                font.family: "Inter"
            }

            Tick {
                id: boardedTick1
                x: 1161
                anchors.top: checkinTick1.bottom
                anchors.topMargin: 0
                isButton: false
            }

            Text {
                id: fareLabel1
                x: 945
                y: 152
                width: 53
                height: 24
                color: "#80ffffff"
                text: "FARE"
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 24
                font.family: "Inter"
            }

            Text {
                id: fareVar1
                x: 1004
                y: 148
                width: 189
                height: 32
                color: "#ffffff"
                text: "1234.56₺"
                anchors.bottom: parent.bottom
                font.pixelSize: 28
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 19
                font.styleName: "Regular"
                font.bold: false
                font.family: "Jetbrains Mono"
            }

            Text {
                id: flightLabel1
                x: 512
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "FLIGHT"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: flightCode1
                x: 503
                y: 50
                width: 155
                customFontSize: 28

                enabled: windowID == 1 ? false : true
            }

            Text {
                id: flightRouteVar1
                x: 502
                y: 110
                width: 157
                height: 26
                color: "#ffffff"
                text: "NTE - IST"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }
        }

        TicketEnvelope {
            id: ticketEnvelope2
            x: 0
            y: 163
            width: 1220
            height: 150

            property var ticketID
            property string ticketPNR: ""

            Text {
                id: passengerLabel2
                x: 286
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "PASSENGER"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: passengerBtn2
                x: 277
                width: 155
                anchors.top: passengerLabel2.bottom
                anchors.topMargin: 10
                btnText: "123456"
                customFontSize: 28
                onClicked: backend.openWindow(2, 1, btnText, false)

                enabled: windowID == 2 ? false : true
            }

            Text {
                id: passengerVar2
                x: 276
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: passengerBtn2.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 10
                font.family: "Inter"
                enabled: windowID == 2 ? false : true
            }

            Text {
                id: checkinLabel2
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "CHECK-IN"
                anchors.top: parent.top
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 21
                font.family: "Inter"
            }

            Tick {
                id: checkinTick2
                x: 1161
                anchors.top: parent.top
                anchors.topMargin: 21
                isButton: false
            }

            Text {
                id: boardedLabel2
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "BOARDED"
                anchors.top: checkinLabel2.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 12
                font.family: "Inter"
            }

            Tick {
                id: boardedTick2
                x: 1161
                anchors.top: checkinTick2.bottom
                anchors.topMargin: 0
                isButton: false
            }

            Text {
                id: fareLabel2
                x: 945
                y: 152
                width: 53
                height: 24
                color: "#80ffffff"
                text: "FARE"
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 24
                font.family: "Inter"
            }

            Text {
                id: fareVar2
                x: 1004
                y: 148
                width: 189
                height: 32
                color: "#ffffff"
                text: "1234.56₺"
                anchors.bottom: parent.bottom
                font.pixelSize: 28
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 19
                font.styleName: "Regular"
                font.bold: false
                font.family: "Jetbrains Mono"
            }

            Text {
                id: ticketLabel2
                x: 95
                y: 23
                color: "#ffffff"
                text: qsTr("Ticket")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: ticketPNRVar2
                x: 54
                y: 56
                width: 145
                height: 40
                btnText: ticketEnvelope2.ticketPNR
                customFontSize: 28
                onClicked: backend.openWindow(4, 1, ticketEnvelope2.ticketID, false)
            }

            Text {
                id: flightLabel2
                x: 512
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "FLIGHT"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: flightCode2
                x: 503
                y: 50
                width: 155
                customFontSize: 28
                enabled: windowID == 1 ? false : true
            }

            Text {
                id: flightRouteVar2
                x: 502
                y: 110
                width: 157
                height: 26
                color: "#ffffff"
                text: "NTE - IST"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"

            }

        }

        TicketEnvelope {
            id: ticketEnvelope3
            x: 0
            y: 327
            width: 1220
            height: 150

            property var ticketID
            property string ticketPNR: ""

            Text {
                id: passengerLabel3
                x: 286
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "PASSENGER"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: passengerBtn3
                x: 286
                width: 155
                anchors.top: passengerLabel3.bottom
                anchors.topMargin: 10
                btnText: "123456"
                customFontSize: 28
                onClicked: backend.openWindow(2, 1, btnText, false)

                enabled: windowID == 2 ? false : true
            }

            Text {
                id: passengerVar3
                x: 286
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: passengerBtn3.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 10
                font.family: "Inter"
                enabled: windowID == 2 ? false : true
            }

            Text {
                id: checkinLabel3
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "CHECK-IN"
                anchors.top: parent.top
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 21
                font.family: "Inter"
            }

            Tick {
                id: checkinTick3
                x: 1161
                anchors.top: parent.top
                anchors.topMargin: 21
                isButton: false
            }

            Text {
                id: boardedLabel3
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "BOARDED"
                anchors.top: checkinLabel3.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 12
                font.family: "Inter"
            }

            Tick {
                id: boardedTick3
                x: 1161
                anchors.top: checkinTick3.bottom
                anchors.topMargin: 0
                isButton: false
            }

            Text {
                id: fareLabel3
                x: 945
                y: 152
                width: 53
                height: 24
                color: "#80ffffff"
                text: "FARE"
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 24
                font.family: "Inter"
            }

            Text {
                id: fareVar3
                x: 1004
                y: 148
                width: 189
                height: 32
                color: "#ffffff"
                text: "1234.56₺"
                anchors.bottom: parent.bottom
                font.pixelSize: 28
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.bottomMargin: 19
                font.styleName: "Regular"
                font.bold: false
                font.family: "Jetbrains Mono"
            }

            Text {
                id: ticketLabel3
                x: 95
                y: 22
                color: "#ffffff"
                text: qsTr("Ticket")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: ticketPNRVar3
                x: 54
                y: 55
                width: 145
                height: 40
                btnText: ticketEnvelope3.ticketPNR
                customFontSize: 28
                onClicked: backend.openWindow(4, 1, ticketEnvelope3.ticketID, false)
            }

            Text {
                id: flightLabel3
                x: 512
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "FLIGHT"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: flightCode3
                x: 503
                y: 50
                width: 155
                customFontSize: 28
                enabled: windowID == 1 ? false : true
            }

            Text {
                id: flightRouteVar3
                x: 502
                y: 110
                width: 157
                height: 26
                color: "#ffffff"
                text: "NTE - IST"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

        }

        TicketEnvelope {
            id: ticketEnvelope4
            x: 0
            y: 490
            width: 1220
            height: 150
            property var ticketID
            property string ticketPNR: ""
            Text {
                id: passengerLabel4
                x: 286
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "PASSENGER"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: passengerBtn4
                x: 286
                width: 155
                anchors.top: passengerLabel4.bottom
                btnText: "123456"
                customFontSize: 28
                anchors.topMargin: 10
                onClicked: backend.openWindow(2, 1, btnText, false)

                enabled: windowID == 2 ? false : true
            }

            Text {
                id: passengerVar4
                x: 286
                width: 157
                height: 26
                color: "#ffffff"
                text: "Name Surname"
                anchors.top: passengerBtn4.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 10
                font.family: "Inter"
                enabled: windowID == 2 ? false : true
            }

            Text {
                id: checkinLabel4
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "CHECK-IN"
                anchors.top: parent.top
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 21
                font.family: "Inter"
            }

            Tick {
                id: checkinTick4
                x: 1161
                anchors.top: parent.top
                anchors.topMargin: 21
                isButton: false
            }

            Text {
                id: boardedLabel4
                x: 945
                width: 136
                height: 24
                color: "#80ffffff"
                text: "BOARDED"
                anchors.top: checkinLabel4.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 12
                font.family: "Inter"
            }

            Tick {
                id: boardedTick4
                x: 1161
                anchors.top: checkinTick4.bottom
                anchors.topMargin: 0
                isButton: false
            }

            Text {
                id: fareLabel4
                x: 945
                y: 152
                width: 53
                height: 24
                color: "#80ffffff"
                text: "FARE"
                anchors.bottom: parent.bottom
                font.pixelSize: 20
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
                anchors.bottomMargin: 24
            }

            Text {
                id: fareVar4
                x: 1004
                y: 148
                width: 189
                height: 32
                color: "#ffffff"
                text: "1234.56₺"
                anchors.bottom: parent.bottom
                font.pixelSize: 28
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                font.styleName: "Regular"
                font.family: "Jetbrains Mono"
                anchors.bottomMargin: 19
                font.bold: false
            }

            Text {
                id: ticketLabel4
                x: 95
                y: 22
                color: "#ffffff"
                text: qsTr("Ticket")
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: ticketPNRVar4
                x: 54
                y: 55
                width: 145
                height: 40
                btnText: ticketEnvelope4.ticketPNR
                customFontSize: 28
                onClicked: backend.openWindow(4, 1, ticketEnvelope4.ticketID, false)
            }

            Text {
                id: flightLabel4
                x: 512
                y: 14
                width: 136
                height: 26
                color: "#80ffffff"
                text: "FLIGHT"
                font.pixelSize: 22
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }

            NavigatorButton {
                id: flightCode4
                x: 503
                y: 50
                width: 155
                customFontSize: 28
                enabled: windowID == 1 ? false : true
            }

            Text {
                id: flightRouteVar4
                x: 502
                y: 110
                width: 157
                height: 26
                color: "#ffffff"
                text: "NTE - IST"
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                font.family: "Inter"
            }
        }
    }

}
