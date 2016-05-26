// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0
import QtGraphicalEffects 1.0
import "../common"

Flickable {
    id: flickable
    contentHeight: root.implicitHeight
    // StackView manages this, so please no anchors here
    // anchors.fill: parent
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Stack")
            }
            HorizontalDivider {}
            RowLayout {
                // implicite fillWidth = true
                spacing: 20
                ButtonRaised {
                    text: "Push Two"
                    onClicked: {
                        navPane.pushOnePage(pageTwo)
                    }
                }
                Item {
                    // dummi placeholder for up to 2 more buttons
                    Layout.preferredWidth : 2
                    Layout.fillWidth: true
                }
            } // button row
        } // col layout
    } // root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page One")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from One"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from One"))
    }
} // flickable
