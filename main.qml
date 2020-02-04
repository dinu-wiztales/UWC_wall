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


    FontLoader{id:gothic_regular; source: "file:./League-Gothic/LeagueGothic-Regular.otf"}
    FontLoader{id:roboto_regular; source: "file:./roboto/Roboto-Regular.ttf" }
    FontLoader{id:roboto_condensed; source: "file:./roboto/RobotoCondensed-Regular.ttf"}

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
                PropertyChanges { target: pl4; x: 395; y: 340; }
                PropertyChanges { target: pl5; x: 395; y: 155; }
                PropertyChanges { target: pl6; x: 550; y: 250; }
                PropertyChanges { target: pl7; x: 550; y: 435; }
                PropertyChanges { target: pl8; x: 705; y: 345; }
                PropertyChanges { target: pl9; x: 705; y: 160; }
                PropertyChanges { target: pl10; x: 860; y: 250; }
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
                PropertyChanges { target: pl1; x: 500; y: 200; }
                PropertyChanges { target: pl2; x: 660; y: 295; }
                PropertyChanges { target: pl3; x: 340; y: 105; }
                PropertyChanges { target: pl4; x: 820; y: 200; }
                PropertyChanges { target: pl5; x: 180; y: 13; }
                PropertyChanges { target: pl6; x: 185; y: 200; }
                PropertyChanges { target: pl7; x: 30; y: 290; }
                PropertyChanges { target: pl8; x: 820; y: 385; }
                PropertyChanges { target: pl9; x: 665; y: 480; }
                PropertyChanges { target: pl10; x: 29; y: 106; }
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
                if (finalBigRectangle.visible) {
                    finalBigRectangle.visible = false
                } else {
                    currentPath.pop()
                    reload()
                    pathView.state = 'zigzag'
                }
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
                    font.pointSize: 26
                    color: "white"
                    visible: pathView.state == "open" || pathView.state == "close" ? false : true
                    font.family: roboto_condensed.name
                }



                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (currentPath.length == 1) {
                            finalBigRectangle.visible = true
                        } else {
                            currentPath.push(String(index+1))
                            pathView.state = 'close'
                        }
                    }
                }
            }
        }
    }


    Rectangle {
        id: finalBigRectangle
        anchors.fill: pathView
        anchors.margins: 100
        visible: false
        color: 'red'




        // Put Image or WebView or whatever here
    }



    property int delegateWidth: 200
    property int delegateHeight: 180


}
