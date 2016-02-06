import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2

ApplicationWindow {
    id: mainApplicationWindow

    title: qsTr("GroupTime!")
    minimumWidth: 640
    minimumHeight: 480
    visible: true

   StackView {
       id: pageStack
       anchors.fill: parent
       initialItem: WelcomePage {id: welcomePage}
   }
}
