from PySide6.QtCore import *
import re
class Maker(QThread):
    def __init__(self, parent=None):
        super().__init__(parent)
        self.imgList = []

    def run(self):
        for i in self.imgList:
            print(i)

    @Slot(str, result='QVariant')
    def extractInfo(self, chatPath):
        res = {}
        cur = ""
        with open(chatPath, 'r', encoding='utf-8') as f:
            for line in f.readlines():
                line = line.strip()
                if ',' in line:
                    datetime = line.split(',')[0].split(' ')
                    if len(datetime) >= 3:
                        y = re.sub(r'[^0-9]', '', datetime[0])
                        m = re.sub(r'[^0-9]', '', datetime[1])
                        d = re.sub(r'[^0-9]', '', datetime[2])
                        cur = y + "-" + m + "-" + d

                if '.jpg' in line \
                        or '.jpeg' in line\
                        or '.JPG' in line\
                        or '.JPEG' in line:
                    if cur not in res.keys():
                        res[cur] = []
                    res[cur].append(line.split(' ')[-1])
        return res

    @Slot(result=bool)
    def check(self):
        return self.isRunning()

    @Slot(list)
    def startMake(self, list):
        self.imgList = list
        self.start()