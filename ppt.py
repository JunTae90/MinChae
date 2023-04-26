from PySide6.QtCore import *
class Maker(QThread):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.imgList = []

    def run(self):
        for i in self.imgList:
            print(i)

    @Slot(result=bool)
    def check(self):
        return self.isRunning()

    @Slot(list)
    def startMake(self, list):
        self.imgList = list