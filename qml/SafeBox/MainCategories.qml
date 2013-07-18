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
            id:item
            text: modelDataItem1
        }
    }

    ListView {
        id:categoriesListView
//        z: 0
        anchors.fill: parent
        spacing: 5
//        highlight: CategoriesItem {
//            color: "#9F0000";
//        }
//        focus: true

        model: categoriesListModel
        delegate: categoriesDelegate
    }
}
