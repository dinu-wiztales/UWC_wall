import QtQuick 2.14
import QtQuick.Window 2.12
//import QtQuick.VirtualKeyboard 2.4
import QtWebView 1.1
//import QtWebEngine 1.8
//import QtMultimedia 5.12
import FileManager 1.0

import QtQuick.Controls 2.5

Window {
    id: window
    visible: true
    //    visibility: "FullScreen"
    width: 1280
    height: 800
    title: qsTr("UWC")


    FontLoader{id:gothic_regular; source: "file:./League-Gothic/LeagueGothic-Regular.otf"}
    FontLoader{id:roboto_regular; source: "file:./roboto/Roboto-Regular.ttf" }
    FontLoader{id:roboto_condensed; source: "file:./roboto/RobotoCondensed-Regular.ttf"}


    property url webLink

    Rectangle {
        anchors.fill: parent
//        color: "black"

        //        Video {
        //            anchors.fill: parent
        //            source: "file:///D:/Downloads/UWC_Work_Files/Particles - 323.mp4"
        //            autoPlay: true
        //            loops: 200
        //        }

                AnimatedImage {
                    anchors.fill: parent
                    source:  "file:./UWC/particle.gif"
                    playing: true
                }
    }






    property var currentPath: []


    FileManager {
        id: fileManager
    }

//    Row {


//        anchors.top: parent.top
//        anchors.topMargin: 30
//        anchors.left: parent.left
//        anchors.leftMargin: parent.width/2 - 100
        //        anchors.verticalCenter: parent
//        spacing: 40


        Text {
            id: headText
            x : 400
            y : 30
            opacity: 1
            text: qsTr("Journey of 10 years")
            font.family: gothic_regular.name
            font.pointSize: 50
            color: "white"

            states: [
                State {
                    name: "vanish"
                    PropertyChanges {
                        target: headText
                        opacity : 0

                    }

                },
                State {
                    name: "appeared"
                    PropertyChanges {
                        target: headText
                        opacity: 1


                    }
                }
            ]
            Transition {
                PropertyAnimation {  properties: "opacity"; easing.type: Easing.bezierCurve ; duration: 1000}
            }

//            Transition {
//                from: "fromState"
//                to: "toState"

//            }

        }


        Image {
            id: headImage
            y : 10
            x : 100
            width: 266
            height: 156
            source: "file:./UWC/logo.png"

            Component.onCompleted: console.log(String(repeater.width[0]))
            states: [
                State {
                    name: "side"
                    PropertyChanges {
                        target: headImage
                        x : 1000

                    }
                },

                State {
                    name: "middle"
                    PropertyChanges {
                        target: headImage
                        x : 100

                    }
                }

            ]

            transitions: [
                Transition {
                    PropertyAnimation {  properties: "x"; easing.type: Easing.InOutQuad; duration: 1000; onFinished: console.log("true")}


                }

            ]

//            onStateChanged:  headText.opacity = !headText.opacity

        }

//    }


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
                PropertyChanges { target: pl1; x: 85; y: 440; }
                PropertyChanges { target: pl2; x: 240; y: 345; }
                PropertyChanges { target: pl3; x: 240; y: 535; }
                PropertyChanges { target: pl4; x: 395; y: 440; }
                PropertyChanges { target: pl5; x: 395; y: 255; }
                PropertyChanges { target: pl6; x: 550; y: 350; }
                PropertyChanges { target: pl7; x: 550; y: 535; }
                PropertyChanges { target: pl8; x: 705; y: 445; }
                PropertyChanges { target: pl9; x: 705; y: 260; }
                PropertyChanges { target: pl10; x: 860; y: 350; }
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
                PropertyChanges { target: pl1; x: 500; y: 250; }
                PropertyChanges { target: pl2; x: 660; y: 345; }
                PropertyChanges { target: pl3; x: 340; y: 155; }
                PropertyChanges { target: pl4; x: 820; y: 250; }
                PropertyChanges { target: pl5; x: 180; y: 63; }
                PropertyChanges { target: pl6; x: 185; y: 250; }
                PropertyChanges { target: pl7; x: 30; y: 340; }
                PropertyChanges { target: pl8; x: 820; y: 435; }
                PropertyChanges { target: pl9; x: 665; y: 530; }
                PropertyChanges { target: pl10; x: 29; y: 156; }
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


//        MouseArea {
//            anchors.fill: parent
//            onClicked: {

//                    currentPath.pop()
//                    reload()
//                    pathView.state = 'zigzag'
//                    headImage.state = "middle"
//                    headText.state = "appeared"
//            }
//        }

        property var paths: [pl1, pl2, pl3, pl4, pl5, pl6, pl7, pl8, pl9, pl10]
        Repeater {
            id: repeater
            delegate: Rectangle {

                width: currentPath.length == 1 ? index == 0 ? 260: delegateWidth : delegateWidth
                height: currentPath.length == 1 ? index == 0 ? 240 : delegateHeight : delegateHeight
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

                Rectangle {
                    anchors.fill: parent
                    anchors.margins: 30
                    color: "transparent"
                    Text {
                        id:textData
                        anchors.centerIn:parent

                        text: fileManager.getText("UWC/" +  (currentPath.length  ? currentPath.join("/") + "/"  : "" ) + String(index + 1) + ".txt")
                        font.pointSize: currentPath.length == 0 ? 26 : 20
                        wrapMode: Text.Wrap
                        horizontalAlignment:Text.AlignHCenter
                        color: currentPath.length == 0 ? "black" : "white"
                        visible: pathView.state == "open" || pathView.state == "close" ? false : true
                        font.family: roboto_condensed.name
                        font.bold: true
                    }
                }






                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        if (currentPath.length == 1) {
//                            webView.reload()
                            if(index != 0){

                                webLink =   "file:///C:/Users/Wiztales/Documents/build-UWC_disclosure-Desktop_Qt_5_14_0_MSVC2017_64bit-Release/website/"+(currentPath.length  ? currentPath.join("/") + "/"  : "" )+(index)+".html"
                                finalBigRectangle.state= "moved"
                            }


                        } else {
                            closeAll.visible = true
                            headImage.state = "side"
                            headText.state= "vanish"
                            currentPath.push(String(index+1))
                            pathView.state = 'close'
                        }
                    }
                }
            }
        }
    }



    Rectangle {

        id: closeAll
        anchors.right: parent.right
        visible: false
        anchors.rightMargin: 50
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 50
        color: "#696969"
        width: 100
        height: 100
        radius:100
        Text {
            anchors.centerIn: parent
            text: qsTr("BACK")
            font.family: roboto_condensed.name
            color: "black"
            font.pointSize: 16
        }
            MouseArea {
                anchors.fill: parent
                onClicked: {

                        currentPath.pop()
                        reload()
                        pathView.state = 'zigzag'
                        headImage.state = "middle"
                        headText.state = "appeared"
                        closeAll.visible = false
                }
            }
    }





    Rectangle {
        id: finalBigRectangle
        opacity: 1
        anchors.centerIn : parent
//        anchors.bottom: parent.bottom
//        anchors.left: parent.left
        color: 'black'
        width: 0
        height: 0

//        Component.onCompleted: width = 0

        WebView{
            id:webView
            anchors.fill: parent
            url: webLink
            Component.onCompleted: webView.reload()
//            width: 0
//            height: /0

        }

        Rectangle {
            anchors.right: parent.right
            anchors.bottom: parent.bottom
            color: "#696969"
            width: finalBigRectangle.width == 0? 0 : 50
            height: finalBigRectangle.width == 0? 0 : 50

            MouseArea {
                anchors.fill: parent
                onClicked: finalBigRectangle.state = "small"
            }
        }



        states:[

            State {
                name: "moved"
                PropertyChanges {

                    target: finalBigRectangle;
                    width: pathView.width;
                    height: pathView.height;
//                    radius:

                }
            },
            State {
                name: "small"
                PropertyChanges {
                    target: finalBigRectangle; width: 0; height : 0;

                }
            }


        ]
        transitions:[
            Transition {
                PropertyAnimation {  properties: "width,radius,height"; easing.type: Easing.InOutQuad; duration: 300}


            }
        ]


        // Put Image or WebView or whatever


    }







    property int delegateWidth: 200
    property int delegateHeight: 180


}
