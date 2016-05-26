// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import Qt.labs.controls 1.0

Row {
    property alias text: switchLabel.text
    property alias checked: theSwitch.checked
    leftPadding: 6
    LabelBody {
        id: switchLabel
        wrapMode: Text.WordWrap
        anchors.verticalCenter: parent.verticalCenter
    }
    Switch {
        id: theSwitch
        anchors.verticalCenter: parent.verticalCenter
    }
}
