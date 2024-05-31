DROP DATAVERSE HeterogeneousData IF EXISTS;
CREATE DATAVERSE HeterogeneousData;
USE HeterogeneousData;

-- Types definition
CREATE TYPE dnsType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE dcerpcType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE x509Type IF NOT EXISTS AS open { _path: string? };
CREATE TYPE smbfilesType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE weirdType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE kerberosType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE sslType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE connType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE ntpType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE modbusType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE httpType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE ntlmType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE syslogType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE filesType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE dpdType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE sshType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE ftpType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE noticeType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE peType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE rdpType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE smtpType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE snmpType IF NOT EXISTS AS open { _path: string? };
CREATE TYPE smbmappingType IF NOT EXISTS AS open { _path: string? };

-- External datasets definition
CREATE EXTERNAL DATASET dnsRecords(dnsType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/dns.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET dcerpcRecords(dcerpcType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/dcerpc.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET x509Records(x509Type)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/x509.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET smbfilesRecords(smbfilesType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/smbfiles.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET weirdRecords(weirdType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/weird.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET kerberosRecords(kerberosType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/kerberos.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET sslRecords(sslType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/ssl.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET connRecords(connType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/conn.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET ntpRecords(ntpType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/ntp.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET modbusRecords(modbusType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/modbus.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET httpRecords(httpType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/http.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET ntlmRecords(ntlmType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/ntlm.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET syslogRecords(syslogType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/syslog.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET filesRecords(filesType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/files.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET dpdRecords(dpdType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/dpd.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET sshRecords(sshType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/ssh.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET ftpRecords(ftpType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/ftp.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET noticeRecords(noticeType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/notice.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET peRecords(peType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/pe.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET rdpRecords(rdpType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/rdp.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET smtpRecords(smtpType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/smtp.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET snmpRecords(snmpType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/snmp.ndjson"),
  ("format"="json"),
  ("mode"="line")
);

CREATE EXTERNAL DATASET smbmappingRecords(smbmappingType)
USING localfs (
  ("path"="127.0.0.1:///Users/peterlee/Documents/cs/python/ZED/asterixdb/database/hetero/smbmapping.ndjson"),
  ("format"="json"),
  ("mode"="line")
);
