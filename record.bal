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

type ScanDetails record {
    json[] Vulnerabilities;

};