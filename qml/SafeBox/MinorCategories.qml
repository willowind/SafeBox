// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id:minorRectangle
    width: 320
    height: 400

    property variant titles: ["", "", "", "", "", "", "", "", "", ""]

    function loadAllData() {
        console.log(titles[0])
        StoreDB.initializeTable(titles[0]);
        StoreDB.getTableAllValueAndAppendToModel(titles[0] , minorListModel);
    }

    /////////////////////////////////////////////////////////////////////////////
    //创建新页页面
    function creatAddModifyPage(offset) {
        var modify = Qt.createComponent("AddModify.qml").createObject(minorRectangle)
        modify.pageDestroyed.connect(minorRectangle.loadAllData)

        modify.width = minorRectangle.width
        modify.height = minorRectangle.height
        modify.controlAreaState = "modifyState"


        if(offset == 1){
            var values = new Array("", "", "", "", "", "", "", "", "", "")
            var tmpTitles = titles;
            tmpTitles[1] = "Name"
            values[0] = titles[0];
            modify.init(tmpTitles , values , offset)
        }
        else if(offset == 2)
            modify.init(titles , minorListView.currentItem.datas , offset)
    }

    ListModel {
        id:minorListModel
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

            MouseArea {
//                hoverEnabled : true
                anchors.fill: parent
                onPressed:{
                    minorListView.currentIndex = index;
                }

                onReleased: {
                    var object = Qt.createComponent("Details.qml").createObject(minorRectangle)
                    object.width = minorRectangle.width
                    object.height = minorRectangle.height
                    object.init(titles , minorItem.datas , 2)
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

        onCreateButtunClicked: minorRectangle.creatAddModifyPage(1)

        onModifyButtunClicked: minorRectangle.creatAddModifyPage(2)
    }
}
