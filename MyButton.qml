import QtQuick 2.4

MouseArea {
    id: mouseArea

    property alias text: buttonText.text

    property int diameter: 30

    height: diameter
    width: diameter

    Rectangle {
        color: parent.pressed ? "steelblue" : "transparent"
        border.width: 1
        border.color: "steelblue"
        height: parent.height
        width: parent.width
        radius: parent.height / 2
        antialiasing: true
    }
    Text {
        id: buttonText
        anchors.centerIn: parent
        text: "<"
        color: parent.pressed ? "white" : "steelblue"
    }
}
