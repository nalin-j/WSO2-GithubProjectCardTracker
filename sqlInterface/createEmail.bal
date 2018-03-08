package sqlInterface;
import ballerina.data.sql;

public function createEmail(json list)(json){
    endpoint<sql:ClientConnector> testDB {
        create sql:ClientConnector(
        sql:DB.MYSQL, "localhost", 3306, "testdb?useSSL=false", "root", "password123", {maximumPoolSize:5 });
    }
    json new_list=[];
    int counter=0;
    foreach user in list  {
        table dt = testDB.select("SELECT WSO2MAIL FROM MAIL_TABLE WHERE GITID= '"+user.USER.toString()+"'", null, null);
        //println("SELECT WSO2MAIL FROM MAIL_TABLE WHERE GITID= '"+user.USER.toString()+"'");
        var jsonRes, _ = <json>dt;
        //println("UPDATE CT_TABLE SET NOTIFIED = 'NO' where CARD_ID ="+user.CARD_ID.toString());
        if(lengthof jsonRes==0){
            //int up = testDB.update("UPDATE CT_TABLE SET NOTIFIED = 'NO' where CARD_ID ='"+user.CARD_ID.toString()+"'",null);
            next;
        }
        else{
            string task;
            if (user.TASK==null){
                task = null;
            }
            else{
                task = user.TASK.toString();
            }
            //int up = testDB.update("UPDATE CT_TABLE SET NOTIFIED = 'YES' where CARD_ID ='"+user.CARD_ID.toString()+"'",null);
            new_list[counter]={addr:jsonRes[0].WSO2MAIL,body:htmlBody(user.DELAY.toString(),user.URL.toString(),task,user.PROJECT.toString(),user.USER.toString(),user.CREATED.toString(),user.UPDATED.toString())};//"hi "+user.USER.toString()+"!  this is to notify your project card :" +task+ ",
            //has exeeded "+user.DELAY.toString()+" days since last update. please look forward for it. URL is given below, "+user.URL.toString()

            counter=counter+1;
        }
        //println(jsonRes);
        //user.USER = jsonRes.WSO2MAIL;
    }

    return (new_list);
}
function htmlBody(string delay,string url,string task,string project,string creator,string created,string updated)(string){
    string Body;
    Body = "<div style=\"max-width: 680px; margin: auto;\" class=\"email-container\">" +
                "<table role=\"presentation\" style=\"max-width: 680px;\" class=\"email-container\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\"><!-- HEADER : BEGIN -->" +
                "<tbody>" +
                "<tr style=\"height: 10px;\">" +
                "<td style=\"height: 110px;\" bgcolor=\"#ff\">" +
                "<table role=\"presentation\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">" +
                "<tbody>" +
                "<tr>" +
                "<td style=\"padding: 20px 40px 20px 40px; text-align: center;\"><img src=\"http://digit.lk/wp-content/uploads/2013/07/wso2.jpg\" alt=\"alt_text\" style=\"height: auto; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;\" width=\"150\" height=\"13\" border=\"0\" /></td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "</td>" +
                "</tr>" +
                "<!-- HEADER : END --> <!-- HERO : BEGIN -->" +
                "<tr style=\"height: 329px;\"><!-- Bulletproof Background Images c/o https://backgrounds.cm -->" +
                "<td style=\"text-align: center; background-position: center center !important; background-size: cover !important; height: 200px;\" valign=\"top\" bgcolor=\"#333333\" align=\"center\"><!-- [if gte mso 9]>" +
                "                        <v:rect xmlns:v=\"urn:schemas-microsoft-com:vml\" fill=\"true\" stroke=\"false\" style=\"width:680px; height:380px; background-position: center center !important;\">" +
                "                        <v:fill type=\"tile\" src=\"background.png\" color=\"#222222\" />" +
                "                        <v:textbox inset=\"0,0,0,0\">" +
                "                        <![endif]-->" +
                "<div><!-- [if mso]>" +
                "                            <table role=\"presentation\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" align=\"center\" width=\"500\">" +
                "                            <tr>" +
                "                            <td align=\"center\" valign=\"middle\" width=\"500\">" +
                "                            <![endif]-->" +
                "<table role=\"presentation\" style=\"max-width: 500px; margin: auto; height: 398px; width: 92.457%;\" width=\"466\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">" +
                "<tbody>" +
                "<tr style=\"height: 21px;\">" +
                "<td style=\"font-size: 20px; line-height: 20px; height: 25px;\" height=\"20\">&nbsp;</td>" +
                "</tr>" +
                "<tr style=\"height: 43px;\">" +
                "<td style=\"height: 354px;\" valign=\"middle\" align=\"center\">" +
                "<table style=\"height: 97px;\" width=\"500\">" +
                "<tbody>" +
                "<tr style=\"height: 143px;\">" +
                "<td style=\"text-align: center; padding: 0px; height: 102px; width: 499px;\" valign=\"top\">" +
                "<h1 style=\"margin: 0; font-family: 'Montserrat', sans-serif; font-size: 30px; line-height: 36px; color: #ffffff; font-weight: bold;\"></h1>" +
                "<h1 style=\"margin: 0; font-family: 'Montserrat', sans-serif; font-size: 30px; line-height: 36px; color: #ffffff; font-weight: bold;\">Github Project Card Tracker</h1> <img src=\"https://tctechcrunch2011.files.wordpress.com/2010/07/github-logo.png?w=400\" alt=\"alt_text\" style=\"height: auto; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #555555;\" width=\"150\" height=\"13\" border=\"0\" />" +
                "</td>" +
                "</tr>" +
                "<tr style=\"height: 66px;\">" +
                "<td style=\"text-align: center; padding: 10px 20px 15px; font-family: sans-serif; font-size: 15px; line-height: 20px; color: #757575; height: 66px; width: 499px;\" valign=\"top\">" +
                "<p style=\"margin: 0;\">This is to notify your following project card has not updated recently. Please look forward for the issue</p>" +
                "</td>" +
                "</tr>" +
                "<tr style=\"height: 28px;\">" +
                "<td style=\"margin: 0px; font-family: 'Montserrat', sans-serif; font-size: 25px; line-height: 36px; color: #ffffff; font-weight: bold; text-align: center; height: 28px; width: 499px;\">DELAY : "+delay+" Days" +
                "<p style=\"margin: 0;\"></p>" +
                "</td>" +
                "</tr>" +
                "<tr style=\"height: 100px;\">" +
                "<td style=\"text-align: center; padding: 15px 0px 60px; height: 53px; width: 499px;\" valign=\"top\" align=\"center\"><!-- Button : BEGIN --><center>" +
                "<table role=\"presentation\" class=\"center-on-narrow\" style=\"text-align: center;\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">" +
                "<tbody>" +
                "<tr>" +
                "<td style=\"border-radius: 50px; background: #26a4d3; text-align: center;\" class=\"button-td\"><a href=\""+url+"\" style=\"background: #26a4d3; border: 15px solid #26a4d3; font-family: 'Montserrat', sans-serif; font-size: 14px; line-height: 1.1; text-align: center; text-decoration: none; display: block; border-radius: 50px; font-weight: bold;\" class=\"button-a\"> <span style=\"color: #ffffff;\" class=\"button-link\">&nbsp;&nbsp;&nbsp;&nbsp;GO TO PROJECT CARD&nbsp;&nbsp;&nbsp;&nbsp;</span> </a></td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "</center><!-- Button : END --></td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "</td>" +
                "</tr>" +
                "<tr style=\"height: 10px;\">" +
                "<td style=\"font-size: 20px; line-height: 20px; height: 10px;\" height=\"20\">&nbsp;</td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "<!-- [if mso]>" +
                "                            </td>" +
                "                            </tr>" +
                "                            </table>" +
                "                            <![endif]--></div>" +
                "<!-- [if gte mso 9]>" +
                "                        </v:textbox>" +
                "                        </v:rect>" +
                "                        <![endif]--></td>" +
                "</tr>" +
                "<!-- HERO : END --> <!-- INTRO : BEGIN -->" +
                "<tr style=\"height: 253px;\">" +
                "<td style=\"height: 237px;\" bgcolor=\"#ffffff\">" +
                "<table role=\"presentation\" style=\"height: 45px;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">" +
                "<tbody>" +
                "<tr style=\"height: 87px;\">" +
                "<td style=\"padding: 0px 40px; text-align: left; height: 10px; width: 100%;\">" +
                "<h1 style=\"margin: 0; font-family: 'Montserrat', sans-serif; font-size: 20px; line-height: 26px; color: #333333; font-weight: bold; text-align: center;\">Project Card Details</h1>" +
                "</td>" +
                "</tr>" +
                "<tr style=\"height: 203px;\">" +
                "<td style=\"height: 177px; width: 100%;\">" +
                "<table style=\"width: 676px;\" width=\"640\" height=\"152\">" +
                "<tbody>" +
                "<tr>" +
                "<td style=\"padding: 0px 30px; text-align: left; width: 138px; font-size: 18px; border: 1px solid black;\">Task</td>" +
                "<td style=\"padding: 0px 30px; width: 540px; font-size: 18px; border: 1px solid black;\">"+task+"</td>" +
                "</tr>" +
                "<tr>" +
                "<td style=\"padding: 0px 30px; text-align: left; width: 138px; font-size: 18px; border: 1px solid black;\">Project</td>" +
                "<td style=\"padding: 0px 30px; width: 540px; font-size: 18px; border: 1px solid black;\">"+project+"</td>" +
                "</tr>" +
                "<tr>" +
                "<td style=\"padding: 0px 30px; text-align: left; width: 138px; font-size: 18px; border: 1px solid black;\">Creator</td>" +
                "<td style=\"padding: 0px 30px; width: 540px; font-size: 18px; border: 1px solid black;\">"+creator+"</td>" +
                "</tr>" +
                "<tr>" +
                "<td style=\"padding: 0px 30px; text-align: left; width: 138px; font-size: 18px; border: 1px solid black;\">Created</td>" +
                "<td style=\"padding: 0px 30px; width: 540px; font-size: 18px; border: 1px solid black;\">"+created+"</td>" +
                "</tr>" +
                "<tr>" +
                "<td style=\"padding: 0px 30px; text-align: left; width: 138px; font-size: 18px; border: 1px solid black;\">Updated</td>" +
                "<td style=\"padding: 0px 30px; width: 540px; font-size: 18px; border: 1px solid black;\">"+updated+"</td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "</td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "</td>" +
                "</tr>" +
                "<!-- INTRO : END --> <!-- CTA : BEGIN -->" +
                "<tr style=\"height: 87px;\">" +
                "<td style=\"height: 87px;\" bgcolor=\"#26a4d3\">" +
                "<table role=\"presentation\" style=\"height: 71px;\" width=\"100%\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\">" +
                "<tbody>" +
                "<tr style=\"height: 50px;\">" +
                "<td style=\"padding: 0px 0px 0px; font-family: sans-serif; font-size: 17px; line-height: 23px; color: #aad4ea; text-align: center; font-weight: normal; height: px;\">" +
                "<p style=\"margin: 0;\"></p>" +
                "<p style=\"margin: 0;\">This is an Auto Generated E-mail</p>" +
                "<p style=\"margin: 0;\">WSO2 Lanka (Pvt) Ltd</p>" +
                "</td>" +
                "</tr>" +
                "<tr style=\"height: 10px;\">" +
                "<td style=\"text-align: center; padding: 0px 0px 0px; height: 10px;\" valign=\"middle\" align=\"center\"><!-- Button : BEGIN -->" +
                "<table role=\"presentation\" class=\"center-on-narrow\" cellspacing=\"0\" cellpadding=\"0\" border=\"0\" align=\"center\">" +
                "<tbody>" +
                "<tr></tr>" +
                "</tbody>" +
                "</table>" +
                "<!-- Button : END --></td>" +
                "</tr>" +
                "</tbody>" +
                "</table>" +
                "</td>" +
                "</tr>" +
                "<!-- CTA : END --> <!-- SOCIAL : BEGIN --></tbody>" +
                "</table>" +
                "</div>";

    return (Body);

}

