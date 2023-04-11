type config record {
    string userID;
    string token;
};

type Response record {
    ScanData[] List;
};

type ScanData record {
    string Id;
};

type InvictiScanReport record {
    InvictiVulnerability[] Vulnerabilities;

};

type InvictiVulnerability record {
    string? Name = "";
    string? Description = "";
    string? Severity = "";
};