// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1

Rectangle {
    id: detailsRec
    width: 320
    height: 400

    function init(titles , values , offset) {
        if(titles.length == values.length)
        {
            for(var i = offset ; i < titles.length ; i++)
            {
                if(titles[i].length != 0)
                    detailsListModel.append({
                                            "showTitle" : titles[i],
                                            "showValue" : values[i],
                                            })
            }
        }
    }

    ListModel {
        id: detailsListModel
    }

    Component {
        id: detailsDelegate

        DetailsItem {
            id: item

            width: detailsRec.width
            color: detailsListView.currentIndex == index ? "orange" : "#2DB8B7"

            title: showTitle
            value: showValue

            MouseArea {
//                hoverEnabled : true
                anchors.fill: parent
                onPressed:{
                    detailsListView.currentIndex = index;
                }

                onReleased: {

                }
            }
        }
    }

    ListView {
        id: detailsListView

        spacing: 10

//        z: 0

        width: detailsRec.width
        height: detailsRec.height - controlArea.height

        anchors.top: detailsRec.top
        anchors.left: detailsRec.left
        anchors.right: detailsRec.right

        model: detailsListModel
        delegate: detailsDelegate
    }

    ControlArea {
        id:controlArea
        width: detailsRec.width
        color: "red"

        anchors.top: detailsListView.bottom
        anchors.left: detailsRec.left
        anchors.right: detailsRec.right

        onReturnButtunClicked: detailsRec.destroy()
    }
}
