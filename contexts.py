import sys
from pathlib import Path

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal, QUrl, Property, QMetaObject
from math import ceil


import main
import windows
import database

class CustomWindowContext(QObject):
    
    windowID:int

    # windowID  0: Search  1: Flight  2: Passenger  3: Airport  4: Ticket  5: Airplane  6: Crew
    # modeID  1: View  2: Edit  3: New Record  /  1: Regular Search  2: Transition to another main

    @Slot(int, int, str, bool)
    def openWindow(self, windowID, modeID=0, dataID=0, clearEngine=True):
        windows.utils_instance.loadWindow(windowID, modeID, dataID, clearEngine)
    
    @Slot(int)
    def changeMode(self, mode):
        self.openWindow(self.windowID, mode, self.dataID, clearEngine=False)

    @Slot(result=bool)
    def isEditMode(self):
        return self.modeID == 3

    @Slot(result=str)
    def getPageForStackView(self):
        if self.windowID == 1:
            if self.modeID == 1:
                return "pages/FlightViewPage.qml"
            elif self.modeID == 2 or self.modeID == 3:
                return "pages/FlightEditPage.qml"
        elif self.windowID == 2:
            if self.modeID == 1:
                return "pages/PassengerViewPage.qml"
            elif self.modeID == 2 or self.modeID == 3:
                return "pages/PassengerEditPage.qml"
        elif self.windowID == 3:
            if self.modeID == 1:
                return "pages/AirportViewPage.qml"
            elif self.modeID == 2 or self.modeID == 3:
                return "pages/AirportEditPage.qml"
        elif self.windowID == 4:
            if self.modeID == 1:
                return "pages/TicketViewPage.qml"
            elif self.modeID == 2 or self.modeID == 3:
                return "pages/TicketEditPage.qml"
        elif self.windowID == 5:
            if self.modeID == 1:
                return "pages/AirplaneViewPage.qml"
            elif self.modeID == 2 or self.modeID == 3:
                return "pages/AirplaneEditPage.qml"
        elif self.windowID == 6:
            if self.modeID == 1:
                return "pages/CrewViewPage.qml"
            elif self.modeID == 2 or self.modeID == 3:
                return "pages/CrewEditPage.qml"
        return None
        


    """ 
    return : [totalPage, search1, search2, search3, search4]
    # flight: [flightID, flightCode, fromShort, fromLong, toShort, toLong, deptDate, arrDate]
    # passenger: [passengerID, name, surname, id]
    # airport: [airportID, code, longName]
    # ticket: [ticketID, PNR, passengerID fromShort, toShort, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare]
    """
    @Slot(int, int, str, result=list)
    def search(self, categoryID, currentPageNumber, keyword):
        
        result = []
        if self.windowID == 0:
            if categoryID == 1:
                result = database.db.searchFlight(keyword)
            elif categoryID == 2:
                result = database.db.searchPassenger(keyword)
            elif categoryID == 3:
                result = database.db.searchAirport(keyword)
            elif categoryID == 4:
                result = database.db.searchTicket(keyword)
            elif categoryID == 5:
                result = database.db.searchAirplane(keyword)
            elif categoryID == 6:
                result = database.db.searchCrew(keyword)
        elif self.windowID == 1:
            result = database.db.searchTicketByFlight(keyword, self.dataID)
        elif self.windowID == 2:
            result = database.db.searchTicketByPassenger(keyword, self.dataID)
        elif self.windowID == 3:
            result = database.db.searchFlightByAirport(keyword, self.dataID)
        elif self.windowID == 5:
            result = database.db.searchFlightByAirplane(keyword, self.dataID)
        elif self.windowID == 6:
            result = database.db.searchFlightByCrew(self.dataID)
        

        #DEBUG : print(f"keyword: {keyword}, currentPage: {currentPageNumber}, totalPage: {str(flights)}")
        #FIRST CONDITION: THERE IS NO ELEMENT RETURNED
        if len(result) == 0:
            
            ret = [[1]]
            return ret

        #SECOND CONDITION: THERE IS AT LEAST ONE ELEMENT
        else:
            totalPage = ceil(len(result) / 4)
            ret = [[totalPage]]

            #CALCULATE (HOW MUCH ITEM - 1) WILL THERE BE ON ONE PAGE
            if currentPageNumber == totalPage and len(result)%4 != 0: 
                rng = len(result)%4 
            else: 
                rng = 4

            #LOOP THEM TO RETURN
            for i in range(rng):
                ret.append(list(result[((currentPageNumber-1)*4)+i]))
            return ret


    """ 
    Update Data Required List Formats;

    * flight: [airplaneID, fromID, toID, deptDate, arrivalDate, gate]
    * passenger: [name, surname, email, address, phone, id, passengerID]

     """
    @Slot(list)
    def updateAllData(self, newData):
        if self.windowID == 1:
            if self.modeID == 2:
                database.db.updateFlight(self.dataID, newData)
            elif self.modeID == 3:
                self.dataID = database.db.newFlight(newData)
                self.changeMode(1)
        elif self.windowID == 2:
            if self.modeID == 2:
                database.db.updatePassenger(self.dataID, newData)
            elif self.modeID == 3:
                self.dataID = database.db.newPassenger(newData)
                self.changeMode(1)
        elif self.windowID == 5:
            if self.modeID == 3:
                self.dataID = database.db.newTicket(newData)


    @Slot()
    def deleteRecord(self):
        if self.windowID == 1:
            database.db.deleteFlight(self.dataID)
        elif self.windowID == 2:
            database.db.deletePassenger(self.dataID)
        elif self.windowID == 4:
            database.db.deleteTicket(self.dataID)


class SearchWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID=0, dataID=0):
        QObject.__init__(self)
        self.engine = engine
        self.windowID = 0


class FlightWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID, dataID):
        QObject.__init__(self)
        self.engine = engine
        self.windowID = 1
        self.modeID = modeID
        if modeID != 3:
            self.dataID = dataID
            self.flightInfo = database.db.getFlightInfo(self.dataID)
        else:
            self.dataID = "XXXX"
            self.flightInfo = ["", "", "", "2022-01-01 00:00:00", "2022-01-01 00:00:00", "", database.db.flightCodeGenerator()]
    
    # return format : [airplaneID, fromID, toID, deptDate, arrivalDate, gate, flightCode]

    @Slot(result=str)
    def getFlightID(self):
        return self.dataID
    
    @Slot(result=str)
    def getTitle(self):
        return "Flight / " + str(self.dataID)
    
    @Slot(result=str)
    def getAirplaneID(self):
        return str(self.flightInfo[0])
    
    @Slot(result=str)
    def getFromID(self):
        return str(self.flightInfo[1])

    @Slot(result=str)
    def getFromShort(self):
        return str("" if self.modeID == 3 else database.db.getAirportInfo(self.flightInfo[1])[0])

    @Slot(result=str)
    def getToID(self):
        return str(self.flightInfo[2])

    @Slot(result=str)
    def getToShort(self):
        return str("" if self.modeID == 3 else database.db.getAirportInfo(self.flightInfo[2])[0])

    @Slot(result=str)
    def getDeptDate(self):
        return str(self.flightInfo[3])[:-3]

    @Slot(result=str)
    def getArrDate(self):
        return str(self.flightInfo[4])[:-3]

    @Slot(result=str)
    def getGate(self):
        return str(self.flightInfo[5])
        
    @Slot(result=str)
    def getFlightCode(self):
        return str(self.flightInfo[6])

    @Slot(result=list)
    def getAllAirports(self):
        return database.db.getAllAirportShortCodes()

    @Slot(result=list)
    def getAllAirportIDs(self):
        return database.db.getAllAirportIDs()

    @Slot(str, result=int)
    def getAirportIndexOnCombobox(self, code):
        return database.db.getAllAirportShortCodes().index(code)
    
    @Slot(result=list)
    def getAllAirplaneIDs(self):
        return database.db.getAllAirplaneIDs()

      
class PassengerWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID, dataID):
        QObject.__init__(self)
        self.engine = engine
        self.windowID = 2
        self.modeID = modeID
        if modeID != 3:
            self.dataID = dataID
            self.passengerInfo = database.db.getPassengerInfo(dataID)
        else:
            self.dataID = "XXXX"
            self.passengerInfo = ["", "", "", "", "", "", "+"]

    # name,surname,id,email,address,phone
    @Slot(result=str)
    def getPassengerID(self):
        return self.dataID
    
    @Slot(result=str)
    def getTitle(self):
        return "Passenger / " + str(self.dataID)
    
    @Slot(result=str)
    def getName(self):
        return str(self.passengerInfo[0])
    
    @Slot(result=str)
    def getSurname(self):
        return str(self.passengerInfo[1])

    @Slot(result=str)
    def getIDNO(self):
        return str(self.passengerInfo[2])
    
    @Slot(result=str)
    def getEmail(self):
        return str(self.passengerInfo[3])

    @Slot(result=str)
    def getAddress(self):
        return str(self.passengerInfo[4])

    @Slot(result=str)
    def getPhone(self):
        return str(self.passengerInfo[5])

 
class AirportWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID, dataID):
        QObject.__init__(self)
        self.engine = engine
        self.windowID = 3
        self.dataID = dataID
        self.modeID = modeID
        self.airportInfo = database.db.getAirportInfo(dataID)


    @Slot(result=str)
    def getAirportID(self):
        return self.dataID
    
    @Slot(result=str)
    def getTitle(self):
        return "Airport / " + str(self.dataID)
    
    @Slot(result=str)
    def getName(self):
        return str(self.airportInfo[1])
    
    @Slot(result=str)
    def getCode(self):
        return str(self.airportInfo[0])


class AirplaneWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID, dataID):
        QObject.__init__(self)
        self.engine = engine
        self.windowID = 5
        self.dataID = dataID
        self.modeID = modeID
        self.airplaneInfo = database.db.getAirplaneInfo(dataID)


    @Slot(result=str)
    def getAirplaneID(self):
        return self.dataID
    
    @Slot(result=str)
    def getTitle(self):
        return "Airplane / " + str(self.dataID)
    
    @Slot(result=str)
    def getName(self):
        return str(self.airplaneInfo[0])


class CrewWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID, dataID):
        QObject.__init__(self)
        self.engine = engine
        self.windowID = 6
        self.dataID = dataID
        self.modeID = modeID
        self.airplaneInfo = database.db.getCrewInfo(dataID)

    # return format : [[firstName, lastName, phone, type, licenseNumber]]

    @Slot(result=str)
    def getCrewID(self):
        return self.dataID
    
    @Slot(result=str)
    def getTitle(self):
        return "Crew / " + str(self.dataID)
    
    @Slot(result=str)
    def getName(self):
        return str(self.airplaneInfo[0])
    
    @Slot(result=str)
    def getSurname(self):
        return str(self.airplaneInfo[1])

    @Slot(result=str)
    def getPhone(self):
        return str(self.airplaneInfo[2])

    @Slot(result=str)
    def getType(self):
        return str(self.airplaneInfo[3])

    @Slot(result=str)
    def getLicense(self):
        return str(self.airplaneInfo[4])


