select_all_airplane= "SELECT * FROM airplane WHERE airplaneID = '{}'"
select_all_airport= "SELECT * FROM airport WHERE airportID = '{}'"
select_all_passenger= "SELECT * FROM passenger WHERE passengerID = '{}'"
select_all_crew= "SELECT * FROM crew WHERE crewID= '{}'"
select_all_flight= "SELECT * FROM flight WHERE flightID = '{}'"
# select_all_ticket= "SELECT * FROM ticket WHERE ticketID = '{}'"

select_ticket_base_info = "SELECT tc.PNR, ap1.`code`, ap2.`code`, fl.flightCode, ps.`name`, ps.surname, tc.hasCheckedIn, tc.hasBoarded, tc.fare, fl.flightID, ps.passengerID FROM ticket as tc INNER JOIN passenger as ps ON tc.passengerID=ps.passengerID INNER JOIN flight as fl ON tc.flightID=fl.flightID INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID WHERE ticketID='{}'"

select_flight_of_crew = "SELECT fl.flightID, fl.flightCode, ap1.`code` as 'fromCode', ap1.longName as 'fromName', ap2.`code` as 'toCode', ap2.longName as 'toName', fl.departureDate, fl.arrivalDate FROM crew INNER JOIN flight as fl ON crew.flightID=fl.flightID INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID  WHERE (crew.crewID='{}')"

select_flightid_from_code = "SELECT flightID FROM flight WHERE flightCode='{}'"

select_all_airport_short = "SELECT shortCode FROM airport"

update_passenger = "UPDATE passenger SET name='{}',surname='{}',email='{}',address='{}', phone='{}', id='{}' WHERE passengerID='{}'"
update_ticket = "UPDATE ticket SET passengerID= '{}',flightID= '{}',baggageID= '{}',from= '{}',to= '{}',hasboarded= '{}',hascheckedin= '{}',pnr= '{}' WHERE ticketID='{}'"
update_flight= "UPDATE flight SET airplaneID='{}', fromID='{}', toID='{}', departureDate='{}', arrivalDate='{}', gate='{}' WHERE flightID='{}'"
update_pilot = "UPDATE pilot SET flightID= '{}',firstname= '{}',lastname= '{}',contactnumber= '{}',pilottype= '{}',pilotlicencenumber= '{}',route= '{}',departureDate= '{}',deperaturetime= '{}',arrivaldate= '{}',arrivaltime= '{}' WHERE pilotID='{}'"
update_cabincrew= "UPDATE cabincrew SET flightID= '{}',firstname= '{}',lastname= '{}',contactnumber= '{}' WHERE cabincrewID='{}'"
update_airplane= "UPDATE airplane SET from='{}', to='{}', dep_date='{}' WHERE airplaneID='{}'"
update_airport= "UPDATE airport SET airportname='{}',airportshortname='{}',flightID='{}',departureDate='{}',deperaturetime='{}',arrivaldate='{}',arrivaltime='{}',route='{}' WHERE airportID='{}'"

update_ticket_flight = "UPDATE ticket SET flightID = '{}' WHERE ticketID = '{}'"
update_ticket_passenger = "UPDATE ticket SET passengerID = '{}' WHERE ticketID = '{}'"
update_ticket_checkedIn = "UPDATE ticket SET hascheckedIn = '{}' WHERE ticketID = '{}'"
update_ticket_boarded = "UPDATE ticket SET hasboarded = '{}' WHERE ticketID = '{}'"


delete_passenger= "DELETE FROM passenger WHERE passengerID = '{}'"
delete_ticket= "DELETE FROM ticket WHERE ticketID = '{}'"
delete_flight= "DELETE FROM flight WHERE flightID = '{}'"
delete_pilot= "DELETE FROM pilot WHERE pilotID = '{}'"
delete_cabincrew= "DELETE FROM cabincrew WHERE cabincrewID = '{}'"
delete_airplane= "DELETE FROM airplane WHERE airplaneID = '{}'"
delete_airport= "DELETE FROM airport WHERE airportID = '{}'"

insert_passenger= "INSERT INTO passenger (name,surname,email,address,phone, id) VALUES ('{}', '{}', '{}', '{}', '{}', '{}')"
insert_ticket= "INSERT INTO ticket (passengerID,flightID,fare,hasBoarded,hasCheckedIn,PNR) VALUES ('{}', '{}', '{}', '{}', '{}', '{}')"
insert_flight= "INSERT INTO flight (airplaneID,fromID,toID,departureDate,arrivalDate,gate, flightCode) VALUES ('{}', '{}', '{}', '{}', '{}', '{}', '{}')"
insert_pilot= "INSERT INTO pilot (pilotID,flightID,firstname,lastname,contactnumber,pilottype,pilotlicencenumber,route,departureDate,deperaturetime,arrivaldate,arrivaltime) VALUES (%d,%d,%s,%s,%d,%d,%d,%s,%m-%d-%y,%H:%M:%S,%m-%d-%y,%H:%M:%S)"
insert_cabincrew= "INSERT INTO cabincrew (cabincrewID,flightID,firstname,lastname,contactnumber) VALUES (%d,%d,%s,%s,%s)"
insert_airplane= "INSERT INTO airplane (airplaneID,modelnumber,manufacuter,route,departureDate,deperaturetime,arrivaldate,arrivaltime,flightID,airplanecol1) VALUES (%d,%d,%s,%s,%m-%d-%y,%H:%M:%S,%d,%s)"
insert_airport= "INSERT INTO airport (airportID,airportname,airportshortname,flightID,departureDate,deperaturetime,arrivaldate,arrivaltime,route) VALUES (%d,%s,%s,%d,%m-%d-%y,%H:%M:%S,%m-%d-%y,%H:%M:%S,%s)"

