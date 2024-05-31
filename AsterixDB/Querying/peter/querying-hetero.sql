use HeterogeneousData;

-- SQ1
select * from HeterogeneousDataset where ts="2018-03-24T17:15:21.196410Z";

USE HeterogeneousData;
DROP VIEW tempUnionView IF EXISTS;
-- Create a temporary view to union all datasets
-- CREATE VIEW tempUnionView AS
-- SELECT ts FROM dnsRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM dcerpcRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM x509Records WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM smbfilesRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM weirdRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM kerberosRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM sslRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM connRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM ntpRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM modbusRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM httpRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM ntlmRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM syslogRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM filesRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM dpdRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM sshRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM ftpRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM noticeRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM peRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM rdpRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM smtpRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM snmpRecords WHERE ts IS NOT MISSING
-- UNION ALL
-- SELECT ts FROM smbmappingRecords WHERE ts IS NOT MISSING;

-- -- Query to check if the specific record exists
-- SELECT COUNT(*) > 0 AS record_exists
-- FROM tempUnionView
-- WHERE ts = "2018-03-24T17:15:21.196410Z";


CREATE TABLE new_table AS SELECT COALESCE(dns.[trans_id], NULL) AS [trans_id],
COALESCE(dns.[_write_ts], dce_rpc.[_write_ts], x509.[_write_ts], smb_files.[_write_ts], weird.[_write_ts], kerberos.[_write_ts], ssl.[_write_ts], conn.[_write_ts], ntp.[_write_ts], modbus.[_write_ts], http.[_write_ts], ntlm.[_write_ts], syslog.[_write_ts], files.[_write_ts], dpd.[_write_ts], ssh.[_write_ts], ftp.[_write_ts], notice.[_write_ts], pe.[_write_ts], rdp.[_write_ts], smtp.[_write_ts], snmp.[_write_ts], smb_mapping.[_write_ts], NULL) AS [_write_ts],
COALESCE(dns.[id.orig_p], dce_rpc.[id.orig_p], smb_files.[id.orig_p], weird.[id.orig_p], kerberos.[id.orig_p], ssl.[id.orig_p], conn.[id.orig_p], ntp.[id.orig_p], modbus.[id.orig_p], http.[id.orig_p], ntlm.[id.orig_p], syslog.[id.orig_p], dpd.[id.orig_p], ssh.[id.orig_p], ftp.[id.orig_p], notice.[id.orig_p], rdp.[id.orig_p], smtp.[id.orig_p], snmp.[id.orig_p], smb_mapping.[id.orig_p], NULL) AS [id.orig_p],
COALESCE(dns.[qtype], NULL) AS [qtype],
COALESCE(dns.[AA], NULL) AS [AA],
COALESCE(dns.[id.orig_h], dce_rpc.[id.orig_h], smb_files.[id.orig_h], weird.[id.orig_h], kerberos.[id.orig_h], ssl.[id.orig_h], conn.[id.orig_h], ntp.[id.orig_h], modbus.[id.orig_h], http.[id.orig_h], ntlm.[id.orig_h], syslog.[id.orig_h], dpd.[id.orig_h], ssh.[id.orig_h], ftp.[id.orig_h], notice.[id.orig_h], rdp.[id.orig_h], smtp.[id.orig_h], snmp.[id.orig_h], smb_mapping.[id.orig_h], NULL) AS [id.orig_h],
COALESCE(dns.[RA], NULL) AS [RA],
COALESCE(dns.[rcode_name], NULL) AS [rcode_name],
COALESCE(dns.[TC], NULL) AS [TC],
COALESCE(dns.[qclass], NULL) AS [qclass],
COALESCE(dns.[rtt], dce_rpc.[rtt], NULL) AS [rtt],
COALESCE(dns.[Z], NULL) AS [Z],
COALESCE(dns.[qtype_name], NULL) AS [qtype_name],
COALESCE(dns.[qclass_name], NULL) AS [qclass_name],
COALESCE(dns.[RD], NULL) AS [RD],
COALESCE(dns.[id.resp_h], dce_rpc.[id.resp_h], smb_files.[id.resp_h], weird.[id.resp_h], kerberos.[id.resp_h], ssl.[id.resp_h], conn.[id.resp_h], ntp.[id.resp_h], modbus.[id.resp_h], http.[id.resp_h], ntlm.[id.resp_h], syslog.[id.resp_h], dpd.[id.resp_h], ssh.[id.resp_h], ftp.[id.resp_h], notice.[id.resp_h], rdp.[id.resp_h], smtp.[id.resp_h], snmp.[id.resp_h], smb_mapping.[id.resp_h], NULL) AS [id.resp_h],
COALESCE(dns.[rcode], NULL) AS [rcode],
COALESCE(dns.[query], NULL) AS [query],
COALESCE(dns.[uid], dce_rpc.[uid], smb_files.[uid], weird.[uid], kerberos.[uid], ssl.[uid], conn.[uid], ntp.[uid], modbus.[uid], http.[uid], ntlm.[uid], syslog.[uid], dpd.[uid], ssh.[uid], ftp.[uid], notice.[uid], rdp.[uid], smtp.[uid], snmp.[uid], smb_mapping.[uid], NULL) AS [uid],
COALESCE(dns.[rejected], NULL) AS [rejected],
COALESCE(dns.[id.resp_p], dce_rpc.[id.resp_p], smb_files.[id.resp_p], weird.[id.resp_p], kerberos.[id.resp_p], ssl.[id.resp_p], conn.[id.resp_p], ntp.[id.resp_p], modbus.[id.resp_p], http.[id.resp_p], ntlm.[id.resp_p], syslog.[id.resp_p], dpd.[id.resp_p], ssh.[id.resp_p], ftp.[id.resp_p], notice.[id.resp_p], rdp.[id.resp_p], smtp.[id.resp_p], snmp.[id.resp_p], smb_mapping.[id.resp_p], NULL) AS [id.resp_p],
COALESCE(dns.[TTLs], NULL) AS [TTLs],
COALESCE(dns.[ts], dce_rpc.[ts], x509.[ts], smb_files.[ts], weird.[ts], kerberos.[ts], ssl.[ts], conn.[ts], ntp.[ts], modbus.[ts], http.[ts], ntlm.[ts], syslog.[ts], files.[ts], dpd.[ts], ssh.[ts], ftp.[ts], notice.[ts], pe.[ts], rdp.[ts], smtp.[ts], snmp.[ts], smb_mapping.[ts], NULL) AS [ts],
COALESCE(dns.[answers], NULL) AS [answers],
COALESCE(dns.[_path], dce_rpc.[_path], x509.[_path], smb_files.[_path], weird.[_path], kerberos.[_path], ssl.[_path], conn.[_path], ntp.[_path], modbus.[_path], http.[_path], ntlm.[_path], syslog.[_path], files.[_path], dpd.[_path], ssh.[_path], ftp.[_path], notice.[_path], pe.[_path], rdp.[_path], smtp.[_path], snmp.[_path], smb_mapping.[_path], NULL) AS [_path],
COALESCE(dns.[proto], conn.[proto], syslog.[proto], dpd.[proto], notice.[proto], NULL) AS [proto],
COALESCE(dce_rpc.[endpoint], NULL) AS [endpoint],
COALESCE(dce_rpc.[named_pipe], NULL) AS [named_pipe],
COALESCE(dce_rpc.[operation], NULL) AS [operation],
COALESCE(x509.[san.dns], NULL) AS [san.dns],
COALESCE(x509.[certificate.key_alg], NULL) AS [certificate.key_alg],
COALESCE(x509.[certificate.version], NULL) AS [certificate.version],
COALESCE(x509.[certificate.not_valid_before], NULL) AS [certificate.not_valid_before],
COALESCE(x509.[san.email], NULL) AS [san.email],
COALESCE(x509.[certificate.not_valid_after], NULL) AS [certificate.not_valid_after],
COALESCE(x509.[basic_constraints.ca], NULL) AS [basic_constraints.ca],
COALESCE(x509.[certificate.key_type], NULL) AS [certificate.key_type],
COALESCE(x509.[certificate.subject], NULL) AS [certificate.subject],
COALESCE(x509.[san.ip], NULL) AS [san.ip],
COALESCE(x509.[certificate.sig_alg], NULL) AS [certificate.sig_alg],
COALESCE(x509.[certificate.serial], NULL) AS [certificate.serial],
COALESCE(x509.[certificate.exponent], NULL) AS [certificate.exponent],
COALESCE(x509.[certificate.issuer], NULL) AS [certificate.issuer],
COALESCE(x509.[id], pe.[id], NULL) AS [id],
COALESCE(x509.[certificate.curve], NULL) AS [certificate.curve],
COALESCE(x509.[certificate.key_length], NULL) AS [certificate.key_length],
COALESCE(smb_files.[size], NULL) AS [size],
COALESCE(smb_files.[action], NULL) AS [action],
COALESCE(smb_files.[name], weird.[name], NULL) AS [name],
COALESCE(weird.[addl], NULL) AS [addl],
COALESCE(weird.[notice], NULL) AS [notice],
COALESCE(weird.[peer], NULL) AS [peer],
COALESCE(kerberos.[till], NULL) AS [till],
COALESCE(kerberos.[renewable], NULL) AS [renewable],
COALESCE(kerberos.[request_type], NULL) AS [request_type],
COALESCE(kerberos.[service], conn.[service], smb_mapping.[service], NULL) AS [service],
COALESCE(kerberos.[client], ssh.[client], NULL) AS [client],
COALESCE(kerberos.[forwardable], NULL) AS [forwardable],
COALESCE(ssl.[next_protocol], NULL) AS [next_protocol],
COALESCE(ssl.[client_cert_chain_fuids], NULL) AS [client_cert_chain_fuids],
COALESCE(ssl.[last_alert], NULL) AS [last_alert],
COALESCE(ssl.[issuer], NULL) AS [issuer],
COALESCE(ssl.[client_subject], NULL) AS [client_subject],
COALESCE(ssl.[subject], NULL) AS [subject],
COALESCE(ssl.[client_issuer], NULL) AS [client_issuer],
COALESCE(ssl.[cipher], NULL) AS [cipher],
COALESCE(ssl.[curve], NULL) AS [curve],
COALESCE(ssl.[resumed], NULL) AS [resumed],
COALESCE(ssl.[established], NULL) AS [established],
COALESCE(ssl.[server_name], NULL) AS [server_name],
COALESCE(ssl.[version], ntp.[version], http.[version], ssh.[version], snmp.[version], NULL) AS [version],
COALESCE(ssl.[validation_status], NULL) AS [validation_status],
COALESCE(ssl.[cert_chain_fuids], NULL) AS [cert_chain_fuids],
COALESCE(conn.[resp_bytes], NULL) AS [resp_bytes],
COALESCE(conn.[history], NULL) AS [history],
COALESCE(conn.[conn_state], NULL) AS [conn_state],
COALESCE(conn.[resp_ip_bytes], NULL) AS [resp_ip_bytes],
COALESCE(conn.[orig_pkts], NULL) AS [orig_pkts],
COALESCE(conn.[missed_bytes], NULL) AS [missed_bytes],
COALESCE(conn.[duration], files.[duration], snmp.[duration], NULL) AS [duration],
COALESCE(conn.[orig_bytes], NULL) AS [orig_bytes],
COALESCE(conn.[orig_ip_bytes], NULL) AS [orig_ip_bytes],
COALESCE(conn.[resp_pkts], NULL) AS [resp_pkts],
COALESCE(ntp.[root_delay], NULL) AS [root_delay],
COALESCE(ntp.[org_time], NULL) AS [org_time],
COALESCE(ntp.[precision], NULL) AS [precision],
COALESCE(ntp.[stratum], NULL) AS [stratum],
COALESCE(ntp.[xmt_time], NULL) AS [xmt_time],
COALESCE(ntp.[root_disp], NULL) AS [root_disp],
COALESCE(ntp.[num_exts], NULL) AS [num_exts],
COALESCE(ntp.[ref_id], NULL) AS [ref_id],
COALESCE(ntp.[mode], NULL) AS [mode],
COALESCE(ntp.[rec_time], NULL) AS [rec_time],
COALESCE(ntp.[poll], NULL) AS [poll],
COALESCE(ntp.[ref_time], NULL) AS [ref_time],
COALESCE(modbus.[func], NULL) AS [func],
COALESCE(http.[request_body_len], NULL) AS [request_body_len],
COALESCE(http.[orig_mime_types], NULL) AS [orig_mime_types],
COALESCE(http.[uri], NULL) AS [uri],
COALESCE(http.[status_code], NULL) AS [status_code],
COALESCE(http.[method], NULL) AS [method],
COALESCE(http.[tags], NULL) AS [tags],
COALESCE(http.[user_agent], NULL) AS [user_agent],
COALESCE(http.[origin], NULL) AS [origin],
COALESCE(http.[resp_filenames], NULL) AS [resp_filenames],
COALESCE(http.[resp_fuids], NULL) AS [resp_fuids],
COALESCE(http.[username], ntlm.[username], NULL) AS [username],
COALESCE(http.[resp_mime_types], NULL) AS [resp_mime_types],
COALESCE(http.[orig_fuids], NULL) AS [orig_fuids],
COALESCE(http.[status_msg], NULL) AS [status_msg],
COALESCE(http.[trans_depth], smtp.[trans_depth], NULL) AS [trans_depth],
COALESCE(http.[response_body_len], NULL) AS [response_body_len],
COALESCE(http.[host], NULL) AS [host],
COALESCE(http.[referrer], NULL) AS [referrer],
COALESCE(ntlm.[hostname], NULL) AS [hostname],
COALESCE(ntlm.[server_nb_computer_name], NULL) AS [server_nb_computer_name],
COALESCE(ntlm.[server_dns_computer_name], NULL) AS [server_dns_computer_name],
COALESCE(ntlm.[server_tree_name], NULL) AS [server_tree_name],
COALESCE(ntlm.[success], NULL) AS [success],
COALESCE(ntlm.[domainname], NULL) AS [domainname],
COALESCE(syslog.[facility], NULL) AS [facility],
COALESCE(syslog.[message], NULL) AS [message],
COALESCE(syslog.[severity], NULL) AS [severity],
COALESCE(files.[rx_hosts], NULL) AS [rx_hosts],
COALESCE(files.[conn_uids], NULL) AS [conn_uids],
COALESCE(files.[seen_bytes], NULL) AS [seen_bytes],
COALESCE(files.[overflow_bytes], NULL) AS [overflow_bytes],
COALESCE(files.[missing_bytes], NULL) AS [missing_bytes],
COALESCE(files.[source], NULL) AS [source],
COALESCE(files.[sha1], NULL) AS [sha1],
COALESCE(files.[total_bytes], NULL) AS [total_bytes],
COALESCE(files.[timedout], NULL) AS [timedout],
COALESCE(files.[filename], NULL) AS [filename],
COALESCE(files.[mime_type], NULL) AS [mime_type],
COALESCE(files.[depth], NULL) AS [depth],
COALESCE(files.[md5], NULL) AS [md5],
COALESCE(files.[fuid], notice.[fuid], NULL) AS [fuid],
COALESCE(files.[tx_hosts], NULL) AS [tx_hosts],
COALESCE(files.[is_orig], NULL) AS [is_orig],
COALESCE(files.[analyzers], NULL) AS [analyzers],
COALESCE(dpd.[failure_reason], NULL) AS [failure_reason],
COALESCE(dpd.[analyzer], NULL) AS [analyzer],
COALESCE(ssh.[auth_attempts], NULL) AS [auth_attempts],
COALESCE(ssh.[server], NULL) AS [server],
COALESCE(ftp.[data_channel.orig_h], NULL) AS [data_channel.orig_h],
COALESCE(ftp.[reply_msg], NULL) AS [reply_msg],
COALESCE(ftp.[arg], NULL) AS [arg],
COALESCE(ftp.[password], NULL) AS [password],
COALESCE(ftp.[user], NULL) AS [user],
COALESCE(ftp.[reply_code], NULL) AS [reply_code],
COALESCE(ftp.[data_channel.resp_p], NULL) AS [data_channel.resp_p],
COALESCE(ftp.[data_channel.resp_h], NULL) AS [data_channel.resp_h],
COALESCE(ftp.[command], NULL) AS [command],
COALESCE(ftp.[data_channel.passive], NULL) AS [data_channel.passive],
COALESCE(notice.[msg], NULL) AS [msg],
COALESCE(notice.[actions], NULL) AS [actions],
COALESCE(notice.[suppress_for], NULL) AS [suppress_for],
COALESCE(notice.[dst], NULL) AS [dst],
COALESCE(notice.[src], NULL) AS [src],
COALESCE(notice.[p], NULL) AS [p],
COALESCE(notice.[note], NULL) AS [note],
COALESCE(notice.[sub], NULL) AS [sub],
COALESCE(pe.[uses_code_integrity], NULL) AS [uses_code_integrity],
COALESCE(pe.[compile_ts], NULL) AS [compile_ts],
COALESCE(pe.[uses_seh], NULL) AS [uses_seh],
COALESCE(pe.[has_import_table], NULL) AS [has_import_table],
COALESCE(pe.[has_export_table], NULL) AS [has_export_table],
COALESCE(pe.[has_cert_table], NULL) AS [has_cert_table],
COALESCE(pe.[os], NULL) AS [os],
COALESCE(pe.[is_64bit], NULL) AS [is_64bit],
COALESCE(pe.[uses_aslr], NULL) AS [uses_aslr],
COALESCE(pe.[machine], NULL) AS [machine],
COALESCE(pe.[section_names], NULL) AS [section_names],
COALESCE(pe.[uses_dep], NULL) AS [uses_dep],
COALESCE(pe.[subsystem], NULL) AS [subsystem],
COALESCE(pe.[has_debug_data], NULL) AS [has_debug_data],
COALESCE(pe.[is_exe], NULL) AS [is_exe],
COALESCE(rdp.[client_build], NULL) AS [client_build],
COALESCE(rdp.[client_name], NULL) AS [client_name],
COALESCE(rdp.[client_dig_product_id], NULL) AS [client_dig_product_id],
COALESCE(rdp.[keyboard_layout], NULL) AS [keyboard_layout],
COALESCE(rdp.[encryption_method], NULL) AS [encryption_method],
COALESCE(rdp.[desktop_width], NULL) AS [desktop_width],
COALESCE(rdp.[requested_color_depth], NULL) AS [requested_color_depth],
COALESCE(rdp.[desktop_height], NULL) AS [desktop_height],
COALESCE(rdp.[security_protocol], NULL) AS [security_protocol],
COALESCE(rdp.[cert_count], NULL) AS [cert_count],
COALESCE(rdp.[cookie], NULL) AS [cookie],
COALESCE(rdp.[cert_permanent], NULL) AS [cert_permanent],
COALESCE(rdp.[result], NULL) AS [result],
COALESCE(rdp.[encryption_level], NULL) AS [encryption_level],
COALESCE(rdp.[client_channels], NULL) AS [client_channels],
COALESCE(rdp.[cert_type], NULL) AS [cert_type],
COALESCE(smtp.[is_webmail], NULL) AS [is_webmail],
COALESCE(smtp.[helo], NULL) AS [helo],
COALESCE(smtp.[tls], NULL) AS [tls],
COALESCE(smtp.[fuids], NULL) AS [fuids],
COALESCE(smtp.[path], smb_mapping.[path], NULL) AS [path],
COALESCE(smtp.[last_reply], NULL) AS [last_reply],
COALESCE(snmp.[get_requests], NULL) AS [get_requests],
COALESCE(snmp.[get_bulk_requests], NULL) AS [get_bulk_requests],
COALESCE(snmp.[community], NULL) AS [community],
COALESCE(snmp.[set_requests], NULL) AS [set_requests],
COALESCE(snmp.[get_responses], NULL) AS [get_responses],
COALESCE(smb_mapping.[native_file_system], NULL) AS [native_file_system],
COALESCE(smb_mapping.[share_type], NULL) AS [share_type]
FROM dns FULL OUTER JOIN dce_rpc on 1=0 FULL OUTER JOIN x509 on 1=0 FULL OUTER JOIN smb_files on 1=0 FULL OUTER JOIN weird on 1=0 FULL OUTER JOIN kerberos on 1=0 FULL OUTER JOIN ssl on 1=0 FULL OUTER JOIN conn on 1=0 FULL OUTER JOIN ntp on 1=0 FULL OUTER JOIN modbus on 1=0 FULL OUTER JOIN http on 1=0 FULL OUTER JOIN ntlm on 1=0 FULL OUTER JOIN syslog on 1=0 FULL OUTER JOIN files on 1=0 FULL OUTER JOIN dpd on 1=0 FULL OUTER JOIN ssh on 1=0 FULL OUTER JOIN ftp on 1=0 FULL OUTER JOIN notice on 1=0 FULL OUTER JOIN pe on 1=0 FULL OUTER JOIN rdp on 1=0 FULL OUTER JOIN smtp on 1=0 FULL OUTER JOIN snmp on 1=0 FULL OUTER JOIN smb_mapping on 1=0
select * from new_table where ts = '2018-03-24T17:15:21.196410Z';


-- SQ2
use HeterogeneousData;
select * from httpRecords;

-- SQ3, NA


-- AQ1, NA
SELECT *
FROM Metadata.`Dataset`
WHERE DataverseName = 'Heterog';

-- AQ2, NA

-- AQ3, NA

