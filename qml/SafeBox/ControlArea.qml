// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: controlArea
    width: 260
    height: 60

    signal returnButtunClicked()
    signal createButtunClicked()
    signal deleteButtunClicked()
    signal modifyButtunClicked()
    signal moreButtunClicked()

    Row {
        id: controlRow
        x: 10
        y: 10
        width: controlArea.width
        height: controlArea.height
//        spacing: (controlArea.width - 5*returnButtun.width) / 5
        spacing: 0
        anchors.fill: parent

        Buttun {
            id: returnButtun
            anchors {
                top: controlRow.top
                bottom: controlRow.bottom
            }

            onClicked: controlArea.returnButtunClicked()
        }

        Buttun {
            id: createButtun
            anchors {
                top: controlRow.top
                bottom: controlRow.bottom
            }

            onClicked: controlArea.createButtunClicked()
        }

        Buttun {
            id: deleteButtun
//            imageSource: "trash.png"
            anchors {
                top: controlRow.top
                bottom: controlRow.bottom
            }

            onClicked: controlArea.deleteButtunClicked()
        }

        Buttun {
            id: modifyButtun
            anchors {
                top: controlRow.top
                bottom: controlRow.bottom
            }

            onClicked: controlArea.modifyButtunClicked()
        }

        Buttun {
            id: moreButtun
            anchors {
                top: controlRow.top
                bottom: controlRow.bottom
            }

            onClicked: controlArea.moreButtunClicked()
        }
    }

    states: [
        State {
            name: "creatState"
            PropertyChanges {
                target: controlRow
                spacing: (controlArea.width - 3*returnButtun.width) / 2
            }
            PropertyChanges {
                target: createButtun
                width: returnButtun.width * 2
            }
            PropertyChanges {
                target: deleteButtun
                opacity: 0
            }
            PropertyChanges {
                target: modifyButtun
                opacity: 0
            }
            PropertyChanges {
                target: moreButtun
                opacity: 0
            }
        },
        State {
            name: "modifyState"
            PropertyChanges {
                target: controlRow
                spacing: (controlArea.width - 3*returnButtun.width) / 2
            }
            PropertyChanges {
                target: modifyButtun
                width: returnButtun.width * 2
            }
            PropertyChanges {
                target: createButtun
                opacity: 0
            }
            PropertyChanges {
                target: deleteButtun
                opacity: 0
            }
            PropertyChanges {
                target: moreButtun
                opacity: 0
            }
        },
        State {
            name: "default"
            PropertyChanges {
                target: returnButtun
                color: "#0d0c0c"
                width: controlArea.width / 5
            }
            PropertyChanges {
                target: createButtun
                color: "#7fa8cd"
                width: controlArea.width / 5
            }
            PropertyChanges {
                target: deleteButtun
                opacity: 1
//                color: "#ccdceb"
                color: "#2c69a0"
                width: controlArea.width / 5
            }
            PropertyChanges {
                target: modifyButtun
                opacity: 1
//                color: "#00529c"
                color: "#004786"
                width: controlArea.width / 5
            }
            PropertyChanges {
                target: moreButtun
                opacity: 1
                color: "#0d0c0c"
                width: controlArea.width / 5
            }
        }

    ]

}
