package sqlInterface;
import ballerina.data.sql;

struct MailList{
    string USER;
    string TASK;
    int DELAY;
    string URL;
    string CREATED;
    string UPDATED;
    string PROJECT;
}

public function TodayMailList(int thresh)(json,json){
    endpoint<sql:ClientConnector> testDB {
        create sql:ClientConnector(
        sql:DB.MYSQL, "localhost", 3306, "testdb?useSSL=false", "root", "password123", {maximumPoolSize:5});

    }

    table dt1 = testDB.select("SELECT USER,TASK,DELAY,URL,CREATED,UPDATED,PROJECT FROM CT_TABLE WHERE (MOD(DELAY,"+thresh+")=0)", null, typeof MailList);
    table dt2 = testDB.select("SELECT USER,TASK,DELAY,URL,CREATED,UPDATED,PROJECT FROM CT_TABLE ORDER BY PROJECT ASC,DELAY DESC", null, typeof MailList);
    var jsonRes1, _ = <json>dt1;
    var jsonRes2, _ = <json>dt2;
    return jsonRes1,jsonRes2;
}
