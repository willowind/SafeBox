// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id:minorRectangle
    width: 320
    height: 400

    property variant titles: ["", "", "", "", "", "", "", ""]

    function init(table) {
        StoreDB.getTableAllValueAndAppendToModel(table , minorListModel);
    }

    ListModel {
        id:minorListModel

        Component.onCompleted: {
//            StoreDB.initializeTable("emails_table");

//            var items = new Array("emails_table" , "163");
//            StoreDB.insertOrUpdateValue("emails_table" , items);

//            items[0] = "emails_table";
//            items[1] = "Gmail";
//            StoreDB.insertOrUpdateValue("emails_table" , items);

//            items[0] = "websites_table";
//            items[1] = "Websites";
//            StoreDB.insertOrUpdateValue("main_categories_table" , items);

//            StoreDB.getTableAllValueAndAppendToModel("main_categories_table" , minorListModel);
//            StoreDB.getTableAllValueAndAppendToModel("emails_table" , minorListModel);
        }
    }

    Component {
        id:minorDelegate


        CategoriesItem {
            id:minorItem
            width: minorRectangle.width
            color: minorListView.currentIndex == index ? "orange" : "#2DB8B7"

            tableName: itemData0
            text: itemData1

            Component.onCompleted: {
                var tmp = datas
                tmp[0] = itemData2
                tmp[1] = itemData3
                tmp[2] = itemData4
                tmp[3] = itemData5
                tmp[4] = itemData6
                tmp[5] = itemData7
                tmp[6] = itemData8
                tmp[7] = itemData9
                datas = tmp
            }

            MouseArea {
//                hoverEnabled : true
                anchors.fill: parent
                onPressed:{
                    minorListView.currentIndex = index;
                }

                onReleased: {
                    var object = Qt.createComponent("Details.qml").createObject(minorRectangle)
                    object.init(titles , minorItem.datas)
                    object.width = minorRectangle.width
                    object.height = minorRectangle.height
                }
            }
        }
    }

    ListView {
        id:minorListView
        spacing: 5

//        z: 0

        width: minorRectangle.width
        height: minorRectangle.height - controlArea.height

        anchors.top: minorRectangle.top
        anchors.left: minorRectangle.left
        anchors.right: minorRectangle.right

        model: minorListModel
        delegate: minorDelegate
    }

    ControlArea {
        id:controlArea
        width: minorRectangle.width
        color: "red"

        anchors.top: minorListView.bottom
        anchors.left: minorRectangle.left
        anchors.right: minorRectangle.right

        onReturnButtunClicked: minorRectangle.destroy()
    }
}
