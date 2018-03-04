package GmailInterface;

import ballerina.net.http;
import ballerina.util;
import ballerina.config;
import ballerina.log;


string refresh_token = "1/MV1fVIIByVd5ySXGMOGzuwAd3-fX6Udtra_Mp2piVFfEod_lcJRzbdM9ldqVT3Bx";
string client_id = "450804311269-aocr77s3p09lpgefg7gng87dbtk1cl81.apps.googleusercontent.com";
string client_secret = "0wgUN6VHFTMb4sP_EvUMy1tq";

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

function getConnectorConfigs() (http:Options) {
    http:Options option = {
                              ssl: {
                                       trustStoreFile:"/home/njay/ballerina-tools-0.961.0/bre/security/ballerinaTruststore.p12",
                                       trustStorePassword:"ballerina",
                                       ciphers:"TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256, TLS_ECDHE_ECDSA_WITH_AES_128_GCM_SHA256"
                                   },
                              followRedirects: {}
                          };
    return option;
}