import QtQuick 2.0

Row {
    id: pageIndication
    anchors.horizontalCenter: parent.horizontalCenter
    anchors.bottom: parent.bottom
    anchors.bottomMargin: 5

    property int checked: -1
    property int dots: 3

    spacing: 5

    Repeater {
        model: dots
        Rectangle {
            width: 10
            height: 10
            radius: 10

            border.width: checkedState ? 0 : 1
            border.color: "grey"

            color: checkedState ? indicatorColor : "transparent"

            property color indicatorColor: "steelblue"
            property bool checkedState: checked == index ? true : false
        }
    }
}

