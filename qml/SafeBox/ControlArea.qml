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
        spacing: (controlArea.width - 5*returnButtun.width) / 5

        Buttun {
            id: returnButtun
            onClicked: controlArea.returnButtunClicked()

        }

        Buttun {
            id: createButtun
            onClicked: controlArea.createButtunClicked()
        }

        Buttun {
            id: deleteButtun
            onClicked: controlArea.deleteButtunClicked()
        }

        Buttun {
            id: modifyButtun
            onClicked: controlArea.modifyButtunClicked()
        }

        Buttun {
            id: moreButtun
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
            name: ""
            PropertyChanges {
                target: controlRow
                spacing: (controlArea.width - 5*returnButtun.width) / 5
            }
            PropertyChanges {
                target: createButtun
                width: returnButtun.width
            }
            PropertyChanges {
                target: deleteButtun
                opacity: 1
            }
            PropertyChanges {
                target: modifyButtun
                opacity: 1
            }
            PropertyChanges {
                target: moreButtun
                opacity: 1
            }
        }
    ]

}
