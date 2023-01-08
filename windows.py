import sys
from pathlib import Path

from PySide2.QtGui import *  #QGuiApplication
from PySide2.QtQml import * #QQmlApplicationEngine
from PySide2.QtCore import * #QObject, Slot, Signal, QUrl, Property
import contexts

""" main_qml_file = Path(__file__).resolve().parent / "qml/main.qml"


class WindowManager(QObject):

    def __init__(self, engine):
        QObject.__init__(self)
        self.engine = engine

    def setWindowType(self, id):
        if id == 1:
            self.window = QUrl("pages/FlightViewPage.qml")
        elif id == 2:
            self.window = QUrl("pages/PassengerViewPage.qml")

    @Property
    def initialItem(self)



class FlightWindow(QObject):

    # pages/FlightEditPage.qml  pages/FlightViewPage.qml  pages/PassengerEditPage.qml  pages/PassengerViewPage.qml
    activeWindow = Signal(str)
    activeID = Signal(str)
    
    def __init__(self, engine):
        QObject.__init__(self)
        self.engine = engine
        self.activeWindow.emit("pages/FlightViewPage.qml")

#    def loadComponents(self):

    @Slot(str)
    def open(self, flightID):

        self.flightID = flightID

        
        self.activeID.emit(flightID)
        
        wMng = WindowManager(self.engine)
        self.engine.rootContext().setContextProperty("wmgr", wMng)

        self.engine.load(str(main_qml_file))
        

        if not self.engine.rootObjects():
            sys.exit(-1) """

# ************** NEW ************************



class Utilities:

    def __init__(self):
        self.engine = QQmlApplicationEngine()
        self.searchWindowQML = str(Path(__file__).resolve().parent / "qml/Search.qml")
        self.mainWindowQML = str(Path(__file__).resolve().parent / "qml/main.qml")
    
    def clearEngine(self):
        self.engine = QQmlApplicationEngine()
    
    def loadWindow(self, windowID=0, modeID=0, dataID=0, clearEngine=True):
        if windowID == 0:
            self.loadSearchWindow()
        else:
            self.loadMainWindow(windowID, modeID, dataID, clearEngine)

    def loadSearchWindow(self):

        # Clear the engine
        self.clearEngine()

        ## Get Context
        self.searchWindowContext = contexts.SearchWindowContext(self.engine)
        self.engine.rootContext().setContextProperty("backend", self.searchWindowContext)

        # Bind the search QML to engine
        self.engine.load(self.searchWindowQML)

        if not self.engine.rootObjects():
            sys.exit(-1)

    def loadMainWindow(self, windowID, modeID, dataID, clearEngine=True):

        # Clear the engine
        if clearEngine:
            self.clearEngine()

        ## Get Context
        # windowID  1: FlightView  2: PassengerView  3:AirportView
        # modeID  1: View  2: Edit  3: New Record
        if windowID == 1:
            self.mainWindowContext = contexts.FlightWindowContext(self.engine, modeID, dataID)
        elif windowID == 2:
            self.mainWindowContext = contexts.PassengerWindowContext(self.engine, modeID, dataID)
        elif windowID == 3:
            self.mainWindowContext = contexts.AirportWindowContext(self.engine, modeID, dataID)
        elif windowID == 4:
            self.mainWindowContext = contexts.TicketWindowContext(self.engine, modeID, dataID)
        elif windowID == 5:
            self.mainWindowContext = contexts.AirplaneWindowContext(self.engine, modeID, dataID)
        elif windowID == 6:
            self.mainWindowContext = contexts.CrewWindowContext(self.engine, modeID, dataID)

        else:
            print("ERR > WINDOW ID EXCEPTION")
            raise Exception
        
        self.engine.rootContext().setContextProperty("backend", self.mainWindowContext)

        # Bind the search QML to engine
        self.engine.load(self.mainWindowQML)

        if not self.engine.rootObjects():
            sys.exit(-1)
        

    


