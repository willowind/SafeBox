// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: addModifyItemRec
    width: 300
    height: 90

    property alias title: nameText.text
    property alias value: valueInput.text

    signal focusChanged()
    signal accepteData()

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

        Item {
            id: valueItem

            anchors {
                left: valueRec.left
                right: valueRec.right
                top: valueRec.top
                bottom: valueRec.bottom

                leftMargin: 10
            }

            TextInput
            {
                id:valueInput
                width: valueRec.width
                height: valueRec.height / 2

                horizontalAlignment: TextInput.AlignLeft
                anchors.verticalCenter: parent.verticalCenter

                smooth: true
                autoScroll: true

                font.pixelSize: 20

                onAccepted: addModifyItemRec.accepteData()
                onActiveFocusChanged: addModifyItemRec.focusChanged()
            }

            Text {
                id: defaultText
                text: qsTr("NULL")

                anchors.fill: valueInput
                font {
                    pixelSize: valueInput.font.pixelSize
                    italic: true
                }

                states: [
                    State {
                        name: "hasText"
                        when: valueInput.text != ""
                        PropertyChanges {
                            target: defaultText
                            opacity: 0
                        }
                    },
                    State {
                        name: ""
                        when: valueInput.text == ""
                        PropertyChanges {
                            target: defaultText
                            opacity: 1
                        }
                    }
                ]
            }
        }
    }
}
