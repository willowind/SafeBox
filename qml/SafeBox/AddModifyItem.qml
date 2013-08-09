// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: addModifyItemRec
    width: 300
    height: 90

    property alias title: nameText.text
    property alias value: valueInput.text

    signal focusChanged()

    Text {
        id: nameText

        anchors {
            top: addModifyItemRec.top
            left: addModifyItemRec.left
            right: addModifyItemRec.right

            leftMargin: 5
        }

        height: 30
        text: qsTr("title")
        verticalAlignment: Text.AlignVCenter
        horizontalAlignment: Text.AlignLeft
        font.pixelSize: 12
    }

    Rectangle
    {
        id: valueRec
        height: 60
        width:100
        color:"lightblue"
        border.width: 3
        border.color: "#e41515"
        clip: true
        anchors {
            left: addModifyItemRec.left
            right: addModifyItemRec.right
            top: nameText.bottom
            bottom: addModifyItemRec.bottom
            leftMargin: 5
            rightMargin: 5
            bottomMargin: 5
        }

        TextInput
        {
            id:valueInput
            width: valueRec.width
            height: valueRec.height / 2

            font.pixelSize: 20
            color:"black"
            text: "test"
            horizontalAlignment: TextInput.AlignLeft
            anchors.verticalCenter: parent.verticalCenter
            anchors.leftMargin: 5

            onActiveFocusChanged: addModifyItemRec.focusChanged()
        }
    }

}
