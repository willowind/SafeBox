// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1


Rectangle {
    id:itemRectangle
    width: 300
    height: 60

    property alias text: showText.text
    property alias iconImageSource: icomImage.source
    property alias moreRecColor: moreRectangle.color


    property string tableName: ""
    property string showName: showText.text

    property variant datas: ["", "", "", "", "", "", "", "", "", ""]

    signal moreRectangleClicked()
    signal itemClicked()


    MouseArea {
        id: itemMouse
        anchors.fill: parent
        onClicked: itemRectangle.itemClicked()
    }

    Image {
        id: icomImage
        width: 40

        anchors {
            left: parent.left
            top: parent.top
            bottom: parent.bottom
        }
    }

    Text {
        id: showText
        text: qsTr("")
        color: "white"

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
        width: itemRectangle.height
        color: itemRectangle.color

        anchors {
            top: parent.top
            bottom: parent.bottom
            right: parent.right
        }

        Image {
            id: moreIcomImage
            anchors.fill: parent
        }

        MouseArea {
            id: moreMouse
            anchors.fill: parent
            onPressed: moreRectangle.color = "#00529c"
            onReleased: {
//                moreRectangle.color = "#2c69a0"
                itemRectangle.moreRectangleClicked()
            }
        }
    }
}
