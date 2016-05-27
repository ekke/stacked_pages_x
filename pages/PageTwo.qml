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
    property string name: "PageTwo"
    Pane {
        id: root
        anchors.fill: parent
        ColumnLayout {
            anchors.right: parent.right
            anchors.left: parent.left
            LabelHeadline {
                leftPadding: 10
                text: qsTr("Hello Two")
            }
            HorizontalDivider {}
            RowLayout {
                // implicite fillWidth = true
                spacing: 20
                ButtonRaised {
                    text: "Pop"
                    buttonColor: accentColor
                    onClicked: {
                        navPane.popOnePage()
                    }
                }
                ButtonRaised {
                    text: "Push Three"
                    onClicked: {
                        navPane.pushOnePage(pageThree)
                    }
                }
                ButtonRaised {
                    text: "GoTo 5"
                    onClicked: {
                        navPane.goToPage(5)
                    }
                }
            } // button row
        } // col layout
    } // pane root
    ScrollIndicator.vertical: ScrollIndicator { }

    function whoAmI() {
        return qsTr("Message from Page Two")
    }
    // called immediately after push()
    function init() {
        console.log(qsTr("Init done from Two"))
    }
    // called immediately after pop()
    function cleanup() {
        console.log(qsTr("Cleanup done from Two"))
    }
} // flickable
