// ekke (Ekkehard Gentz) @ekkescorner
import QtQuick 2.6
import QtQuick.Layouts 1.3
import Qt.labs.controls 1.0
import Qt.labs.controls.material 1.0
import QtGraphicalEffects 1.0
import "common"
import "pages"

// This app demonstrates HowTo use Qt 5.7 new Qt Quick Controls 2, High DPI and more
// This app is NOT a production ready app
// This app's goal is only to help you to understand some concepts
// see blog http://j.mp/qt-x to learn about Qt 5.7 for Material - styled Android or iOS Apps
// learn about this one_page_x app from this article: http://j.mp/qt-one-page-x
// ekke (Ekkehard gentz) @ekkescorner

ApplicationWindow {
    id: appWindow
    // visibile must set to true - default is false
    visible: true
    // primary and accent properties:
    property variant primaryPalette: myApp.defaultPrimaryPalette()
    property color primaryLightColor: primaryPalette[0]
    property color primaryColor: primaryPalette[1]
    property color primaryDarkColor: primaryPalette[2]
    property color textOnPrimaryLight: primaryPalette[3]
    property color textOnPrimary: primaryPalette[4]
    property color textOnPrimaryDark: primaryPalette[5]
    property string iconOnPrimaryLightFolder: primaryPalette[6]
    property string iconOnPrimaryFolder: primaryPalette[7]
    property string iconOnPrimaryDarkFolder: primaryPalette[8]
    property variant accentPalette: myApp.defaultAccentPalette()
    property color accentColor: accentPalette[0]
    property color textOnAccent: accentPalette[1]
    property string iconOnAccentFolder: accentPalette[2]
    Material.primary: primaryColor
    Material.accent: accentColor
    // theme Dark vs Light properties:
    property variant themePalette: myApp.defaultThemePalette()
    property color dividerColor: themePalette[0]
    property color cardAndDialogBackground: themePalette[1]
    property real primaryTextOpacity: themePalette[2]
    property real secondaryTextOpacity: themePalette[3]
    property real dividerOpacity: themePalette[4]
    property real iconActiveOpacity: themePalette[5]
    property real iconInactiveOpacity: themePalette[6]
    property string iconFolder: themePalette[7]
    property int isDarkTheme: themePalette[8]
    property color flatButtonTextColor: themePalette[9]
    // Material.dropShadowColor  OK for Light, but too dark for dark theme
    property color dropShadow: isDarkTheme? "#E4E4E4" : Material.dropShadowColor
    onIsDarkThemeChanged: {
        if(isDarkTheme == 1) {
            Material.theme = Material.Dark
        } else {
            Material.theme = Material.Light
        }
    }
    // font sizes - defaults from Google Material Design Guide
    property int fontSizeDisplay4: 112
    property int fontSizeDisplay3: 56
    property int fontSizeDisplay2: 45
    property int fontSizeDisplay1: 34
    property int fontSizeHeadline: 24
    property int fontSizeTitle: 20
    property int fontSizeSubheading: 16
    property int fontSizeBodyAndButton: 14 // is Default
    property int fontSizeCaption: 12
    // fonts are grouped into primary and secondary with different Opacity
    // to make it easier to get the right property,
    // here's the opacity per size:
    property real opacityDisplay4: secondaryTextOpacity
    property real opacityDisplay3: secondaryTextOpacity
    property real opacityDisplay2: secondaryTextOpacity
    property real opacityDisplay1: secondaryTextOpacity
    property real opacityHeadline: primaryTextOpacity
    property real opacityTitle: primaryTextOpacity
    property real opacitySubheading: primaryTextOpacity
    // body can be both: primary or secondary text
    property real opacityBodyAndButton: primaryTextOpacity
    property real opacityBodySecondary: secondaryTextOpacity
    property real opacityCaption: secondaryTextOpacity

    //

    header: StackTextTitle {
        text: qsTr("A simple Stacked - Pages APP")
    }

    footer: Pane {
        anchors.right: parent.right
        RowLayout {
            anchors.fill: parent
            visible: navPane.depth < 5
            FloatingActionButton {
                anchors.right: parent.right
                imageSource: "qrc:/images/"+iconOnPrimaryFolder+"/directions.png"
                onClicked: {
                    navPane.pushNextPage()
                }
            }
        }
    }

    StackView {
        id: navPane
        focus: true
        anchors.fill: parent
        initialItem: pageOne

        Keys.onBackPressed: {
            event.accepted = navPane.depth > 1
            popOnePage()
            // if navPane.depth == 1
            // perhaps ask user if app should quit
        }
        function popOnePage() {
            var page
            if(navPane.depth > 1) {
                page = pop()
            } else {
                page = get(0)
            }
            page.cleanup()
        }
        function pushOnePage(pageComponent) {
            var page = push(pageComponent)
            page.init()
        }
        function pushNextPage() {
            switch(navPane.depth) {
            case 1:
                pushOnePage(pageTwo)
                break;
            case 2:
                pushOnePage(pageThree)
                break;
            case 3:
                pushOnePage(pageFour)
                break;
            case 4:
                pushOnePage(pageFive)
                break;
            default:
                // nothing
            }
        }
    } // navPane

    Component {
        id: pageOne
        PageOne {
            id: page
            // we only need this for initialItem
            // items on stack will init() after push()
            Component.onCompleted: {
                page.init()
            }
        }
    } // pageTwo

    Component {
        id: pageTwo
        PageTwo {
        }
    } // pageTwo

    Component {
        id: pageThree
        PageThree {
        }
    }

    Component {
        id: pageFour
        PageFour {
        }
    }

    Component {
        id: pageFive
        PageFive {
        }
    }

    function switchPrimaryPalette(paletteIndex) {
        primaryPalette = myApp.primaryPalette(paletteIndex)
    }
    function switchAccentPalette(paletteIndex) {
        accentPalette = myApp.accentPalette(paletteIndex)
    }

    // we can loose the focus if Menu or Popup is opened
    // TODO: check code if 5.7 RC available because of
    // https://bugreports.qt.io/browse/QTBUG-53275
    function resetFocus() {
        navPane.focus = true
    }

    //
    PopupPalette {
        id: popup
        onAboutToHide: {
            resetFocus()
        }
    }

} // app window
