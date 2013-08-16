// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id:categoriesRectangle
    width: 320
    height: 400

    function loadAllData() {
        StoreDB.initializeTable("main_categories_table");
        StoreDB.getTableAllValueAndAppendToModel("main_categories_table" , categoriesListModel);
    }

    ListModel {
        id:categoriesListModel

        Component.onCompleted: loadAllData();
    }

    Component {
        id:categoriesDelegate


        CategoriesItem {
            id:categoriesItem
            width: categoriesRectangle.width
            color: categoriesListView.currentIndex == index ? "orange" : "#2DB8B7"

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
                anchors.fill: parent
                onPressed:{
                    categoriesListView.currentIndex = index;
                }

                onReleased: {
                    var object = Qt.createComponent("MinorCategories.qml").createObject(categoriesRectangle)
                    object.init(categoriesItem.tableName)
                    object.width = categoriesRectangle.width
                    object.height = categoriesRectangle.height
                    object.titles = categoriesItem.datas
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

        onCreateButtunClicked: {
            var addModify = Qt.createComponent("AddModify.qml").createObject(categoriesRectangle)
            addModify.width = categoriesRectangle.width
            addModify.height = categoriesRectangle.height

            var titles = new Array("Group Name" , "Field Name", "Field Name", "Field Name", "Field Name", "Field Name", "Field Name", "Field Name", "Field Name")
            var values = new Array("" , "", "", "", "", "", "", "", "")
            addModify.init(titles , values)

            addModify.pageDestroyed.connect(categoriesRectangle.loadAllData)
        }
    }
}
