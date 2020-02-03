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
        AnimatedImage {
            anchors.fill: parent
            source:  "file:./UWC/Hexagons.gif"
            playing: true
        }
    }



    property var currentPath: []


    FileManager {
        id: fileManager
    }

    function getCount(){

        var path = "UWC/" +  currentPath.join("/")
        return fileManager.folderCount(path)
    }

    function reload(){
        repeater.model = 0
        repeater.model = getCount()
    }


    Component.onCompleted:reload()


    Rectangle {
        id: pathView
        anchors.fill: parent
        anchors.margins: 50

        color: 'transparent'

        Path {
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
            PathLine { id: pl10 }
        }

        state: 'zigzag'

        states: [
            State {
                name: "zigzag"
                PropertyChanges { target: pl1; x: 85; y: 340; }
                PropertyChanges { target: pl2; x: 240; y: 245; }
                PropertyChanges { target: pl3; x: 240; y: 435; }
            },
            State {
                name: "close"
                PropertyChanges { target: pl1; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl2; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl3; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl4; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl5; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl6; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl7; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl8; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl9; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
                PropertyChanges { target: pl10; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.75; }
            },
            State {
                name: "open"
                PropertyChanges { target: pl1; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl2; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl3; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl4; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl5; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl6; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl7; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl8; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl9; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
                PropertyChanges { target: pl10; x: (pathView.width/2)-(delegateWidth/2); y: pathView.height * 0.25; }
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
                SmoothedAnimation { properties: "x,y,startX,startY"; easing.type: Easing.InOutQuad; duration: 500; }
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


        MouseArea {
            anchors.fill: parent
            onClicked: {
                currentPath.pop()
                reload()
            }
        }

        property var paths: [pl1, pl2, pl3, pl4, pl5, pl6, pl7, pl8, pl9, pl10]
        Repeater {
            id: repeater
            delegate: Rectangle {
                width: delegateWidth
                height: delegateHeight
                x: pathView.paths[index].x
                y: pathView.paths[index].y

                color: 'transparent'
                Image {
                    anchors.fill: parent
                    // anchors.margins: 20
                    // sourceSize.width: width
                    // sourceSize.height: height
                    property url path: "file:./UWC/" +  (currentPath.length  ? currentPath.join("/") + "/"  : "" ) + String(index + 1) + ".png"
                    source: path
                    // asynchronous: true
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
                        currentPath.push(String(index+1))
                        pathView.state = 'close'
                    }
                }
            }
        }
    }




    property int delegateWidth: 200
    property int delegateHeight: 180


}
