// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: addModifyRec

    width: 320
    height: 400

    function init(titles , values) {
        if(titles.length == values.length)
        {
            for(var i = 0 ; i < titles.length ; i++)
            {
                addModifyListModel.append({
                                            "showTitle" : titles[i],
                                            "showValue" : values[i],
                                        })
            }
        }
    }


    ListModel {
        id: addModifyListModel
    }

    Component {
        id: addModifyDelegate

        AddModifyItem {
            id: item

            width: addModifyRec.width
            color: addModifyListView.currentIndex == index ? "orange" : "#2DB8B7"

            title: showTitle
            value: showValue

            onFocusChanged: addModifyListView.currentIndex = index;
        }
    }

    ListView {
        id: addModifyListView

        spacing: 5

//        z: 0

        width: addModifyRec.width
        height: addModifyRec.height - controlArea.height

        anchors.top: addModifyRec.top
        anchors.left: addModifyRec.left
        anchors.right: addModifyRec.right

        model: addModifyListModel
        delegate: addModifyDelegate
    }

    ControlArea {
        id:controlArea
        width: addModifyRec.width
        color: "red"

        anchors.top: addModifyListView.bottom
        anchors.left: addModifyRec.left
        anchors.right: addModifyRec.right

        onReturnButtunClicked: addModifyRec.destroy()
    }
}
