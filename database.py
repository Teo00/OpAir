""" mydb = mysql.connector.connect(
  host="localhost",
  user="root",
  password="",
  database="opair"
)

mycursor = mydb.cursor()

mycursor.execute("SELECT * FROM passenger")

myresult = mycursor.fetchall()

for x in myresult:
  print(x) """

import mysql.connector
import sys
import random, string

import databasequeries as dbq

class DatabaseUtilities():

    host = "localhost"
    user = "root"
    password = ""
    database = "opair"

    def __init__(self):
        try:
            self.db = mysql.connector.connect(host=self.host, user=self.user, password=self.password, database=self.database)
        except:
            #TODO Error dialog box
            sys.exit(-1)
        self.cursor = self.db.cursor()

    def PNRGenerator(self):
        

        i = True
        while i:
            x = ''.join(random.choices(string.ascii_uppercase + string.digits, k=6))
            exc = self.cursor.execute("SELECT * FROM ticket WHERE PNR = '{}'".format(x))
            result = self.cursor.fetchall()
            if result.__len__() == 0:
                i = False

        return x
    
    def flightCodeGenerator(self):
       
        i = True
        while i:
            x = "".join(random.choices(string.ascii_uppercase, k=2) + random.choices(string.digits, k=4))
            exc = self.cursor.execute("SELECT * FROM flight WHERE flightCode = '{}'".format(x))
            result = self.cursor.fetchall()
            if result.__len__() == 0:
                i = False

        return x
    
    # ****************** This area is for flight database ******************
    # return format : [airplaneID, fromID, toID, deptDate, arrivalDate, gate, flightCode]
    def getFlightInfo(self, flightID):
        exc = self.cursor.execute(dbq.select_all_flight.format(flightID))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        ret = list(result[0])
        ret.remove(ret[0])
        return ret

    def getFlightIDFromCode(self, flightCode):
        exc = self.cursor.execute(dbq.select_flightid_from_code.format(flightCode))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        
        return result

    # return format : [[flightID, flightCode, fromShort, fromLong, toShort, toLong, deptDate, arrDate]]
    def searchFlight(self, keyword):
        exc = self.cursor.execute(dbq.search_flight.format(keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 6 or lx.index(y) == 7:
                    lx[lx.index(y)] = str(y)[:-3]
            ret.append(lx)

        return ret
    
    #airplaneID={}, fromID={}, toID={}, deperatureDate={}, arrivalDate={}, gate={} WHERE flightID={}
    def updateFlight(self, flightID, updateData:list):
        exc = self.cursor.execute(dbq.update_flight.format(updateData[0], updateData[1], updateData[2], updateData[3], updateData[4], updateData[5], flightID))
        self.db.commit()

    def deleteFlight(self, flightID):
        exc = self.cursor.execute(dbq.delete_flight.format(flightID))
        self.db.commit()

    def newFlight(self, updateData:list):
        exc = self.cursor.execute(dbq.insert_flight.format(updateData[0], updateData[1], updateData[2], updateData[3], updateData[4], updateData[5], updateData[6]))
        self.db.commit()
        id = str(self.cursor.lastrowid)
        return id

    def searchFlightByAirport(self, keyword, airportID):
        exc = self.cursor.execute(dbq.search_flight_by_airport.format(airportID, airportID, keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 6 or lx.index(y) == 7:
                    lx[lx.index(y)] = str(y)[:-3]
            ret.append(lx)

        return ret

    def searchFlightByAirplane(self, keyword, airplaneID):
        exc = self.cursor.execute(dbq.search_flight_by_airplane.format(airplaneID, keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 6 or lx.index(y) == 7:
                    lx[lx.index(y)] = str(y)[:-3]
            ret.append(lx)

        return ret
    
    #TODO IMPROVABLE
    def searchFlightByCrew(self, crewID):
        exc = self.cursor.execute(dbq.select_flight_of_crew.format(crewID))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 6 or lx.index(y) == 7:
                    lx[lx.index(y)] = str(y)[:-3]
            ret.append(lx)

        return ret


    # ****************** This area is for passenger database ******************
    # return format : [name, surname, id, email, address, phone]
    def getPassengerInfo(self, passengerID):
        exc = self.cursor.execute(dbq.select_all_passenger.format(passengerID))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        
        ret = list(result[0])
        ret.remove(ret[0])
        
        return ret
    
    # return format : [[passengerID, name, surname, id]]
    def searchPassenger(self, keyword):
        exc = self.cursor.execute(dbq.search_passenger.format(keyword, keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []

        for x in result:
            ret.append(list(x))

        return ret

    #name='{}',surname='{}',email='{}',address='{}', phone='{}', id='{}' WHERE passengerID='{}'
    def updatePassenger(self, passengerID, updateData:list):
        exc = self.cursor.execute(dbq.update_passenger.format(updateData[0], updateData[1], updateData[2], updateData[3], updateData[4], updateData[5], passengerID))
        self.db.commit()

    def deletePassenger(self, passengerID):
        exc = self.cursor.execute(dbq.delete_passenger.format(passengerID))
        self.db.commit()

    def newPassenger(self, updateData:list):
        exc = self.cursor.execute(dbq.insert_passenger.format(updateData[0], updateData[1], updateData[2], updateData[3], updateData[4], updateData[5]))
        self.db.commit()
        id = str(self.cursor.lastrowid)
        return id
    
    # ****************** This area is for airport database ******************

    # return format : [[airportID, name, code]]
    def searchAirport(self, keyword):
        exc = self.cursor.execute(dbq.search_airport.format(keyword, keyword, keyword))
        result = self.cursor.fetchall()
        
        ret = []

        for x in result:
            ret.append(list(x))

        return ret

    # return format : [shortCode, longName]
    def getAirportInfo(self, airportID):
        exc = self.cursor.execute(dbq.select_all_airport.format(airportID))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        
        ret = list(result[0])
        ret.remove(ret[0])
        
        return ret
    
    # return format : [shortCode]
    def getAllAirportShortCodes(self):
        exc = self.cursor.execute("SELECT code FROM airport")
        result = self.cursor.fetchall()

        ret = []

        for x in result:
            ret.append(x[0])
        
        return ret
    
    def getAllAirportIDs(self):
        exc = self.cursor.execute("SELECT airportID FROM airport")
        result = self.cursor.fetchall()

        ret = []

        for x in result:
            ret.append(x[0])
        
        return ret

    # ****************** This area is for ticket database ******************

    # return format : [[ticketID, PNR, fromShort, toShort, deptDate, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare]]
    def searchTicket(self, keyword):
        exc = self.cursor.execute(dbq.search_ticket.format(keyword, keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 4:
                    lx[lx.index(y)] = str(y)[:-3]
                elif lx.index(y) == 9:
                    lx[lx.index(y)] = str(y)
            ret.append(lx)
        return ret

    # return format : [[PNR, fromShort, toShort, flightCode, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare, flightID, passengerID]]
    def getTicketBaseInfo(self, ticketID):
        exc = self.cursor.execute(dbq.select_ticket_base_info.format(ticketID))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        
        ret = list(result[0])
        return ret

    # return format : [[ticketID, PNR, passengerID, fromShort, toShort, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare]]
    def searchTicketByFlight(self, keyword, flightID):
        exc = self.cursor.execute(dbq.search_ticket_by_flight.format(flightID, keyword, keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 9:
                    lx[lx.index(y)] = str(y)
            ret.append(lx)

        return ret

    # return format : [[ticketID, PNR, passengerID, fromShort, toShort, passengerName, passengerSurname, hasCheckedIn, hasBoarded, fare, flightCode]]
    def searchTicketByPassenger(self, keyword, passengerID):
        exc = self.cursor.execute(dbq.search_ticket_by_passenger.format(passengerID, keyword, keyword, keyword, keyword))
        result = self.cursor.fetchall()

        ret = []
        for x in result:
            lx = list(x)
            for y in lx:
                if lx.index(y) == 9:
                    lx[lx.index(y)] = str(y)
            ret.append(lx)

        return ret


    def updateTicketsFlight(self, ticketID, flightID):
        exc = self.cursor.execute(dbq.update_ticket_flight.format(flightID, ticketID))
        self.db.commit()
    
    def updateTicketsPassenger(self, ticketID, passengerID):
        exc = self.cursor.execute(dbq.update_ticket_passenger.format(passengerID, ticketID))
        self.db.commit()
        
    def updateTicketsCheckedIn(self, ticketID, state):
        exc = self.cursor.execute(dbq.update_ticket_checkedIn.format(1 if state else 0, ticketID))
        self.db.commit()

    def updateTicketsBoarded(self, ticketID, state):
        exc = self.cursor.execute(dbq.update_ticket_boarded.format(1 if state else 0, ticketID))
        self.db.commit()

    # fare,hasBoarded,hasCheckedIn,PNR
    def newTicket(self, updateData:list):
        exc = self.cursor.execute(dbq.insert_passenger.format(1, 1, updateData[0], updateData[1], updateData[2], updateData[3]))
        self.db.commit()
        id = str(self.cursor.lastrowid)
        return id

    def deleteTicket(self, ticketID):
        exc = self.cursor.execute(dbq.delete_ticket.format(ticketID))
        self.db.commit()

    # ****************** This area is for airplane database ******************
    
    # return format : [[modelName]]
    def getAirplaneInfo(self, airportID):
        exc = self.cursor.execute(dbq.select_all_airplane.format(airportID))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        
        ret = list(result[0])
        ret.remove(ret[0])
        
        return ret

    def getAllAirplaneIDs(self):
        exc = self.cursor.execute("SELECT airplaneID FROM airplane")
        result = self.cursor.fetchall()

        ret = []

        for x in result:
            ret.append(x[0])
        
        return ret
    # return format : [[airplaneID, modelName]]
    def searchAirplane(self, keyword):
        exc = self.cursor.execute(dbq.search_airplane.format(keyword, keyword))
        result = self.cursor.fetchall()
        
        ret = []

        for x in result:
            ret.append(list(x))

        return ret

    # ****************** This area is for crew database ******************
    
    # return format : [[firstName, lastName, phone, type, licenseNumber]]
    def getCrewInfo(self, crewID):
        exc = self.cursor.execute(dbq.select_all_crew.format(crewID))
        result = self.cursor.fetchall()

        if result.__len__ == 0:
            print("ERR > ID NULL EXCEPTION")
            raise Exception
        
        ret = list(result[0])
        ret.remove(ret[0])
        ret.remove(ret[0])
        
        return ret
    # return format : [[crewID, firstName, lastName, type]]
    def searchCrew(self, keyword):
        exc = self.cursor.execute(dbq.search_crew.format(keyword, keyword, keyword, keyword))
        result = self.cursor.fetchall()
        
        ret = []

        for x in result:
            ret.append(list(x))

        return ret
    


db:DatabaseUtilities