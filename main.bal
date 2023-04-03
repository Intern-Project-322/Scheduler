import ballerina/io;
import ballerina/http;
configurable config invictiConfig =?;

final http:Client invictiClient = check new("https://www.netsparkercloud.com",
    auth = {
        username: invictiConfig.userID,
        password: invictiConfig.token
    });
   
public function main() returns error? {
    string startDate = "01%2F01%2F2023";
    string endDate = "02%2F28%2F2023";
    string[] scanIdList = check getScanIdList(startDate,endDate);
    foreach string scanId in scanIdList {
        io:println(scanId);
    }
    
}
public function getScanDataFromResponse(json|error response) returns boolean {
   
    io:print(response);
    return true;
}

public function getScanIdList(string startDate, string endDate) returns error|string[]{
    Response response = check invictiClient->get("/api/1.0/scans/listbystate?scanTaskState=Complete&startDate="+startDate+"&endDate="+endDate);
    ScanData[] list = response.List;
    string[] scanIdList = [];
    foreach ScanData item in list {
        scanIdList.push(item.Id);
    }
    return scanIdList;
}

public function getScanById(string scanId) returns error?{
    json response = check invictiClient->get("");
}