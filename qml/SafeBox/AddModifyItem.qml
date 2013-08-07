// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: addModifyItemRec
    width: 300
    height: 120

    property alias title: nameText.text
    property alias value: valueInput.text

    Text {
        id: nameText

        anchors {
            top: addModifyItemRec.top
            left: addModifyItemRec.left
            right: addModifyItemRec.right

            leftMargin: 5
        }

        height: 60
        text: qsTr("title")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 12
    }

    TextInput {
        id: valueInput

        anchors {
            left: addModifyItemRec.left
            right: addModifyItemRec.right
            top: nameText.bottom

            leftMargin: 5
        }

        height: 60
        text: qsTr("text")

        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 12
    }


}
