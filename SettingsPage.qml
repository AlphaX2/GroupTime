import QtQuick 2.4
import QtQuick.Controls 1.3

Rectangle {
    id: settingsPage

    anchors.fill: parent

    Component.onCompleted: {
        indicators.checked = 1
    }

    Row {
        spacing: 10
        anchors.left: parent.left
        anchors.leftMargin: 20
        anchors.top: parent.top
        anchors.topMargin: 10

        MyButton {
            id: backToStart

            anchors.verticalCenter: settingsHeader.verticalCenter
            text: "<"
            onClicked: pageStack.pop()
        }

        Text {
            id: settingsHeader

            text: qsTr("Einstellungen")
            color: "steelblue"
            font.family: "Calibri Light"
            font.pixelSize: 24
        }
    }

    Column {
        id: settingsColumn

        anchors.centerIn: parent
        spacing: 15

        Text {
            font.family: "Calibri Light"
            font.pixelSize: 16
            text: "Anzahl der Gruppen:"
        }
        ComboBox {
            id: groupCombo
            model: [1,2,3,4,5,6,7,8,9,10]
        }

        Row {
            spacing: 5
            Text {
                font.family: "Calibri Light"
                font.pixelSize: 16
                text: "Countdown:"
            }
            Text {
                font.family: "Calibri Light"
                font.pixelSize: 16
                text: "Stunden | "
            }
            Text {
                font.family: "Calibri Light"
                font.pixelSize: 16
                text: "Minuten | "
            }
            Text {
                font.family: "Calibri Light"
                font.pixelSize: 16
                text: "Sekunden"
            }
        }

        Row {
            spacing: 5
            ComboBox {
                id: hoursCombo
                model: 25
            }
            ComboBox {
                id: minutesCombo
                model: 60
            }
            ComboBox {
                id: secondsCombo
                model: 60
            }
        }
    }

    Button {
        id: forwardToStart

        anchors.top: settingsColumn.bottom
        anchors.topMargin: 35
        anchors.horizontalCenter: parent.horizontalCenter

        text: qsTr("Weiter")

        onClicked: {

            var h = parseInt(hoursCombo.currentText)
            var m = parseInt(minutesCombo.currentText)
            var s = parseInt(secondsCombo.currentText)
            var g = parseInt(groupCombo.currentText)

            // add leading 0 in case of smaller number than 10
            if (s < 10) { var new_s = "0"+s+""}
            else {new_s = s}

            if (m <10) { var new_m = "0"+m+""}
            else {new_m = m}

            if (h < 10) { var new_h = "0"+h+""}
            else {new_h = h}

            // new solution
            var timeString = new_h.toString()+":"+new_m.toString()+":"+new_s.toString()
            pageStack.push({item: "qrc:/TimerPage.qml",
                            properties:{"groups":g, "timeStringText":timeString}})


            // old solution
//            timerPage.groups = g
//            timerPage.timeStringText = new_h.toString()+":"+new_m.toString()+":"+new_s.toString()

//            pageStack.push(timerPage)


        }
    }


    PageIndicatorDot {
        id: indicators

        dots: 3
    }

}