search_flight = "SELECT fl.flightID, fl.flightCode, ap1.`code` as 'fromCode', ap1.longName as 'fromName', ap2.`code` as 'toCode', ap2.longName as 'toName', fl.departureDate, fl.arrivalDate FROM `flight` as fl INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID WHERE flightCode LIKE '{}%' OR ap1.`code` LIKE '{}%' OR ap2.`code` LIKE '{}%'"

search_flight_by_airplane = "SELECT fl.flightID, fl.flightCode, ap1.`code` as 'fromCode', ap1.longName as 'fromName', ap2.`code` as 'toCode', ap2.longName as 'toName', fl.departureDate, fl.arrivalDate FROM `flight` as fl INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID INNER JOIN airplane as plane ON fl.airplaneID=plane.airplaneID WHERE (plane.airplaneID='{}') AND (fl.flightCode LIKE '{}%' OR ap1.`code` LIKE '{}%' OR ap2.`code` LIKE '{}%')"
search_ticket_by_flight = "SELECT tc.ticketID, tc.PNR, ps.passengerID, ap1.`code` as 'fromCode', ap2.`code` as 'toCode', ps.`name`, ps.surname, tc.hasCheckedIn, tc.hasBoarded, tc.fare FROM `ticket` as tc INNER JOIN passenger as ps ON tc.passengerID=ps.passengerID INNER JOIN flight as fl ON tc.flightID=fl.flightID INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID WHERE (fl.flightID='{}') AND (tc.PNR LIKE '{}%' OR ps.`name` LIKE '{}%' OR ps.surname LIKE '{}%' OR tc.fare LIKE '{}%')"
search_ticket_by_passenger = "SELECT tc.ticketID, tc.PNR, ps.passengerID, ap1.`code` as 'fromCode', ap2.`code` as 'toCode', ps.`name`, ps.surname, tc.hasCheckedIn, tc.hasBoarded, tc.fare, fl.flightCode FROM `ticket` as tc INNER JOIN passenger as ps ON tc.passengerID=ps.passengerID INNER JOIN flight as fl ON tc.flightID=fl.flightID INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID WHERE (ps.passengerID='{}') AND (tc.PNR LIKE '{}%' OR ap1.code LIKE '{}%' OR ap2.code LIKE '{}%' OR tc.fare LIKE '{}%')"
search_flight_by_airport = "SELECT fl.flightID, fl.flightCode, ap1.`code` as 'fromCode', ap1.longName as 'fromName', ap2.`code` as 'toCode', ap2.longName as 'toName', fl.departureDate, fl.arrivalDate FROM `flight` as fl INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID INNER JOIN airplane as plane ON fl.airplaneID=plane.airplaneID WHERE (ap1.airportID='{}' OR ap2.airportID='{}') AND (fl.flightCode LIKE '{}%')"

search_passenger = "SELECT passengerID, name, surname, id FROM passenger WHERE passengerID LIKE '{}%' OR name LIKE '{}%' OR surname LIKE '{}%' OR id LIKE '{}%'"
search_airport = "SELECT airportID, code, longName FROM airport WHERE code LIKE '{}%' OR longName LIKE '{}%'"
search_ticket = "SELECT tc.ticketID, tc.PNR, ap1.`code` as 'fromCode', ap2.`code` as 'toCode', fl.departureDate, ps.`name`, ps.surname, tc.hasCheckedIn, tc.hasBoarded, tc.fare FROM `ticket` as tc INNER JOIN passenger as ps ON tc.passengerID=ps.passengerID INNER JOIN flight as fl ON tc.flightID=fl.flightID INNER JOIN airport as ap1 ON fl.fromID=ap1.airportID INNER JOIN airport as ap2 ON fl.toID=ap2.airportID WHERE tc.PNR LIKE '{}%' OR ps.`name` LIKE '{}%' OR ps.surname LIKE '{}%' OR tc.fare LIKE '{}%'"
search_airplane = "SELECT * FROM airplane WHERE airplaneID LIKE '{}%' OR modelName LIKE '{}%'"
search_crew = "SELECT crewID, firstName, lastName, type FROM crew WHERE crewID LIKE '{}%' OR firstName LIKE '{}%' OR lastName LIKE '{}%' OR type LIKE '{}%'"
