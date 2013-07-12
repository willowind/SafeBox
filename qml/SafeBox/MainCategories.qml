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
            StoreDB.initializeTable("main_categories_table");

//            StoreDB.insertOrUpdateValue("main_categories_table" , "emails_table" , "Emails");

//            StoreDB.insertOrUpdateValue("main_categories_table" , "network_disk_table" , "Network Disk");

//            StoreDB.insertOrUpdateValue("main_categories_table" , "websites_table" , "Websites");

            StoreDB.getAllValue("main_categories_table");
        }
    }

    Component {
        id:categoriesDelegate
        CategoriesItem {
            id:item
            text: showText
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
