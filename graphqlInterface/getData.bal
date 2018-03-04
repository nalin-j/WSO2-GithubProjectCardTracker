package graphqlInterface;
import ballerina.net.http;

public function getData () (json) {
    endpoint<http:HttpClient> httpEndpoint {
        create http:HttpClient("https://api.github.com/graphql", {});
    }
    http:OutRequest req = {};
    http:InResponse resp = {};
    req.addHeader("Authorization", "Bearer " + TOKEN);
    json jsonPayLoad = {query:QUERY};
    req.setJsonPayload(jsonPayLoad);
    http:HttpConnectorError err;
    resp, err = httpEndpoint.post("", req);
    println("POST request:");
    println(err);
    json result = resp.getJsonPayload();
    return result;
}

