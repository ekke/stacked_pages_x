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
    property string name: "PageFour"
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Four")
            }
            HorizontalDivider {}
            RowLayout {
                // implicite fillWidth = true
                spacing: 20
                ButtonFlat {
                    text: "Pop"
                    textColor: accentColor
                    onClicked: {
                        navPane.popOnePage()
                    }
                }
                ButtonFlat {
                    text: "Push Five"
                    onClicked: {
                        navPane.pushOnePage(pageFive)
                    }
                }
                Item {
                    // dummi placeholder
                    Layout.preferredWidth : 1
                    Layout.fillWidth: true
                }
            } // button row
            HorizontalDivider {}
            LabelSubheading {
                // to load the page if uninitialized, use:
                // text: navPane.get(2, StackView.ForceLoad).whoAmI()
                // default is StackView.DontLoad, so check for null !
                text: navPane.get(2)? navPane.get(2, StackView.ForceLoad).whoAmI() : "n/a"
            }
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Four")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Four"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Four"))
    }
} // flickable
