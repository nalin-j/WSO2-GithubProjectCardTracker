package components;
import ballerina.data.sql;



public function filterData(json file, int thresh)(sql:Parameter[][]){
    sql:Parameter[][] batch = [];
    int counter =0;
    int oc =0;
    int gap;
    boolean isIssueOPEN;
    foreach project in file {
        if (lengthof project.columns.nodes == 0) {
            next;
        }
        else {
            foreach column in project.columns.nodes {
                if (lengthof column.cards.nodes == 0) {
                    next;
                }
                else {
                    foreach card in column.cards.nodes {
                        isIssueOPEN=false;
                        gap = delay(card.updatedAt);
                        //println(card.content);
                        //println(card.content.state.toString());
                        if (card.content==null ||card.content.toString() =="{}"){
                            isIssueOPEN=false;
                            //println(card.content);
                        }
                        else if (card.content.state.toString()=="OPEN"){
                            oc=oc+1;
                            isIssueOPEN=true;
                        }



                        //table available = testDB.select("SELECT COUNT(1) FROM CT_TABLE WHERE CT_TABLE.CARD_ID='MDExOlByb2plY3RDYXJkNTU2NjAyNA=='",null,null);
                        if(gap>=thresh && isIssueOPEN ){
                            println(card.content.state.toString());
                            sql:Parameter[] params = [];
                            sql:Parameter p1 = {sqlType:sql:Type.VARCHAR, value:project.name};
                            sql:Parameter p2 = {sqlType:sql:Type.VARCHAR, value:column.name};
                            sql:Parameter p3 = {sqlType:sql:Type.VARCHAR, value:card.content.title.toString().replace("\"","'").replace("%","/100")};

                            //println(column.name);
                            sql:Parameter p4 = {sqlType:sql:Type.VARCHAR, value:DateFormat(card.createdAt)};
                            sql:Parameter p5 = {sqlType:sql:Type.VARCHAR, value:DateFormat(card.updatedAt)};
                            sql:Parameter p6 = {sqlType:sql:Type.INTEGER, value:gap};
                            sql:Parameter p7 = {sqlType:sql:Type.VARCHAR, value:card.creator.login};
                            sql:Parameter p8 = {sqlType:sql:Type.VARCHAR, value:card.id};
                            sql:Parameter p9 = {sqlType:sql:Type.VARCHAR, value:card.content.url};
                            params = [p1, p2, p3, p4, p5, p6, p7, p8,p9];
                            batch[counter]=params;
                            counter=counter+1;

                            //calling alert function


                        }

                    }
                }
            }
        }
    }
    println("open count :"+oc);
    return batch;

}
