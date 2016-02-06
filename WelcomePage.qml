import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: welcomePage
    anchors.fill: parent

    Component.onCompleted: indicators.checked = 0

    Text {
        id: welcomeMessage
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: parent.top
        anchors.topMargin: (parent.height * 0.40)

        text: qsTr("Willkommen bei GroupTime!")
        color: "steelblue"
        font.pixelSize: 24
    }

    Button {
        id: forwardToSettings

        anchors.top: welcomeMessage.bottom
        anchors.topMargin: 25
        anchors.horizontalCenter: parent.horizontalCenter

        text: qsTr("Weiter")

        onClicked: {
            pageStack.push("qrc:/SettingsPage.qml")
        }
    }

    PageIndicatorDot {
        id: indicators

        dots: 3
    }
}

