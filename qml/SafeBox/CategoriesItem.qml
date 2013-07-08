// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id:itemRectangle
    width: 300
    height: 80
    color: "#000013"

    property alias text: showText.text
    property alias image: icomImage

    signal moreRectangleClicked()
    signal itemClicked()

    Image {
        id: icomImage
        x: 7
        y: 9
        width: 53
        height: 59
        source: "qrc:/qtquickplugin/images/template_image.png"
    }

    Text {
        id: showText
        x: 66
        y: 9
        width: 174
        height: 59
        text: qsTr("")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
    }

    Rectangle {
        id: moreRectangle
        x: 250
        y: 9
        width: 41
        height: 59
        color: "#A20013"

        Image {
            id: moreIcomImage
            x: 7
            y: 9
            width: 41
            height: 59
            source: "qrc:/qtquickplugin/images/template_image.png"
        }

        MouseArea {
            id: moreMouseArea
            anchors.fill: parent
            onClicked: itemRectangle.moreRectangleClicked()
        }
    }

    MouseArea {
        id: itemMouseArea
        anchors.fill: parent
        onClicked: itemRectangle.itemClicked()
    }
}
