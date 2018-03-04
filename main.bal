
import components;
import graphqlInterface;
import sqlInterface;
import ballerina.data.sql;
import GmailInterface;

int threshold =14;

public function main (string[] args) {
    json file = graphqlInterface:getData();
    println(file);
    sql:Parameter[][] filteredData;
    filteredData = components:filterData(file,threshold);
    println(filteredData);
    sqlInterface:updateDB(filteredData);
    //json dataToUI=sqlInterface:quary();
    //println(dataToUI);
    json todayMailList;
    json gruoupList;
    todayMailList,gruoupList=sqlInterface:TodayMailList(threshold);
    println(todayMailList);
    //println(gruoupList);
    json mailContent=sqlInterface:createEmail(todayMailList);
    json groupMailContent =components:createGroupEmail(gruoupList);
    string Token;
    Token,_=GmailInterface:genarateAccessToken();
    //println(Token);
    int count=0;
    foreach user in mailContent {
        if (count==2){
           // json response = GmailInterface:sendMail(Token,"nalin.j@outlook.com","2njayworks@gmail.com","Individual E-mail", user.body.toString());
        }
        count=count+1;
    }
    json response2 = GmailInterface:sendMail(Token,groupMailContent.addr.toString(),"2njayworks@gmail.com","Summary E-mail-test", groupMailContent.body.toString());
}


