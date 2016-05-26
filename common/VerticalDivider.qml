// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0

Item {
    implicitWidth: 8
    anchors.top: parent.top
    anchors.bottom: parent.bottom
    // https://www.google.com/design/spec/components/dividers.html#dividers-types-of-dividers
    Rectangle {
        id: theRectangle
        width: 1
        height: parent.height
        anchors.horizontalCenter: parent.horizontalCenter
        opacity: dividerOpacity
        color: dividerColor
    }
}
