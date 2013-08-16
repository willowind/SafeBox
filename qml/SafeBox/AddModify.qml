// import QtQuick 1.0 // to target S60 5th Edition or Maemo 5
import QtQuick 1.1
import "databaseOperation.js" as StoreDB

Rectangle {
    id: addModifyRec

    width: 320
    height: 400

    signal pageDestroyed()

    //填充model中的数据项
    function init(titles , values) {
        if(titles.length == values.length)
        {
            for(var i = 0 ; i < titles.length ; i++)
            {
                addModifyListModel.append({
                                            "showTitle" : titles[i],
                                            "showValue" : values[i],
                                        })
            }
        }
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
        state: "creatState"

        anchors.top: addModifyListView.bottom
        anchors.left: addModifyRec.left
        anchors.right: addModifyRec.right

        onReturnButtunClicked: {
            addModifyRec.pageDestroyed()    //触发页面销毁信号
            addModifyRec.destroy() //返回
        }

        //创建新表处理
        onCreateButtunClicked: {

            var items = new Array();
            items[0] = addModifyListModel.get(0).showValue.concat("_table");

            var index;
            for(index = 0 ; index < addModifyListModel.count ; index++)
            {
                var item = addModifyListModel.get(index);
                items[index + 1] = item.showValue;
            }

            if(items[1] != "" && items[1] != "NULL")
            {
                StoreDB.initializeTable("main_categories_table");
                StoreDB.insertOrUpdateValue("main_categories_table" , items);
            }

            addModifyRec.pageDestroyed()    //触发页面销毁信号
            addModifyRec.destroy()  //返回
        }
    }
}
