// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

//import "startEncryptionFace.js" as StartJs

Rectangle {
    id: background
    width: 320
    height: 400

    function initDigitButtun() {
        for(var i = 1 ; i <= 10 ; i++)
            digitModel.append({"digit": i % 10});

        digitModel.append({"digit": "*"});
        digitModel.append({"digit": "#"});
    }

    Rectangle {
        id: rectangleInput
        x: 21
        y: 11
        width: 275
        height: 52
        color: "#4d788d"

        TextInput {
            id: textInput
            text: qsTr("")
            echoMode: TextInput.PasswordEchoOnEdit
            anchors.fill: parent
            horizontalAlignment: TextInput.AlignHCenter

            font.pixelSize: 30
        }
    }

    Item {
        id: item
        x: 21
        y: 85
        width: 275
        height: 286

        ListModel {
            id: digitModel
            Component.onCompleted: {
                initDigitButtun();
            }
        }

        Component {
            id: digitDelegate
            DigitButtun {
                id: digitButtun
                text: digit
                onClicked: textInput.text += digit
            }
        }

        Component {
            id:digitHighlight
            Rectangle {
                width: 80
                height: 40
                color: "#2be472"
            }
        }

        GridView {
            id: digitView
            anchors.fill: parent
            cellWidth: 90
            cellHeight: 50
//            highlight: digitHighlight
            model: digitModel
            delegate: digitDelegate
        }
    }
}
