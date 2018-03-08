package sqlInterface;
import ballerina.data.sql;

public function quary()(json){
    endpoint<sql:ClientConnector> testDB {
        create sql:ClientConnector(
        sql:DB.MYSQL, "localhost", 3306, "testdb?useSSL=false", "root", "password123", {maximumPoolSize:5 });
    }
    table dt = testDB.select("SELECT PROJECT,STATE,TASK,CREATED,UPDATED,DELAY,USER,URL from CT_TABLE ORDER by PROJECT ASC,DELAY DESC ", null, null);
    var jsonRes, _ = <json>dt;
    println(jsonRes);
    testDB.close();
    return jsonRes;

}