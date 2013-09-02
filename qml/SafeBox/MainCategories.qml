// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id:categoriesRectangle
    width: 855
    height: 480
//    color: "#00529c" //100%
    color: "#7fa8cd" //50%
//    color: "#ccdceb"    //20%

//        color: "#00b16a" //100%
//        color: "#7fd8b4" //50%
//        color: "#ccefe1"    //20%

    property string mainTableName: "main_categories_table"
    property int preIndex: 0

    function loadAllData() {
        StoreDB.initializeTable(mainTableName);
        StoreDB.getTableAllValueAndAppendToModel(mainTableName , categoriesListModel);
    }

    function creatAddModifyPage(values) {
        var addModify = Qt.createComponent("AddModify.qml").createObject(categoriesRectangle)
        addModify.pageDestroyed.connect(categoriesRectangle.loadAllData)

        addModify.width = categoriesRectangle.width
        addModify.height = categoriesRectangle.height
        addModify.controlAreaState = "creatState"

        var titles = new Array("main_categories_table" , "Group Name" , "Field Name", "Field Name", "Field Name", "Field Name", "Field Name", "Field Name", "Field Name", "Field Name")
        values[0] = titles[0]
        addModify.init(titles , values , 1)
    }

    //////////////////////////////////////////////////////////////////////
    //model
    ListModel {
        id:categoriesListModel

        Component.onCompleted: loadAllData();
    }

    ///////////////////////////////////////////////////////////////////////
    //delegate
    Component {
        id:categoriesDelegate

        CategoriesItem {
            id:categoriesItem
            width: categoriesRectangle.width
            color: categoriesListView.currentIndex == index ? "#2c69a0" : "#7fa8cd"
            moreRecColor: categoriesListView.currentIndex == index ? "#2c69a0" : "#7fa8cd"

            tableName: itemData0
            text: itemData1

            Component.onCompleted: {
                var tmp = datas
                tmp[0] = itemData0
                tmp[1] = itemData1
                tmp[2] = itemData2
                tmp[3] = itemData3
                tmp[4] = itemData4
                tmp[5] = itemData5
                tmp[6] = itemData6
                tmp[7] = itemData7
                tmp[8] = itemData8
                tmp[9] = itemData9
                datas = tmp
            }

            onItemClicked: categoriesListView.currentIndex = index
            onMoreRectangleClicked: {
                categoriesListView.currentIndex = index
                var object = Qt.createComponent("MinorCategories.qml").createObject(categoriesRectangle)
                object.width = categoriesRectangle.width
                object.height = categoriesRectangle.height
                object.titles = categoriesItem.datas
                object.loadAllData()
                categoriesListView.currentIndex = index
            }
        }
    }

    /////////////////////////////////////////////////////////////////////
    //view
    ListView {
        id:categoriesListView
        width: categoriesRectangle.width
        height: categoriesRectangle.height - controlArea.height

        anchors.top: categoriesRectangle.top
        anchors.left: categoriesRectangle.left
        anchors.right: categoriesRectangle.right

        spacing: 0

        model: categoriesListModel
        delegate: categoriesDelegate
    }

    //////////////////////////////////////////////////////////////////
    ControlArea {
        id:controlArea
        width: categoriesRectangle.width
//        color: "#7fa8cd" //50%
//        color: "red"

        state: "mainState"

        anchors.top: categoriesListView.bottom
        anchors.left: categoriesRectangle.left
        anchors.right: categoriesRectangle.right

        onCreateButtunClicked: {
            var value = new Array("", "", "", "", "", "", "", "", "", "")
            categoriesRectangle.creatAddModifyPage(value);
        }

        onModifyButtunClicked: {
            var value = categoriesListView.currentItem.datas;
            categoriesRectangle.creatAddModifyPage(value);
        }

        onDeleteButtunClicked: {
            var item = categoriesListView.currentItem.datas
            StoreDB.deleteTableItem(mainTableName , item[1]);
            StoreDB.dropTable(item[0]);
            categoriesRectangle.loadAllData();
        }
    }
}
