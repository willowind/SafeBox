//storage.js

String.format = function(src){
    if (arguments.length == 0)
        return null;

    var args = Array.prototype.slice.call(arguments, 1);
    return src.replace(/\{(\d+)\}/g, function(m, i){
        return args[i];
    });
};

// 首先创建一个helper方法连接数据库
function getDatabase() {
     return openDatabaseSync("SafeBox.db", "1.0", "StorageDatabase", 100000);
}

// 程序打开时，初始化表
function initializeTable(table) {
    var db = getDatabase();
    db.transaction(
        function(tx) {
            // 如果main_categories_table表不存在，则创建一个
            // 如果表存在，则跳过此步
            var tmpCMD = "CREATE TABLE IF NOT EXISTS {0}(tableName TEXT , showTableName TEXT);";
            var cmd = String.format(tmpCMD , table);
            tx.executeSql(cmd);
      });
}

// 插入数据
function insertOrUpdateValue(table , item , value) {
   var db = getDatabase();
   var res = "";
   db.transaction(function(tx) {
        var tmpcmd = 'INSERT OR REPLACE INTO {0} VALUES("{1}" , "{2}");'
        var cmd = String.format(tmpcmd , table , item , value);
        var rs = tx.executeSql(cmd);
        if (rs.rowsAffected > 0)
            res = "OK";
        else
            res = "Error";
        }
  );
  return res;
}

function insertValueToDB(table) {

}

 // 获取数据
function getSetting(setting) {
   var db = getDatabase();
   var res="";
   db.transaction(function(tx) {
//     var rs = tx.executeSql('SELECT value FROM settings WHERE setting=?;', [setting]);
       var rs = tx.executeSql('SELECT setting,value FROM settings;');
     if (rs.rows.length > 0) {
         console.log(rs.rows.length)
         for(var i = 0 ; i < rs.rows.length ; i++)
//         {
//             console.log(rs.rows.item(i).setting);
//             console.log(rs.rows.item(i).value);
//         }
             res += rs.rows.item(i).setting + " = " + rs.rows.item(i).value + "\n";
     } else {
         res = "Unknown";
     }
  })
  return res
}

function getAllValue(table) {
    var db = getDatabase();
    db.transaction(
        function(tx) {
//                    var tmpcmd = 'SELECT tableName,showTableName FROM {0};'
                    var tmpcmd = 'SELECT * FROM {0};'
                    var cmd = String.format(tmpcmd , table);
        var rs = tx.executeSql(cmd);
        if (rs.rows.length > 0) {
            for(var i = 0 ; i < rs.rows.length ; i++)
            {
                var myItem = rs.rows.item(i);
                categoriesListModel.append({
                                   "tableName" : myItem.tableName,
                                   "showText" : myItem.showTableName
                               });
            }
        }
    });
}
