package graphqlInterface;
import ballerina.net.http;
import ballerina.config;


public function getData ()(json ) {
    endpoint<http:HttpClient> httpEndpoint {
        create http:HttpClient("https://api.github.com/graphql", {});
    }
    //http:OutRequest req = {};
    //http:InResponse resp = {};
    //req.addHeader("Authorization", "Bearer " + TOKEN);
    //json jsonPayLoad = {query:QUERY_BATCH};
    //req.setJsonPayload(jsonPayLoad);
    //http:HttpConnectorError err;
    //resp, err = httpEndpoint.post("", req);
    //println("POST request:");
    //println(err);
    //json result = resp.getJsonPayload();
    //return result;

    http:OutRequest req = {};
    http:InResponse resp = {};
    req.addHeader("Authorization", "Bearer " + config:getGlobalValue("Conf_Githubtoken"));
    json jsonPayLoad = {query:QUERY_PROJECTS};
    req.setJsonPayload(jsonPayLoad);
    http:HttpConnectorError err;
    resp, err = httpEndpoint.post("", req);
    println("POST request:");
    println(err);
    json projectList = resp.getJsonPayload();
    //println(projectList);
    json result=[];
    int counter =0;
    foreach project in projectList.data.organization.projects.nodes {

        http:OutRequest req1 = {};
        http:InResponse resp1 = {};
        req1.addHeader("Authorization", "Bearer " + config:getGlobalValue("Conf_Githubtoken"));
        json jsonPayLoad1 = {query:QUERY_CARDS.replace("project_number",project.number.toString())};
        req1.setJsonPayload(jsonPayLoad1);
        http:HttpConnectorError err1;
        resp1, err1 = httpEndpoint.post("", req1);
        json projectCards = resp1.getJsonPayload();
        //println(projectCards.data.organization.project);
        result[counter]=projectCards.data.organization.project;
        counter=counter+1;

        
    }
    return result;


}

