// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0
import QtGraphicalEffects 1.0

// Flat Button
Button {
    id: button
    // default: flatButtonTextColor
    property alias textColor: buttonText.color
    Layout.fillWidth: true
    Layout.preferredWidth : 1
    leftPadding: 8
    rightPadding: 8
    contentItem: Text {
        id: buttonText
        text: button.text
        opacity: enabled ? 1.0 : 0.3
        color: flatButtonTextColor
        horizontalAlignment: Text.AlignHCenter
        verticalAlignment: Text.AlignVCenter
        elide: Text.ElideRight
        font.capitalization: Font.AllUppercase
    }
    background:
        Rectangle {
        id: buttonBackground
        implicitHeight: 48
        Layout.minimumWidth: 88
        color: button.pressed ? buttonText.color : "transparent"
        radius: 2
        opacity: button.pressed ? 0.12 : 1.0
    } // background
} // button
