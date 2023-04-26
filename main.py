import sys
from PySide6.QtGui import QGuiApplication
from PySide6.QtQml import *
from ppt import Maker

if __name__ == "__main__":
    app = QGuiApplication(sys.argv)
    qmlRegisterType(Maker, "ppt", 1, 0, "Maker")
    engine = QQmlApplicationEngine()
    engine.load('main.qml')
    if not engine.rootObjects():
        sys.exit(-1)
    exit_code = app.exec()
    del engine
    sys.exit(exit_code)