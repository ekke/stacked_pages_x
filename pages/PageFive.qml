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
    property string name: "PageFive"
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Five")
            }
            HorizontalDivider{}
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
                    text: "Find Three"
                    onClicked: {
                        var stackIndex = navPane.findPage("PageThree")
                        if(stackIndex >= 0) {
                            navPane.goToPage(stackIndex + 1)
                        } else {
                            statusLabel.text = qsTr("PageThree not found in StackView")
                        }
                    }
                }
                ButtonFlat {
                    text: "Back To 3"
                    onClicked: {
                        navPane.goToPage(3)
                    }
                }
            } // button row
            HorizontalDivider {}
            LabelSubheading {
                id: statusLabel
                visible: text.length
                text: ""
                color: "red"
            }
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Five")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Five"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Five"))
    }
} // flickable
