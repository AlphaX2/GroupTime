import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Dialogs 1.2

Menu {
    id: menu
    title: qsTr("Textoptionen")

    FontDialog {
        id: fontDialog
        title: "Schriftart"
        modality: Qt.ApplicationModal

        onAccepted: {
            editField.font = font
        }
    }

    ColorDialog {
        id: colorDialog
        title: "Farbe"
        modality: Qt.ApplicationModal

        onAccepted: {
            editField.textColor = color
        }
    }

    MenuItem {
        text: "Ausschneiden"
        shortcut: StandardKey.Cut
        onTriggered: editField.cut()
    }
    MenuItem {
        text: qsTr("Einfügen")
        shortcut: StandardKey.Paste
        onTriggered: editField.paste()
    }
    MenuItem {
        text: qsTr("Kopieren")
        shortcut: StandardKey.Copy
        onTriggered: editField.copy()
    }
    MenuSeparator {}

    MenuItem {
        text: "Textoptionen"
        onTriggered: fontDialog.visible = true
    }
    MenuItem {
        text: "Textfarbe"
        onTriggered: colorDialog.visible = true
    }
}




