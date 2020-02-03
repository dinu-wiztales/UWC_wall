import QtQuick 2.14
import QtQuick.Window 2.12
import QtQuick.VirtualKeyboard 2.4

import FileManager 1.0

import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    width: 1280
    height: 800
    title: qsTr("UWC")

    Rectangle {
        anchors.fill: parent
//        color: "tranparent"
        AnimatedImage {
            anchors.fill:parent
            source: "file:///C:/Users/Wiztales/Documents/build-UWC_disclosure-Desktop_Qt_5_14_0_MinGW_64_bit-Debug/UWC/Hexagons.gif"
            playing: true
//            paused: false
        }
    }

    property var _centerText : ""
//    Rectangle {
//        anchors.fill: parent
//        color: "transparent"
//        AnimatedImage {
//            anchors.fill: parent
//            source: "file:///C:/Users/Wiztales/Documents/build-UWC_disclosure-Desktop_Qt_5_14_0_MinGW_64_bit-Debug/UWC/Hexagons_front.gif"
//            paused: true
//        }
//    }



    property var currentPath: []


    FileManager {
        id: fileManager
    }

    function getCount(){

        var path = "UWC/" +  currentPath.join("/")
        return fileManager.folderCount(path)
//        return 10
    }

    function reload(){
        pathView.model = 0
        pathView.model = getCount()
    }


    Component.onCompleted:{

//        reload()
//        var data = currentPath
//        console.log(data.length)
}




//    GridView {
    PathView {
        id: pathView
//        visible: false
        anchors.fill: parent
        anchors.margins: 100

//        model: 3


        path: Path {
            id: pathLines
            PathLine { id: pl1 }
            PathLine { id: pl2 }
            PathLine { id: pl3 }
            PathLine { id: pl4 }
            PathLine { id: pl5 }
            PathLine { id: pl6 }
            PathLine { id: pl7 }
            PathLine { id: pl8 }
            PathLine { id: pl9 }
        }

        model: 2
        state: 'zigzag'

        states: [
            State {
                name: "zigzag"
                PropertyChanges { target: pathLines; startX: 195; startY: 435; }
//                PropertyChanges { target: pl1; x: 370; y: 335; }
//                PropertyChanges { target: pl2; x: 370; y: 575; }
//                PropertyChanges { target: pl3; x: 540; y: 450; }
//                PropertyChanges { target: pl4; x: 545; y: 250; }
//                PropertyChanges { target: pl5; x: 725; y: 345; }
//                PropertyChanges { target: pl6; x: 725; y: 545; }
//                PropertyChanges { target: pl7; x: 900; y: 440; }
//                PropertyChanges { target: pl8; x: 910; y: 250; }
//                PropertyChanges { target: pl9; x: 1075; y: 340; }

                PropertyChanges { target: pl1; relativeX: 175; relativeY: -100; }
                PropertyChanges { target: pl2; relativeX: 0; relativeY: 240; }
//                PropertyChanges { target: pl3; x: 540; y: 450; }
//                PropertyChanges { target: pl4; x: 545; y: 250; }
//                PropertyChanges { target: pl5; x: 725; y: 345; }
//                PropertyChanges { target: pl6; x: 725; y: 545; }
//                PropertyChanges { target: pl7; x: 900; y: 440; }
//                PropertyChanges { target: pl8; x: 910; y: 250; }
//                PropertyChanges { target: pl9; x: 1075; y: 340; }
            },
            State {
                name: "close"
                PropertyChanges { target: pathLines; startX: pathView.width/2; startY: pathView.height * 0.75; }
                PropertyChanges { target: pl1; x: pathView.width/2; y: pathView.height * 0.75; }
                PropertyChanges { target: pl2; x: pathView.width/2; y: pathView.height * 0.75; }
                PropertyChanges { target: pl3; x: pathView.width/2; y: pathView.height * 0.75; }
                PropertyChanges { target: pl4; x: pathView.width/2; y: pathView.height * 0.75; }
                PropertyChanges { target: pl5; x: (pathView.width/2) + 1; y: pathView.height * 0.75; } // Note: "+1" to fix disappearance bug
            },
            State {
                name: "open"
                PropertyChanges { target: pathLines; startX: pathView.width/2; startY: pathView.height/4; }
                PropertyChanges { target: pl1; x: pathView.width/2; y: pathView.height/4; }
                PropertyChanges { target: pl2; x: pathView.width/2; y: pathView.height/4; }
                PropertyChanges { target: pl3; x: pathView.width/2; y: pathView.height/4; }
                PropertyChanges { target: pl4; x: pathView.width/2; y: pathView.height/4; }
                PropertyChanges { target: pl5; x: pathView.width/2 + 1; y: pathView.height/4; } // Note: "+1" to fix disappearance bug
            },
            State {
                name: "triangle"
                PropertyChanges { target: pathLines; startX: 200; startY: 500; }
                PropertyChanges { target: pl1; x: 400; y: 700; }
                PropertyChanges { target: pl2; x: 600; y: 500; }
                PropertyChanges { target: pl3; x: 350; y: 500; }
                PropertyChanges { target: pl4; x: 300; y: 500; }
                PropertyChanges { target: pl5; x: 250; y: 500; }
            }

        ]

        transitions: [
           Transition {
                to: 'zigzag'
                SmoothedAnimation { properties: "x,y,startX,startY"; easing.type: Easing.InOutQuad; duration: 500; onFinished:{

//                        pathView.state = 'triangle'
//                        reload()
                    }
                }
            },
            Transition {
                to: 'triangle'
                SmoothedAnimation { properties: "x,y,startX,startY"; easing.type: Easing.InOutQuad; duration: 500; }
            },
            Transition {
                to: 'close'
                SmoothedAnimation { properties: "x,y,startX,startY"; easing.type: Easing.InOutQuad; duration: 500;}
                onRunningChanged: {
                    if (!running) {
                        reload()
                        pathView.state = 'open'
                    }

                }

            },
            Transition {
                from: "close"
                to: 'open'
                SmoothedAnimation { properties: "x,y,startX,startY"; easing.type: Easing.InOutQuad; duration: 500;}
                onRunningChanged: !running ? pathView.state = 'triangle' : ''
            }
        ]


        delegate: Rectangle {
            width: 200
            height: 180
            color: 'transparent'
            Image {
                anchors.fill: parent
//                anchors.margins: 20
//                sourceSize.width: width
//                sourceSize.height: height
                property url path: "file:./UWC/" +  (currentPath.length  ? currentPath.join("/") + "/"  : "" ) + String(index + 1) + ".png"
                source: path
//                asynchronous: true

            }

            Text {
                id:textData
                anchors.centerIn: parent
                text: fileManager.getText("UWC/" +  (currentPath.length  ? currentPath.join("/") + "/"  : "" ) + String(index + 1) + ".txt")
                font.pointSize: 30
                color: "white"
                visible: pathView.state == "open" || pathView.state == "close" ? false : true

            }



            MouseArea {
                anchors.fill: parent
                onClicked: {
                    _centerText = textData.text
                    var path_data = currentPath
                    currentPath.push(String(index+1))
                    pathView.state = 'close'
                }
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                currentPath.pop()
                reload()
            }
        }
    }

//    Rectangle {

//    }






}
