// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: detailsRec
    width: 300
    height: 120

    property alias title: titleText.text
    property alias titleColor: titleText.color
    property alias titleBackGroudColor: titleRec.color

    property alias value: valueText.text
    property alias valueColor: valueText.color
    property alias valueBackGroudColor: valueRec.color

    Rectangle {
        id: titleRec
        height: detailsRec.height / 2

        color: detailsRec.color

        anchors {
            left: detailsRec.left
            right: detailsRec.right
            top:detailsRec.top
        }

        Text {
            id: titleText

            anchors.fill: parent
            anchors.leftMargin: 10
            text: qsTr("title")
            font.pointSize: 20
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
    }

    Rectangle {
        id: valueRec
        height: detailsRec.height / 2

        color: detailsRec.color

        anchors {
            left: detailsRec.left
            right: detailsRec.right
            top:titleRec.bottom

            topMargin: 5
        }

        Text {
            id: valueText

            anchors.fill: parent
            anchors.leftMargin: 15
            text: qsTr("value")
            font.pointSize: 25
            verticalAlignment: Text.AlignVCenter
            horizontalAlignment: Text.AlignLeft
        }
    }
}
