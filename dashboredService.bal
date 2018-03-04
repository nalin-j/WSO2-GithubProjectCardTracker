import ballerina.net.http;
import sqlInterface;

service<http> githubProjectCardTracker {

    resource dashbored (http:Connection conn, http:InRequest req) {
        http:OutResponse res = {};
        json dataToUI=sqlInterface:quary();
        println(dataToUI);
        res.setJsonPayload(dataToUI);

        _ = conn.respond(res);
    }
}
