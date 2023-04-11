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
    json response = check getScanById(scanIdList[0]);
    io:println(response);
    
}
public function getScanDataFromResponse(json|error response) returns boolean {
   
    io:print(response);
    return true;
}

