package sqlInterface;
import ballerina.data.sql;


public function updateDB(sql:Parameter[][] batch){
    endpoint<sql:ClientConnector> testDB {
        create sql:ClientConnector(
        sql:DB.MYSQL, "localhost", 3306, "testdb?useSSL=false", "root", "password123", {maximumPoolSize:5 });
    }

    var a = testDB.update("DROP TABLE IF EXISTS CT_TABLE",null);
    int ret = testDB.update("CREATE TABLE CT_TABLE(ID INT AUTO_INCREMENT,PROJECT VARCHAR(255),STATE VARCHAR(255),TASK VARCHAR(255),
        CREATED VARCHAR(255),UPDATED VARCHAR(255),DELAY INT,USER VARCHAR(255),CARD_ID VARCHAR(255),URL VARCHAR(255),NOTIFIED VARCHAR(255),PRIMARY KEY (ID))", null);
   // sql:Parameter[][] batch =filterData(file) ;

    int[] c = testDB.batchUpdate("INSERT INTO CT_TABLE (PROJECT,STATE,TASK,CREATED,UPDATED,DELAY,USER,CARD_ID,URL) VALUES (?,?,?,?,?,?,?,?,?)", batch);
    testDB.close();
}