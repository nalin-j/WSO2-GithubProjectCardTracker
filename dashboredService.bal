import ballerina.net.http;
import sqlInterface;
import ballerina.config;



service<http> githubProjectCardTracker {

    resource dashbored (http:Connection conn, http:InRequest req) {
        http:OutResponse res = {};
        json dataToUI=sqlInterface:quary();
        //println(dataToUI);
        res.addHeader("Access-Control-Allow-Origin","*");
        res.setJsonPayload(dataToUI);
        println("received....");
        _ = conn.respond(res);
    }
    resource Head (http:Connection conn, http:InRequest req) {
        http:OutResponse res = {};
        var threshold,_= <int>config:getGlobalValue("conf_threshold");
        json dataHead={"count":lengthof sqlInterface:quary(),"threshold":threshold};
        //println(dataToUI);
        res.addHeader("Access-Control-Allow-Origin","*");
        res.setJsonPayload(dataHead);
        println("received....");
        _ = conn.respond(res);
    }

}