class TicketWindowContext(CustomWindowContext):

    def __init__(self, engine, modeID, dataID, repetitive:bool=False):
        if not repetitive:
            QObject.__init__(self)
        self.engine = engine
        self.windowID = 4
        self.modeID = modeID
        if modeID != 3:
            self.dataID = dataID
            self.ticketInfo = database.db.getTicketBaseInfo(dataID)
            self.flightID = self.ticketInfo[9]
            self.passengerID = self.ticketInfo[10]
            self.flightInfo = database.db.getFlightInfo(self.flightID)
            self.passengerInfo = database.db.getPassengerInfo(self.passengerID)
        else:
            self.dataID = "XXXX"
            #fare,hasBoarded,hasCheckedIn,PNR
            self.ticketInfo = ["1", "1", "0", 0, 0, database.db.PNRGenerator()]
        
    
    # return format : [[PNR, fromShort, toShort, flightCode, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare, flightID, passengerID]]
    
    #  1: view  2: edit
    @Slot(int)
    def changeCategoryMode(self, mode):
        ""

    @Slot(str, result=str)
    def getFlightIDFromCode(self, flightCode):
        flightID = database.db.getFlightIDFromCode(flightCode)
        return flightID

    @Slot(str)
    def updateFlight(self, flightCode):
        self.flightID = database.db.getFlightIDFromCode(flightCode)[0][0]
        database.db.updateTicketsFlight(self.dataID, self.flightID)
        self.__init__(self.engine, self.modeID, self.dataID, True)

    @Slot(str)
    def updatePassenger(self, passengerID):
        self.passengerID = passengerID
        database.db.updateTicketsPassenger(self.dataID, self.passengerID)
        self.__init__(self.engine, self.modeID, self.dataID, True)

    @Slot(bool)
    def setCheckedIn(self, state):
        database.db.updateTicketsCheckedIn(self.dataID, state)

    @Slot(bool)
    def setBoarded(self, state):
        database.db.updateTicketsBoarded(self.dataID, state)

    @Slot(result=str)
    def getTicketID(self):
        return self.dataID
    
    @Slot(result=str)
    def getFlightID(self):
        return str(self.flightID)

    @Slot(result=str)
    def getPassengerID(self):
        return str(self.passengerID)
    
    @Slot(result=str)
    def getTitle(self):
        return "Ticket / " + str(self.dataID)
    
    @Slot(result=str)
    def getPNR(self):
        return str(self.ticketInfo[0])

    @Slot(result=str)
    def getFromShort(self):
        return str(self.ticketInfo[1])

    @Slot(result=str)
    def getToShort(self):
        return str(self.ticketInfo[2])

    @Slot(result=str)
    def getFlightCode(self):
        return str(self.ticketInfo[3])

    @Slot(result=str)
    def getPassengerFullName(self):
        return str(self.ticketInfo[4]) + " " + str(self.ticketInfo[5])

    @Slot(result=bool)
    def hasCheckedIn(self):
        return self.ticketInfo[6] == 1

    @Slot(result=bool)
    def hasBoarded(self):
        return self.ticketInfo[7] == 1
        
    @Slot(result=str)
    def getFare(self):
        return str(self.ticketInfo[8]) + "₺"


    @Slot(result=str)
    def getAirplaneID(self):
        return str(self.flightInfo[0])
    
    @Slot(result=str)
    def getFromID(self):
        return str(self.flightInfo[1])

    @Slot(result=str)
    def getFromShort(self):
        return str(database.db.getAirportInfo(self.flightInfo[1])[0])

    @Slot(result=str)
    def getToID(self):
        return str(self.flightInfo[2])

    @Slot(result=str)
    def getToShort(self):
        return str(database.db.getAirportInfo(self.flightInfo[2])[0])

    @Slot(result=str)
    def getDeptDate(self):
        return str(self.flightInfo[3])[:-3]

    @Slot(result=str)
    def getArrDate(self):
        return str(self.flightInfo[4])[:-3]

    @Slot(result=str)
    def getGate(self):
        return str(self.flightInfo[5])


    @Slot(result=list)
    def getAllAirports(self):
        return database.db.getAllAirportShortCodes()

    @Slot(result=list)
    def getAllAirportIDs(self):
        return database.db.getAllAirportIDs()

    @Slot(str, result=int)
    def getAirportIndexOnCombobox(self, code):
        return database.db.getAllAirportShortCodes().index(code)

    @Slot(result=str)
    def getName(self):
        return str(self.passengerInfo[0])
    
    @Slot(result=str)
    def getSurname(self):
        return str(self.passengerInfo[1])

    @Slot(result=str)
    def getIDNO(self):
        return str(self.passengerInfo[2])
    
    @Slot(result=str)
    def getEmail(self):
        return str(self.passengerInfo[3])

    @Slot(result=str)
    def getAddress(self):
        return str(self.passengerInfo[4])

    @Slot(result=str)
    def getPhone(self):
        return str(self.passengerInfo[5])

    @Slot(result=list)
    def getFlights(self):

        ret = []
        for x in database.db.searchFlight(""):
            ret.append(x[1])

        return ret
    
    @Slot(result=list)
    def getPassengers(self):
        ret = []
        for x in database.db.searchPassenger(""):
            ret.append(x[0])

        return ret