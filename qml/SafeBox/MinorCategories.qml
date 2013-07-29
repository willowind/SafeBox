// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id:minorRectangle
    width: 320
    height: 400

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
            StoreDB.getTableAllValueAndAppendToModel("emails_table" , minorListModel);
        }
    }

    Component {
        id:minorDelegate


        CategoriesItem {
            id:minorItem
            color: minorListView.currentIndex == index ? "orange" : "#2DB8B7"

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
//                hoverEnabled : true
                anchors.fill: parent
                onPressed:{
                    minorListView.currentIndex = index;
                }

                onReleased: {

                }
            }
        }
    }

    ListView {
        id:minorListView
//        z: 0
        anchors.fill: parent
        spacing: 5

        model: minorListModel
        delegate: minorDelegate
    }
}
