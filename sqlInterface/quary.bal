package sqlInterface;
import ballerina.data.sql;

public function quary()(json){
    endpoint<sql:ClientConnector> testDB {
        create sql:ClientConnector(
        sql:DB.MYSQL, "localhost", 3306, "testdb?useSSL=false", "root", "password123", {maximumPoolSize:5 });
    }
    table dt = testDB.select("SELECT PROJECT,STATE,TASK,CREATED,UPDATED,DELAY,USER,CARD_ID from CT_TABLE ", null, null);
    var jsonRes, _ = <json>dt;
    //testDB.close();
    return jsonRes;

}