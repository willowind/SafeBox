// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id:itemRectangle
    width: 300
    height: 60
    color: "#2DB8B7"
    border.color: "green"
    border.width: 2

    property alias text: showText.text
    property alias iconImageSource: icomImage.source
    property alias moreImageSource: moreIcomImage.source


    property string tableName: ""
    property string showName: showText.text

    property variant datas: ["", "", "", "", "", "", "", "", "", ""]


    signal moreRectangleClicked()
    signal itemClicked()


    Image {
        id: icomImage
        width: 40

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom

            leftMargin: 5
            topMargin: 5
            bottomMargin: 5
        }
    }

    Text {
        id: showText
        text: qsTr("")

        anchors {
            left: icomImage.right
            right: moreRectangle.left
            top: parent.top
            bottom: parent.bottom
            leftMargin: 10
        }

        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 30
    }

    Rectangle {
        id: moreRectangle
        width: 40
        color: "#A20013"

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right

            topMargin: 5
            bottomMargin: 5
            leftMargin: 10
            rightMargin: 5
        }

        Image {
            id: moreIcomImage
            anchors.fill: parent
        }
    }
}
