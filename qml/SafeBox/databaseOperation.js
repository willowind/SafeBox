//storage.js

//简单格式化输出字符串
String.format = function(src){
    if (arguments.length == 0)
        return null;

    var args = Array.prototype.slice.call(arguments, 1);
    return src.replace(/\{(\d+)\}/g, function(m, i){
        return args[i];
    });
};

//打开数据库
function getDatabase() {
     return openDatabaseSync("SafeBox.db", "1.0", "StorageDatabase", 100000);
}

//初始化表
function initializeTable(table) {
    var db = getDatabase();
    db.transaction(
        function(tx) {
            // 如果main_categories_table表不存在，则创建一个
            // 如果表存在，则跳过此步
            var tmpCMD = "CREATE TABLE IF NOT EXISTS {0}(item0 TEXT , item1 TEXT PRIMARY KEY , item2 TEXT , item3 TEXT , item4 TEXT , item5 TEXT , item6 TEXT , item7 TEXT , item8 TEXT , item9 TEXT , UNIQUE(item1));";

            var cmd = String.format(tmpCMD , table);

            tx.executeSql(cmd);
      });
}

// 插入或更新数据
function insertOrUpdateValue(table , tableItems) {
   var db = getDatabase();
   var res = "";
   db.transaction(function(tx) {
        var tmpcmd = 'INSERT OR REPLACE INTO {0} VALUES("{1}"';
        var i;
        for(i in tableItems)
        {
            if(i == 0)
                continue;

            var t = ' , "{0}"';
            var tt = String.format(t , tableItems[i]);
            tmpcmd += tt;
        }

        for(i++; i < 10 ; i++)
            tmpcmd += ' , "NULL"';

        tmpcmd += ");";

        var cmd = String.format(tmpcmd , table , tableItems[0]);

        print(cmd)

        var rs = tx.executeSql(cmd);
        if (rs.rowsAffected > 0)
            res = "OK";
        else
            res = "Error";
        }
  );
  return res;
}

//获取数据库中的所以数据，并将数据添加到model中
function getTableAllValueAndAppendToModel(table , model) {
    var db = getDatabase();
    db.transaction(function(tx) {
        var tmpcmd = 'SELECT * FROM {0};'
        var cmd = String.format(tmpcmd , table);
                       print(cmd);
        var rs = tx.executeSql(cmd);
        if (rs.rows.length > 0) {
            model.clear();
            for(var i = 0 ; i < rs.rows.length ; i++)
            {
                var myItem = rs.rows.item(i);
                model.append({
                                 "itemData0" : myItem.item0,
                                 "itemData1" : myItem.item1,
                                 "itemData2" : myItem.item2,
                                 "itemData3" : myItem.item3,
                                 "itemData4" : myItem.item4,
                                 "itemData5" : myItem.item5,
                                 "itemData6" : myItem.item6,
                                 "itemData7" : myItem.item7,
                                 "itemData8" : myItem.item8,
                                 "itemData9" : myItem.item9,
                               });
            }
        }
    });
}
