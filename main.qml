import QtCore
import QtQuick
import QtQuick.Controls
import QtQuick.Dialogs
//import ppt

Window {
    id: root
    width: 1920
    height: 1080
    visible: true
    title: "야옹이는 바보~~"

    property var imgNames

    property int xSpacing: 10*(width/1280)
    property int ySpacing: 10*(height/800)

    property var selected

//    Maker {
//        id: maker
//    }
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
            height: parent.height
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
//                    var data = maker.extractInfo(String(fileDialog.selectedFile).replace("file:///", ""))
                    imgNames = {'2023-3-21': ['fbdb3f9027209ad2a389b20892c2c87b9319326d37bc9eaf8ce1cfbbe87fbb56.jpg'], '2023-3-22': ['ee91da44375493cbf1c95dc8da33da8df98df74d8d54b8eacc56868ed2df55b4.jpg', '444bcc1f6df982b381cd66ed98452ffd88c55c09704c3ad0bd815e9c02facafb.jpg', 'e579189ef7d612403636e99a681fb8be5e8743f54747ad841db1b8f3c7a54eaa.jpg', 'f627d5c7913d044662313df2b42817355cd7789c436b3b4bfae756bbbb4ce941.jpg', 'ea7d2f9c771ce7e4b04ceb757fd9905fc2e9df645723be087c97f2006d8c9475.jpg'], '2023-3-23': ['f7de1d9f3d20fef8cf9e200d35606f61e5725d0b0f110c4ecf75a7d30174c3ed.jpg', '5581557f124edea2f4edbf469a69c12bc1e76c70787cfcce78c86bea55f03f8b.jpg', '28b5ae8d5583bbde1a4b8461436db9f10491096b611fe67c22b1996b6d4cc9c2.jpg', '9f897c686c4534eab2989280a4f1e46cbe7299d1bca922211456bb4d8a027dbe.jpg'], '2023-3-24': ['19e05225ebc14b2afabc75aec5b02d18288b3825e802210cd2d01168d2bee0c1.jpg'], '2023-3-27': ['3b444f072019e1e0b0094ac89aef362853130876f864ee927bff16bc59e3b52c.jpg', '1950bd985de4165ba4b8016331f989f70cf39a6a2617c741dbe0f032a14299bf.jpg', 'bde7e4ebec96fd5470d63756378fc77aa0f1b0c87c8ce04c8123eecf3f6215b8.jpg', '67a396b8d6dd00d500247e6d596333f0f58182dbe114e5d953cefef55c4c0bf7.jpg', 'a4351be1743bc713944e8c1ab42a0ddfed045a878faafde608e0fc44225f0c50.jpg'], '2023-3-30': ['b85b823c07e57f7c5b6fc093b48317b1745cd6f30deb8300af77987e48856196.jpg', '18500958b3acf18132d015ec013a12023c58480a7553e85a64171a16ece28136.jpg'], '2023-3-31': ['dfcfd137c16040b2b967600b0a21de41af94eca1360052e698fe9ad6611902d1.jpg', '66d6eba62b530469be2959efba01be61bccd372ca31b7f3aceb58cd05c59ae6d.jpg', '77dee4cf3238b8abf4fa1d8ec3bd363a6b249d895757ac82c83fffeb5127d184.jpg', '504cb94c5961df32a93c1a9f13b34ae69db447862032ec884266e96bc58f80ff.jpg'], '2023-4-3': ['e74058c32e8086eba442c18a0addea6962364b788d756846736ed8942ec329c5.jpg', '55ab236b5af46bf45b42ca759cec252e7edb52bc7c9c555c3057690aa9d0f3fb.jpg', '5c862dd1c632ca8dfcbb0ee60131d05825cba2185b119902ab881049beec4a0c.jpg', 'b7d1d9abf574970730845ade3324c0eb297ea2737cfe4056eea89f49a775a874.jpg', 'f833499b1dc192b9d59700fc812fd2a181cecada35835d2ce3e6b534e307ba5e.jpg'], '2023-4-4': ['4c193e9ffa13e8d9baf0b3fd5674b825d35e2ee2ae681a68ad79f76e8cda4609.jpg', '6a53cfdab95c6bdd5aa3bbce3686618e8596243f6cb9c83081e589422df70dd1.jpg', '57c9ae7af8f02998c2fb36411d9d4dc8db9e7a93a95b7b9394fc9294ce48427b.jpg', '277a6fe35e60e8acb0de7d39a602bc073d6a2d7a47e44607170b16f5635ec54f.jpg'], '2023-4-6': ['6303bee85fa8437f97f2a178975abd9eef3f7e0e7073c6c7a043dd0860a240b8.jpg', '7f9f0786f5e1c104b9069a4a3d7da3f4609647ea21ecb2716bba60e3a58371be.jpg', '5cef05e6a6c6a7f5170f18068ba44e949c81a9db43a6c19f5feea328393ad135.jpg', 'c60d19bfa3f363de664e59477368491f50f725d4257a2be349b16738dc5c7c21.jpg', 'c4f26daaeb63329464ce3e60da96568419acec2a2cb8ee758223b582cbce92b0.jpg'], '2023-4-7': ['a3cc31f0cde5a6da72ea80b0f461224c72d3006804d2e696e6f7fdd5e5afe7c6.jpg', 'd9402a6a96524de279d605de16a8c04ebeb60a2df2220357bcd82f2672e90bd7.jpg', 'b6e24c6d29ebf0cf0b2e36c96751caf17bd8dcd3db979fb1207e31693f7c2bf5.jpg'], '2023-4-10': ['8b82f9f56572baab7efd0bd0b99b460b5a7d818807ef8519cb1b27e9a7170f28.jpg', 'ef8f181743afd3b0614dcd017b65ab74cff580403a7a77f3b28ff4ddb60144e7.jpg', '1bd1279c7fe40746c3717ae811c17be5568829744b7f7ab11ae2125094d898f9.jpg', 'ed7ddaf345961c4fcc1ff017e79c73be547afa2a3a058107c68cf2eb8f28d372.jpg'], '2023-4-11': ['ef09959ef12199a40771e9a541d7a589d7ce525cbcf66a24fb81c3bf4bc35155.jpg', 'dadd8836d9d9cb1dd06c45d59771d30af8a582ddd288fd4789e9ba750159f856.jpg', 'db6e60482037739463e8bba61bed5fa0fbf3def0481e3504f94816ff0401eb25.jpg'], '2023-4-12': ['536432e6c1ecb32db953c280971390740ecf0009e3fc827263a5c36773e584e4.jpg'], '2023-4-13': ['347c09cff9a23ee3efb4e538dcc836751634fba7613e19fe79b337ae0292b1ba.jpg'], '2023-4-14': ['d2a2c8aa2f1a0efa4f20e0a9bc7ce386295a67f5327eca346e68c4d8cbbac786.jpg', '4dc206d44df731b0ff7b41bed5011cb4ff356e49e9b6da90a42057d4f589e072.jpg', '9c06591ff46ac6614b8fec0c9a2a066b236f3eefcdfdf1fc0e10ef3867441d3a.jpg'], '2023-4-17': ['c04dc633ddc210d71d39886fa76facf155b8776a21c416dd405ca69889bfd9fa.jpg', '5df1587ae461ac4b3f03c5a6d839cef5fc4eeff791fbb462d34beef418027628.jpg', '2b32e863e746fc6af7a1cb3d1ae7910af46cc5e6839297ce625f16e0937e1298.jpg', 'cd7255c7fd073d3a87968897d0ec993e5fdc120b3b75806afe7851c2d773ab27.jpg', '0787a4f6695722454583a4d5272644270d79067aeba204e4f9fd9576cb7178b5.jpg', '9529597665ddd76455e1041b2eee816e3b6290abbc9a862433f25e91e5ffd728.jpg'], '2023-4-18': ['1820815df2aabe530b70b167b3c3c69b1c1531e016ce0c198637c41b7ac13564.jpg', '3254b508d3637fb566cc56ba72cf50d3a472ee437f43183a3c6bf010fc55cc7e.jpg', '8515f71381e53bc46e1fd988f27faf5a4eba5fc8e2a4aeab4edd0954fdf26298.jpg', '2def2db2d0892bcb402b875f90c363d09a795597bdbdcf36ba6488820929a22c.jpg'], '2023-4-20': ['cc1bfee9556cbabd541234e8c1ced0d4831b0a808601d1a8b9e5846c76ab5a9c.jpg', 'f98c5a66556a200bfc553fbbbf53d7b3a7e18c4198b960e7da15932449de5802.jpg', 'f8b54e7aa6f9fd4dc780efda7b8fdd7801b9d323130a5e50045b4fa48fbe1aa8.jpg', '10c76a92b3eac059bc6bfe3ac541b06978e7c0fffbc21d7aaffceefc319f9952.jpg', '5d6442b68284f6dbc67e6a32aa4da0ca3394c01d58433dc5efcf0d871e6a8810.jpg'], '2023-4-22': ['3f98ef3d3f8f39ce7ea0078314cd01d4fdd35cdd3ddaf5e316730dd205e03cbd.jpg', '6df31266cc7060ad3707639fa3c26052d97e5d4d5c9dac41eea50867d3cd226d.jpg', 'ee33e40632887b0d4a8ef51e16138d03003fabe586b273d3a2412ef56a3b611f.jpg', 'fe91048fe6c362938bb06881d36854c7d0f8d4beca611a9453cb664db6a0b843.jpg'], '2023-4-24': ['60812b72575560b8d7a0c2d1e89d3facc223c2eefb52b27075c4b9ebd13d9692.jpg', '9bc3c78730dfe560dd058e3d05ddd071a169901fd51034d894b81e894adceeff.jpg', 'f1ca1f59d72f1288738ea8c9eb19590331e291d76b02e57e8474f86783a4b8f7.jpg', 'eb6213bf402236aadf00a9b0571c85284e1695ca01e7523e4b95d2004958c64b.jpg', 'b4975a2fbd29b68e1e6511c7f6682a86aeb3b0a5db4ed9d1c9447174c596097d.jpg', '5f99c3589fdfbc6be21ceb9e89614b003b799bb8026190232a828db96e0e4d5e.jpg', '2785cb0b31dcfeb081aa9a28740cf0e94d4e1d28af8d83b6123dc257f29a13c8.jpg', '0c48dcae9121c9b4076a0b4d314bb3a801d09c6c780c9a9e650373c6b1e86dfd.jpg']}
                    model.clear()
                    for(var key in imgNames) {
                        model.append({key: key})
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
                    var temp = {}
                    for(var key in imgNames) {
                        var value = imgNames[key]
                        var temp2 = []
                        for(let i = 0; i < value.length; i++) {
                            if(value[i] !== selected.imgName) {
                                temp2.push(value[i])
                            }
                        }
                        temp[key] = temp2
                    }
                    imgNames = temp
                }
                contentItem: Text {
                    font.pointSize: 100
                    fontSizeMode: Text.Fit
                    horizontalAlignment: Text.AlignHCenter
                    verticalAlignment: Text.AlignVCenter
                    text: "이미지 제외(-)"
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
            Image {
                anchors.bottom: parent.bottom
                id: preview
                width: parent.width
                source: selected? "file:///home/sonic/Pictures/"+selected.imgName: ""
                fillMode: Image.PreserveAspectFit
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
                height: 737*(root.height/800)
                color: "gray"
                ListView {
                    id: listView
                    anchors.fill: parent
                    clip: true
                    model: ListModel {
                        id: model
                    }
                    delegate: Item {
                        id: item
                        width: listView.width
                        height: imgNames[key].length*30
                        Row {
                            spacing: 0
                            Rectangle {
                                id: rect1
                                width: item.width/5
                                height: item.height
                                color: "transparent"
                                border.color: "black"
                                Text {
                                    height: 30
                                    width: parent.width
                                    anchors.verticalCenter: parent.verticalCenter
                                    horizontalAlignment: Text.AlignHCenter
                                    verticalAlignment: Text.AlignVCenter
                                    font.pointSize: 100
                                    fontSizeMode: Text.Fit
                                    text: parent.height? key: ""
                                }
                            }

                            Column {
                                id: col
                                Repeater {
                                    model: imgNames[key].length
                                    Rectangle {
                                        property var imgName: imgNames[key][modelData]
                                        width: item.width - rect1.width
                                        height: 30
                                        color: selected === this? "white" : "transparent"
                                        border.color: "black"
                                        Text {
                                            id: path
                                            anchors.fill: parent
                                            verticalAlignment: Text.AlignVCenter
                                            font.pointSize: 100
                                            fontSizeMode: Text.Fit
                                            text: imgName
                                        }
                                        MouseArea {
                                            anchors.fill: parent
                                            onClicked: selected = parent
                                        }
                                    }
                                }
                            }
                        }
                    }
                    ScrollBar.vertical: ScrollBar {
                        policy: ScrollBar.AlwaysOn
                    }
                }
            }
        }
    }
}

