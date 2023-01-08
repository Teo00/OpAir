# This Python file uses the following encoding: utf-8
import sys
from pathlib import Path

from PySide2.QtGui import QGuiApplication
from PySide2.QtQml import QQmlApplicationEngine
from PySide2.QtCore import QObject, Slot, Signal
from PySide2.QtQuick import QQuickView

import windows
import database

app = None

""" search_qml_file = Path(__file__).resolve().parent / "qml/Search.qml"
main_qml_file = Path(__file__).resolve().parent / "qml/main.qml"

class MainWindow(QObject):
    def __init__(self):
        QObject.__init__(self)

    #Signal Set Name
    setName = Signal(str)

    #Function Set Name
    @Slot(str)
    def welcomeText(self, name):
        self.setName.emit("Welcome, " + name)

    #0: Search
    #1: Flight
    #2: Passenger
    @Slot(int, int)
    def goto(self, screenID, customID):
        engine.load(str(main_qml_file))


        if not engine.rootObjects():
            sys.exit(-1) """



if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    
    database.db = database.DatabaseUtilities()

    windows.utils_instance = windows.Utilities()
    windows.utils_instance.loadSearchWindow()

    sys.exit(app.exec_())
