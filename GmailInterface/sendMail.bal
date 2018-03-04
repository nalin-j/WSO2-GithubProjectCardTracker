package GmailInterface;
//**send email to given email with given message  ****access token is global variable

import ballerina.net.http;
import ballerina.util;



public function sendMail(string accessToken, string to,string from,string subject, string message)(json) {

    endpoint<http:HttpClient> httpEndpoint {
        create http:HttpClient("https://www.googleapis.com/gmail",{});
    }

    http:OutRequest request = {};
    http:InResponse response = {};
    string concatRequest = "";

    concatRequest = concatRequest + "to:" + to+ "\n";
    concatRequest = concatRequest + "subject:" + subject + "\n";
    concatRequest = concatRequest + "from:" + from + "\n";

    concatRequest = concatRequest + "content-type:" + "text/html;charset=iso-8859-1" + "\n";


    concatRequest = concatRequest + "\n" + message + "\n";

    string encodedRequest = util:base64Encode(concatRequest);
    encodedRequest=encodedRequest.replace("+", "-");
    encodedRequest=encodedRequest.replace("/", "_");

    json sendMailRequest = {"raw":encodedRequest};
    string sendMailPath = "/v1/users/me/messages/send";

    request.setHeader("Authorization", "Bearer " + accessToken);
    request.setHeader("Content-Type", "application/json");
    request.setJsonPayload(sendMailRequest);
    println(sendMailRequest);
    http:HttpConnectorError er;
    response,er = httpEndpoint.post(sendMailPath, request);
    print("Response : ");println(response);
    print("Error : ");println(er);
    println("Gmail send email requestested");
    json result = response.getJsonPayload();
    return result;

}