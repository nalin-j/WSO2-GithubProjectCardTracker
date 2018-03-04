package components;

public function createGroupEmail(json groupList)(json){
    int counter=1;
    string task;
    string colour;
    Time time =currentTime();
    int year=time.year();
    int month=time.month();
    int day=time.day();
    string date="Date - " + year + ":" + month + ":" + day;
    string body = "<html>" +
    "<head>" +
    "<title></title>" +
    "<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />" +
    "<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">" +
    "<meta http-equiv=\"X-UA-Compatible\" content=\"IE=edge\" />" +
    "<style type=\"text/css\">" +
    "/* CLIENT-SPECIFIC STYLES */" +
    "body, table, td, a { -webkit-text-size-adjust: 100%; -ms-text-size-adjust: 100%; }" +
    "table, td { mso-table-lspace: 0pt; mso-table-rspace: 0pt; }" +
    "img { -ms-interpolation-mode: bicubic; }" +
    "/* RESET STYLES */" +
    "img { border: 0; height: auto; line-height: 100%; outline: none; text-decoration: none; }" +
    "table { border-collapse: collapse !important; }" +
    "body { height: 100% !important; margin: 0 !important; padding: 0 !important; width: 100% !important; }" +
    "/* iOS BLUE LINKS */" +
    "a[x-apple-data-detectors] {" +
    "    color: inherit !important;" +
    "    text-decoration: none !important;" +
    "    font-size: inherit !important;" +
    "    font-family: inherit !important;" +
    "    font-weight: inherit !important;" +
    "    line-height: inherit !important;" +
    "}" +
    "/* MEDIA QUERIES */" +
    "@media screen and (max-width: 480px) {" +
    "    .mobile-hide {" +
    "        display: none !important;" +
    "    }" +
    "    .mobile-center {" +
    "        text-align: center !important;" +
    "    }" +
    "}" +
    "/* ANDROID CENTER FIX */" +
    "div[style*=\"margin: 16px 0;\"] { margin: 0 !important; }" +
    "</style>" +
    "<body style=\"margin: 0 !important; padding: 0 !important; background-color: #eeeeee;\" bgcolor=\"#eeeeee\">" +
    "<!-- HIDDEN PREHEADER TEXT -->" +
    "<div style=\"display: none; font-size: 1px; color: #fefefe; line-height: 1px; font-family: Open Sans, Helvetica, Arial, sans-serif; max-height: 0px; max-width: 0px; opacity: 0; overflow: hidden;\">" +
    "This is a auto genarated E-mail to notify set of pending cards which are not updated more than 7 days" +
    "</div>" +
    "<table border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">" +
    "    <tr>" +
    "        <td align=\"center\" style=\"background-color: #eeeeee;\" bgcolor=\"#eeeeee\">" +
    "        <!--[if (gte mso 9)|(IE)]>" +
    "        <table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\">" +
    "        <tr>" +
    "        <td align=\"center\" valign=\"top\" width=\"600\">" +
    "        <![endif]-->" +
    "        <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">" +
    "            <tr>" +
    "                <td align=\"center\" valign=\"top\" style=\"font-size:0; padding: 10px;\" bgcolor=\"#044767\">" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                <table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\">" +
    "                <tr>" +
    "                <td align=\"left\" valign=\"top\" width=\"300\">" +
    "                <![endif]-->" +
    "                <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\">" +
    "                    <table align=\"left\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\">" +
    "                        <tr>" +
    "                            <td align=\"left\" valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 36px; font-weight: 800; line-height: 48px;\" class=\"mobile-center\">" +
    "                                <h1 style=\"font-size: 36px; font-weight: 800; margin: 0; color: #ffffff;\">Github Project Card Tracker</h1>" +
    "                            </td>" +
    "                        </tr>" +
    "                    </table>" +
    "                </div>" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                </td>" +
    "                <td align=\"right\" width=\"300\">" +
    "                <![endif]-->" +
    "                <div style=\"display:inline-block; max-width:50%; min-width:100px; vertical-align:top; width:100%;\" class=\"mobile-hide\">" +
    "                    <table align=\"right\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:30px;\">" +
    "                        <tr>" +
    "                            <td valign=\"top\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 48px; font-weight: 400; line-height: 48px;\">" +
    "                                 <a target=\"_blank\" style=\"color: #ffffff; text-decoration: none;\"><img src=\"https://cdn-images-1.medium.com/max/1600/1*Hp_mwS4K0msofoCyc0m33g.png\" width=\"140\" style=\"display: block; border: 0px;\"/></a>" +
    "                            </td>" +
    "                        </tr>" +
    "                    </table>" +
    "                </div>" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                </td>" +
    "                </tr>" +
    "                </table>" +
    "                <![endif]-->" +
    "                </td>" +
    "            </tr>" +
    "            <tr>" +
    "                <td align=\"center\" style=\"padding: 35px 35px 20px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                <table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\">" +
    "                <tr>" +
    "                <td align=\"center\" valign=\"top\" width=\"600\">" +
    "                <![endif]-->" +
    "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:100%;\">" +
    "                    <tr>" +
    "                        <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">" +
    "                            " +
    "                            <h2 style=\"font-size: 30px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\">" +
    "                                Project Card Details <br>" +
                  "                            <h2 style=\"font-size: 20px; font-weight: 800; line-height: 36px; color: #333333; margin: 0;\">" +
                   date+
    "                    </tr>" +
    "                    <tr>" +
    "                        <td align=\"left\" style=\"padding-top: 20px;\">" +
    "			" +
    "                            <table cellspacing=\"0\" cellpadding=\"0\" border=\"0\" >" +
    "                                <tr>" +
    "                                    <td  width=\"15%\"align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">" +
    "                                        Project" +
    "                                    </td>" +
    "									<td width=\"40%\"align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">" +
    "                                        Task" +
    "                                    </td>" +
    "									<td  width=\"10%\"align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">" +
    "                                        Creator" +
    "                                    </td>" +
    "									<td  width=\"15%\"align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">" +
    "                                        Created" +
    "                                    </td>" +
    "									<td  width=\"15%\"align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">" +
    "                                        Updated" +
    "                                    </td>" +
    "									<td width=\"10%\" align=\"left\" bgcolor=\"#eeeeee\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 800; line-height: 24px; padding: 10px;\">" +
    "                                        Delay<br>(Days)" +
    "                                    </td>" +
    "									" +
    "                                </tr>" ;
    foreach card in groupList {
        if (counter%2==0){
            colour="#eeeeee";
        }
        else{
            colour="#ffffff";
        }
        if (card.TASK==null){
            task = null;
        }
        else{
            task = card.TASK.toString();
        }
        body=body+ "                                <tr>" +
                  "                                    <td width=\"15%\" align=\"left\"bgcolor=\""+colour+"\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">" +
                  card.PROJECT.toString() +
                  "                                    </td>" +
                  "									<td  width=\"40%\" align=\"left\"bgcolor=\""+colour+"\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">" +
                  "                                        <a href=\""+card.URL.toString()+"\">"+task+"</a>" +
                  "                                    </td>" +
                  "									<td width=\"10%\" align=\"left\" bgcolor=\""+colour+"\"style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">" +
                  card.USER.toString() +
                  "                                    </td>" +
                  "									<td width=\"15%\" align=\"left\"bgcolor=\""+colour+"\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">" +
                  card.CREATED.toString()+
                  "                                    </td>" +
                  "									<td width=\"15%\" align=\"left\"bgcolor=\""+colour+"\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">" +
                  card.UPDATED.toString() +
                  "                                    </td>" +
                  "									<td width=\"10%\" align=\"left\"bgcolor=\""+colour+"\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding: 15px 10px 5px 10px;\">" +
                  card.DELAY.toString() +
                  "                                    </td>" +
                  "                                </tr>";
        counter=counter+1;
    }
    body=body+ "                               " +
    "                                " +
    "                            </table>" +
    "                        </td>" +
    "                    </tr>" +
    "                   " +
    "                </table>" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                </td>" +
    "                </tr>" +
    "                </table>" +
    "                <![endif]-->" +
    "                </td>" +
    "            </tr>" +
    "             <tr>" +
    "                <td align=\"center\" height=\"100%\" valign=\"top\" width=\"100%\" style=\"padding: 0 35px 35px 35px; background-color: #ffffff;\" bgcolor=\"#ffffff\">" +
    "                </td>" +
    "            </tr>" +
    "            <tr>" +
    "                <td align=\"center\" style=\" padding: 35px; background-color: #1b9ba3;\" bgcolor=\"#1b9ba3\">" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                <table align=\"center\" border=\"0\" cellspacing=\"0\" cellpadding=\"0\" width=\"600\">" +
    "                <tr>" +
    "                <td align=\"center\" valign=\"top\" width=\"600\">" +
    "                <![endif]-->" +
    "                <table align=\"center\" border=\"0\" cellpadding=\"0\" cellspacing=\"0\" width=\"100%\" style=\"max-width:600px;\">" +
    "                    <tr>" +
    "                        <td align=\"center\" style=\"font-family: Open Sans, Helvetica, Arial, sans-serif; font-size: 16px; font-weight: 400; line-height: 24px; padding-top: 25px;\">" +
    "                            <h2 style=\"font-size: 24px; font-weight: 800; line-height: 30px; color: #ffffff; margin: 0;\">" +
    "                                All the above Github project cards are not updated recently." +
    "                            </h2>" +
    "                        </td>" +
    "                    </tr>" +
    "                    " +
    "                </table>" +
    "                <!--[if (gte mso 9)|(IE)]>" +
    "                </td>" +
    "                </tr>" +
    "                </table>" +
    "                <![endif]-->" +
    "                </td>" +
    "            </tr>" +
    "        </table>" +
    "        <!--[if (gte mso 9)|(IE)]>" +
    "        </td>" +
    "        </tr>" +
    "        </table>" +
    "        <![endif]-->" +
    "        </td>" +
    "    </tr>" +
    "</table>" +
    "    " +
    "</body>" +
    "</html>";
    json mail={addr:"nalin.j@outlook.com",body:body};
    return (mail);
}