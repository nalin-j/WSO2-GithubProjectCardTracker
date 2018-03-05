package GmailInterface;

import ballerina.net.http;
import ballerina.config;
import ballerina.log;


string refresh_token = config:getGlobalValue("conf_Gmailrefresh_token");
string client_id = config:getGlobalValue("conf_Gmailclient_id");
string client_secret = config:getGlobalValue("conf_Gmailclient_secret");

public function genarateAccessToken () (string, error) {

    endpoint<http:HttpClient> gmailTokenEP {
        create http:HttpClient("https://www.googleapis.com/oauth2/v4",{});
    }

    http:OutRequest request = {};
    http:InResponse response = {};
    http:HttpConnectorError err;
    error msg;

    println("refesh token : " +refresh_token);

    string body = "grant_type=refresh_token"+"&client_id=" + client_id + "&client_secret=" + client_secret + "&refresh_token=" + refresh_token;
    request.setStringPayload(body);
    request.setHeader("Content-Type", "application/x-www-form-urlencoded");

    response, err = gmailTokenEP.post("/token", request);
    println(err);
    println("Request Posted");
    json jResponse = response.getJsonPayload();
    //println(jResponse);


    string token;
    try {
        if ((error)err == null) {
            token, _ = (string)jResponse.access_token;
            log:printInfo("New access token is generated");
        } else {

            msg = {msg:"Error occurred when sending a request to retrieve the access token"};
        }
    } catch (error e) {
        msg = {msg:"Error getting the access token"};
    }

    return token, msg;
}
