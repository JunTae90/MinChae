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
    FileDialog {
        id: fileDialog
        fileMode: FileDialog.OpenFile
        currentFolder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
        nameFilters: ["Text files (*.txt)"]
    }
    Row {
        x: 11*(root.width/1280)
        y: 11*(root.height/800)
        width: 1258*(root.width/1280)
        height: 778*(root.height/800)
        spacing: 11*(root.width/1280)
        Column {
            spacing: 11*(root.height/800)
            width: 200*(root.width/1280)
            Button {
                width: parent.width
                height: 50*(root.height/800)
                onClicked: {
                    fileDialog.currentFolder = StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                    fileDialog.open()
                }
                contentItem: Text {
                    font.pointSize: 100
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "채팅 선택"
                }
            }
            Button {
                width: parent.width
                height: 50*(root.height/800)
                onClicked: {
                    console.log("hihihi")
                    var data = maker.extractInfo(String(fileDialog.selectedFile).replace("file:///", ""))
                    model.clear()
                    for(var key in data) {
                        var value = data[key]
                        model.append({key: key, value: value})
                    }
                }
                contentItem: Text {
                    font.pointSize: 100
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "정보 추출"
                    wrapMode: Text.WordWrap
                }
            }
            Button {
                width: parent.width
                height: 50*(root.height/800)
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
        }
        Column {
            spacing: 11*(root.height/800)
            width: 1047*(root.width/1280)
            Rectangle {
                width: parent.width
                height: 30*(root.height/800)
                Text {
                    clip: true
                    anchors.fill: parent
                    font.pointSize: 100
                    fontSizeMode: Text.HorizontalFit
                    verticalAlignment: Text.AlignVCenter
                    text: String(fileDialog.selectedFile).replace("file:///", "")
                    padding: parent.border.width*2
                }
                border.color: "black"
                border.width: 3
            }
            Rectangle {
                width: parent.width
                height: 300*(root.height/800)
                color: "gray"
                ListView {
                    id: listView
                    anchors.fill: parent
                    clip: true
                    model: ListModel {
                        id: model
                    }

                    ScrollBar.vertical: ScrollBar {
                        policy: ScrollBar.AlwaysOn
                    }
                }
            }
        }
    }
}
