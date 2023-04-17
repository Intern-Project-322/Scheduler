import ballerina/regex;
import ballerina/io;
public function getScanIdList(string startDate, string endDate) returns error|string[]{
    ScanListByState scanListByState = check invictiClient->get("/api/1.0/scans/listbystate?scanTaskState=Complete&startDate="+startDate+"&endDate="+endDate);
    Scan [] list = scanListByState.List;
    string[] scanIdList = [];
    foreach Scan item in list {
        scanIdList.push(<string>item.Id);
    }
    io:print(list);
    return scanIdList;
}

public function getScanById(string scanId) returns error? {
    InvictiScanReport invictiScanReport = check invictiClient->get("/api/1.0/scans/report/?contentFormat=Html&excludeResponseData=true&format=Json&id=dd0aae53-4a5e-42cd-8bcd-afb3043ee706&type=Vulnerabilities");
    InvictiVulnerability[] vulnerabilityList = invictiScanReport.Vulnerabilities;
    foreach InvictiVulnerability vulnerability in vulnerabilityList {
        string desc = regex:replaceAll(<string>vulnerability.Description,"<[^>]*>"," ");
        json obj = {
            title: vulnerability.Name,
            description: desc,
            severity: vulnerability.Severity
        };
        io:println(obj);
    }
}

// public function extractDataFromScan(ScanDetails scanDetails) returns json|error? {
//     json obj;
// }