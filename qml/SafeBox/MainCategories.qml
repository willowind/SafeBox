// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id:categoriesRectangle
    width: 320
    height: 400

    ListModel {
        id:categoriesListModel

        Component.onCompleted: {
//            StoreDB.initializeTable("main_categories_table");

//            var items = new Array("emails_table" , "Emails");
//            StoreDB.insertOrUpdateValue("main_categories_table" , items);

//            items[0] = "network_disk_table";
//            items[1] = "Network Disk";
//            StoreDB.insertOrUpdateValue("main_categories_table" , items);

//            items[0] = "websites_table";
//            items[1] = "Websites";
//            StoreDB.insertOrUpdateValue("main_categories_table" , items);

            StoreDB.getTableAllValueAndAppendToModel("main_categories_table" , categoriesListModel);
        }
    }

    Component {
        id:categoriesDelegate


        CategoriesItem {
            id:categoriesItem
            width: categoriesRectangle.width
            color: categoriesListView.currentIndex == index ? "orange" : "#2DB8B7"

            tableName: itemData0
            text: itemData1
            data1: itemData2
            data2: itemData3
            data3: itemData4
            data4: itemData5
            data5: itemData6
            data6: itemData7
            data7: itemData8
            data8: itemData9

            MouseArea {
                anchors.fill: parent
                onPressed:{
                    categoriesListView.currentIndex = index;
                }

                onReleased: {
                    var object = Qt.createComponent("MinorCategories.qml").createObject(categoriesRectangle)
                }
            }
        }
    }

    ListView {
        id:categoriesListView
        width: categoriesRectangle.width
        height: categoriesRectangle.height - controlArea.height

        anchors.top: categoriesRectangle.top
        anchors.left: categoriesRectangle.left
        anchors.right: categoriesRectangle.right

        spacing: 5

        model: categoriesListModel
        delegate: categoriesDelegate
    }

    ControlArea {
        id:controlArea
        width: categoriesRectangle.width
        color: "red"

        anchors.top: categoriesListView.bottom
        anchors.left: categoriesRectangle.left
        anchors.right: categoriesRectangle.right
    }
}
