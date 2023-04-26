import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
import ppt

Window {
    id: root
    width: 1280
    height: 800
    visible: true
    title: "야옹이는 바보~~"

    property int xSpacing: 10*(width/1280)
    property int ySpacing: 10*(height/800)

    Maker {
        id: maker
    }

    Button {
        id: selBtn
        x: xSpacing
        y: ySpacing
        width: 200*(parent.width/1280)
        height: 50*(parent.height/800)
        onClicked: {
            fileDialog.currentFolder = StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
            fileDialog.open()
        }
        contentItem: Text {
            font.pointSize: 100
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "이미지 선택"
        }
    }
    Rectangle {
        x: selBtn.width + xSpacing*2
        y: ySpacing
        width: parent.width - xSpacing*3 - selBtn.width
        height: (parent.height - ySpacing*3)/2
        color: "gray"
        ListView {
            id: listView
            anchors.fill: parent
            clip: true
            model: ListModel {
                id: model
            }
            delegate: Text {
                width: listView.width
                height: 30
                text: fileName
                font.pointSize: 100
                fontSizeMode: Text.Fit
                verticalAlignment: Text.AlignVCenter
            }
            ScrollBar.vertical: ScrollBar {
                policy: ScrollBar.AlwaysOn
            }
        }
    }
    Button {
        id: makeBtn
        x: xSpacing
        y: ySpacing + listView.height + ySpacing
        width: 200*(parent.width/1280)
        height: 50*(parent.height/800)
        onClicked: {
            if(!maker.check()) {
                var temp = []
                fileDialog.selectedFiles.forEach(i => temp.push(String(i).replace(/^(file:\/{3})/,"")))
                maker.startMake(temp)
            }
        }
        contentItem: Text {
            font.pointSize: 100
            fontSizeMode: Text.Fit
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            text: "PPT 만들기"
        }
    }

    FileDialog {
        id: fileDialog
        fileMode: FileDialog.OpenFiles
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        nameFilters: ["Image files (*.png *.jpg *.jpeg)"]
        onAccepted: {
            model.clear()
            selectedFiles.forEach(i => model.append({fileName: String(i).replace(/^(file:\/{3})/,"")}))
        }
    }
}
