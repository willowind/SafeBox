// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id: addModifyRec

    width: 320
    height: 400

    signal pageDestroyed()

    property string tableName: ""
    property string showName: ""
    property string controlAreaState: ""

    //填充model中的数据项
    function init(titles , values , offset) {
        if((titles.length == values.length) && (values.length) >= 2)
        {
            tableName = values[0];
            showName = values[1]
            for(var i = offset ; i < titles.length ; i++)
            {
                if(titles[i].length != 0)
                    addModifyListModel.append({
                                            "showTitle" : titles[i],
                                            "showValue" : values[i],
                                            })
            }
        }
    }

    function pageDestroyedAndReturn() {
        addModifyRec.pageDestroyed()    //触发页面销毁信号
        addModifyRec.destroy()  //返回
    }

    //////////////////////////////////////////////////////////////
    //model
    ListModel {
        id: addModifyListModel
    }

    ///////////////////////////////////////////////////////////////
    //delegate
    Component {
        id: addModifyDelegate

        AddModifyItem {
            id: item

            width: addModifyRec.width
            color: addModifyListView.currentIndex == index ? "orange" : "#2DB8B7"

            title: showTitle
            value: showValue

            onFocusChanged: {
                addModifyListView.currentIndex = index;
            }
            onAccepteData: addModifyListModel.get(index).showValue = item.value
        }
    }

    /////////////////////////////////////////////////////////////////
    //view
    ListView {
        id: addModifyListView

        spacing: 5

        width: addModifyRec.width
        height: addModifyRec.height - controlArea.height

        anchors.top: addModifyRec.top
        anchors.left: addModifyRec.left
        anchors.right: addModifyRec.right

        model: addModifyListModel
        delegate: addModifyDelegate
    }

    ////////////////////////////////////////////////////////////////////
    //控制区域，返回及保存
    ControlArea {
        id:controlArea
        width: addModifyRec.width
        color: "red"
        state: controlAreaState

        anchors.top: addModifyListView.bottom
        anchors.left: addModifyRec.left
        anchors.right: addModifyRec.right

        onReturnButtunClicked: pageDestroyedAndReturn()

        //创建新类别表处理
        onCreateButtunClicked: {
            var items = new Array();
            items[0] = addModifyListModel.get(0).showValue.concat("_table");
            items[1] = addModifyListModel.get(0).showValue;

            var index;
            for(index = 1 ; index < addModifyListModel.count ; index++)
            {
                var item = addModifyListModel.get(index);
                items[index + 1] = item.showValue;
            }

            if(items[1] != "" && items[1] != "NULL")
            {
                console.log(tableName)
                StoreDB.initializeTable(tableName);
                StoreDB.insertOrUpdateValue(tableName , items);
            }

            pageDestroyedAndReturn()
        }

        //创建已存在类别新项，或更改存在类别新项
        onModifyButtunClicked: {
            var items = new Array();
            items[0] = tableName;

            var offset;
            if(showName.length != 0)
            {
                items[1] = showName;
                offset = 2;
            }
            else
                offset = 1

            console.log(showName.length)

            var index;
            for(index = 0 ; index < addModifyListModel.count ; index++)
            {
                var item = addModifyListModel.get(index);
                items[index + offset] = item.showValue;
            }

            if(items[1].length != 0)
            {
                StoreDB.initializeTable(tableName);
                StoreDB.insertOrUpdateValue(tableName , items);
            }

            pageDestroyedAndReturn()
        }
    }
}
