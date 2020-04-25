import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.12
import QtQuick.Layouts 1.13

Window {
    id:window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")
    MouseArea {
            id: mouseRegion
            anchors.fill: parent;
            acceptedButtons: Qt.LeftButton | Qt.RightButton

            onClicked: {
                rect.state = "hide"
            }
        }

        Menu {
            id: option_menu

            MenuItem {
                text: "Cut"

                onTriggered: {}
            }

            MenuItem {
                text: "Copy"

                onTriggered: {}
            }

            MenuItem {
                text: "Paste"

                onTriggered: {}
            }

            MenuSeparator { }

            Menu {
                title: "More Stuff"

                MenuItem {
                    text: "Do Nothing"
                }
            }
        }

        MouseArea {
                id: mouseRegion2
                width: parent.width
                height: 5;
                x:0
                y:parent.height-5
                acceptedButtons: Qt.LeftButton | Qt.RightButton

                onClicked: {
                    rect.state = "display"
                }

            }
        Rectangle {
                id: rect
                width: parent.width
                height: 20
                color:"#00ff00"
                x:0
                y:parent.height-20
                Text {
                    x:parent.width/3*2

                    anchors.verticalCenter :parent.verticalCenter
                    text: "UTF-8"
                    MouseArea{
                        anchors.fill: parent;
                        onClicked: {

                            option_menu.popup();
                        }
                    }
                }

                states: [
                State{
                    name:"display"
                    PropertyChanges {
                        target: rect
                        y:parent.height-20
                    }
                },State{
                        name:"hide"
                        PropertyChanges {
                            target: rect
                            y:parent.height
                        }
                    }]
                state:"display"

                transitions:[Transition{
                        from:"display"
                        to: "hide"
//                        reversible: true;
                    NumberAnimation{
                        property: "y";
                        easing.type: Easing.InOutQuad;
                        duration: 500;
                    }
                },Transition{
                        from:"hide"
                        to: "display"
//                        reversible: true;
                    NumberAnimation{
                        property: "y";
                        easing.type: Easing.InOutQuad;
                        duration: 500;
                    }
                }]
            }
}

