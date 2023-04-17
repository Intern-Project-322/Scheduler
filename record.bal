type config record {
    string userID;
    string token;
};

type ScanListByState record {
    Scan[] List;
};

type Scan record {
    string? Id = "";
    string? WebsiteName = "";
    string? WebsiteUrl = "";
    string? WebsiteDescription = "";
    string? UserName = "";
    string? WebsiteId = "";
    string?[] Tags = [];
};

type InvictiScanReport record {
    json Target = {};
    InvictiVulnerability[] Vulnerabilities;

};

type InvictiVulnerability record {
    string? Name = "";
    string? Description = "";
    string? Severity = "";
    string? Url = "";
    string?[] Tags = [];
    string? RemedyReferences = "";
    string? State = "";
    string? Type = "";
};