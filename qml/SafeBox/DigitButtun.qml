// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: digitButtun
    width: 80
    height: 40
    color: "#1b356f"

    property alias text: digitText.text

    signal clicked()

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
        onClicked: digitButtun.clicked()
    }
}
