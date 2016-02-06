import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

import "clock.js" as Clock

Rectangle {
    id: timerPage

    property int groups
    property alias timeStringText: timeString.text

    Component.onCompleted: {
        indicators.checked = 2
    }

    Timer {
        id: countDownTimer

        running: false
        interval: 1000
        repeat: true
        onTriggered: {
            timeString.text = Clock.get_new_time(timeString.text)
            if(timeString.text == "00:00:00") {
                stop()
                startStopButton.text = "Start"
                mainApplicationWindow.showNormal()
            }
        }
    }

    Row {
        id: headerTimerPage
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 10

        MyButton {
            id: backToSettings

            anchors.verticalCenter: countdownHeader.verticalCenter
            text: "<"
            onClicked: {
                countDownTimer.stop()
                mainApplicationWindow.showNormal()
                pageStack.pop()
            }
        }
        Text {
            id: countdownHeader

            text: qsTr("GroupTime!")
            color: "steelblue"
            font.family: "Calibri Light"
            font.pixelSize: 24
        }
    }

    MyButton {
        id: startStopButton

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.verticalCenter: headerTimerPage.verticalCenter
        anchors.topMargin: 20

        diameter: 45
        text: "Start"

        onClicked: {
            if(text == "Start") {
                countDownTimer.start()
                text = "Stop"
                mainApplicationWindow.showMaximized()
            }
            else if(text == "Stop") {
                countDownTimer.stop()
                text = "Start"
                mainApplicationWindow.showNormal()
            }
        }
    }

    Text {
        id: timeString

        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: startStopButton.bottom
        anchors.topMargin: 10

        font.family: "Calibri Light"
        font.pixelSize: 120
        color: "darkgrey"
    }

    ListView {
        id: groupList

        anchors.top: timeString.bottom
        anchors.topMargin: 20
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 20
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.right: parent.right
        anchors.rightMargin: 20

        spacing: 10
        model: groups

        delegate: Rectangle {
            id: editRect
            height: (groupList.height - groups*10) / groups
            width: parent.width
            border.width: 1
            border.color: "darkgrey"

            TextArea {
                id: editField

                anchors.fill: parent

                textFormat: TextEdit.RichText
                selectByMouse: true
                font.family: "Calibri"
                font.pixelSize: 32
                wrapMode: TextEdit.WordWrap

                menu: TextEditMenu {id: textEditMenu}
            }
        }
    }

    PageIndicatorDot {
        id: indicators

        dots: 3
    }
}
