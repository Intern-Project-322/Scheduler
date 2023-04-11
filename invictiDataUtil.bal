public function getScanIdList(string startDate, string endDate) returns error|string[]{
    Response response = check invictiClient->get("/api/1.0/scans/listbystate?scanTaskState=Complete&startDate="+startDate+"&endDate="+endDate);
    ScanData[] list = response.List;
    string[] scanIdList = [];
    foreach ScanData item in list {
        scanIdList.push(item.Id);
    }
    return scanIdList;
}

public function getScanById(string scanId) returns json|error?{
    json response = check invictiClient->get("/api/1.0/scans/detail/"+scanId);
    return response;
}

public function extractDataFromScan(json scanResponse) returns json|error? {
    
}