// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: buttun
    width: 40
    height: 40
    color: "#1ABC9C"

    property alias text: digitText.text
    property alias imageSource: image.source

    signal clicked()

    Image {
        id: image
        anchors.fill: parent
    }

    Text {
        id: digitText
        text: qsTr("")
        style: Text.Outline
        font.pixelSize: 30
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignHCenter
        wrapMode: Text.WordWrap
        smooth: true
        anchors.fill: parent
    }

    MouseArea {
        id: mouse_area
        anchors.fill: parent
        onClicked: buttun.clicked()
    }
}
