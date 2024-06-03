# homogeneous database
path=" ../homog.db"

# search query 1
sqlite3 $path "CREATE TABLE homo_search1 AS SELECT * FROM http WHERE ts = '2018-03-24T17:15:21.196410Z';"


# search query 2
sqlite3 $path "CREATE TABLE homo_search2 AS SELECT * FROM http;"


# search query 3
cols=$(sqlite3 ../homog.db "PRAGMA table_info(http);" | cut -d '|' -f 2)
for col in $cols; do
        sqlite3 ../homog.db "SELECT * FROM $table WHERE [$col] LIKE '%10.47.5.155%';" >> query_results/homogeneous/search3.db
done
SELECT * FROM new_table WHERE [_write_ts] LIKE '%10.47.5.155%' OR 
[status_code] LIKE '%10.47.5.155%' OR 
[resp_mime_types] LIKE '%10.47.5.155%' OR 
[host] LIKE '%10.47.5.155%' OR 
[id.orig_p] LIKE '%10.47.5.155%' OR 
[orig_fuids] LIKE '%10.47.5.155%' OR 
[resp_filenames] LIKE '%10.47.5.155%' OR 
[origin] LIKE '%10.47.5.155%' OR 
[uid] LIKE '%10.47.5.155%' OR 
[resp_fuids] LIKE '%10.47.5.155%' OR 
[info_code] LIKE '%10.47.5.155%' OR 
[username] LIKE '%10.47.5.155%' OR 
[id.resp_p] LIKE '%10.47.5.155%' OR 
[ts] LIKE '%10.47.5.155%' OR 
[tags] LIKE '%10.47.5.155%' OR 
[version] LIKE '%10.47.5.155%' OR 
[trans_depth] LIKE '%10.47.5.155%' OR 
[user_agent] LIKE '%10.47.5.155%' OR 
[info_msg] LIKE '%10.47.5.155%' OR 
[orig_mime_types] LIKE '%10.47.5.155%' OR 
[response_body_len] LIKE '%10.47.5.155%' OR 
[proxied] LIKE '%10.47.5.155%' OR 
[_path] LIKE '%10.47.5.155%' OR 
[id.orig_h] LIKE '%10.47.5.155%' OR 
[id.resp_h] LIKE '%10.47.5.155%' OR 
[method] LIKE '%10.47.5.155%' OR 
[request_body_len] LIKE '%10.47.5.155%' OR 
[referrer] LIKE '%10.47.5.155%' OR 
[status_msg] LIKE '%10.47.5.155%' OR 
[uri] LIKE '%10.47.5.155%';

# analytical query 1
#.output query_results/homogeneous/analytical1.db
sqlite3 $path "CREATE TABLE homog_analytical1 AS SELECT name FROM sqlite_master WHERE type='table';"

# analytical query 2
#.output query_results/homogeneous/analytical2.db
sqlite3 $path "CREATE TABLE homog_analytical2 AS SELECT 'http' AS table_name, COUNT(*) AS row_count FROM http;"

# analytical query 3
#.output query_results/homogeneous/analytical3.db
sqlite3 $path "CREATE TABLE homog_analytical3 AS SELECT AVG(response_body_len) FROM http;"


# heterogeneous database
path="../heterog.db"
tables=$(sqlite3 $path "SELECT name FROM sqlite_master WHERE type='table' AND name NOT LIKE 'sqlite_%';")

# search query 1
#for table in $tables; do
    #sqlite3 $path "SELECT * FROM $table WHERE ts = '2018-03-24T17:15:21.196410Z';" >> query_results/heterogeneous/search1.db
#done
sqlite3 $path "CREATE TABLE hetero_search1 AS SELECT * FROM new_table WHERE ts = '2018-03-24T17:15:21.196410Z';"

# search query 2
sqlite3 $path "CREATE TABLE hetero_search2 AS SELECT * FROM http;" 

# search query 3
for table in $tables; do  
    cols=$(sqlite3 $path "PRAGMA table_info($table);" | cut -d '|' -f 2)
    echo $table
    for col in $cols; do
        sqlite3 $path "SELECT * FROM $table WHERE [$col] LIKE '%10.47.5.155%';" >> query_results/heterogeneous/search3.db
    done
done
SELECT * FROM new_table WHERE [trans_id] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [qtype] LIKE '%10.47.5.155%' OR [AA] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [RA] LIKE '%10.47.5.155%' OR [rcode_name] LIKE '%10.47.5.155%' OR [TC] LIKE '%10.47.5.155%' OR [qclass] LIKE '%10.47.5.155%' OR [rtt] LIKE '%10.47.5.155%' OR [Z] LIKE '%10.47.5.155%' OR [qtype_name] LIKE '%10.47.5.155%' OR [qclass_name] LIKE '%10.47.5.155%' OR [RD] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [rcode] LIKE '%10.47.5.155%' OR [query] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [rejected] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [TTLs] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [answers] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [proto] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [endpoint] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [named_pipe] LIKE '%10.47.5.155%' OR [operation] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [rtt] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [san.dns] LIKE '%10.47.5.155%' OR [certificate.key_alg] LIKE '%10.47.5.155%' OR [certificate.version] LIKE '%10.47.5.155%' OR [certificate.not_valid_before] LIKE '%10.47.5.155%' OR [san.email] LIKE '%10.47.5.155%' OR [certificate.not_valid_after] LIKE '%10.47.5.155%' OR [basic_constraints.ca] LIKE '%10.47.5.155%' OR [certificate.key_type] LIKE '%10.47.5.155%' OR [certificate.subject] LIKE '%10.47.5.155%' OR [san.ip] LIKE '%10.47.5.155%' OR [certificate.sig_alg] LIKE '%10.47.5.155%' OR [certificate.serial] LIKE '%10.47.5.155%' OR [certificate.exponent] LIKE '%10.47.5.155%' OR [certificate.issuer] LIKE '%10.47.5.155%' OR [id] LIKE '%10.47.5.155%' OR [certificate.curve] LIKE '%10.47.5.155%' OR [certificate.key_length] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [size] LIKE '%10.47.5.155%' OR [action] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [name] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [addl] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [name] LIKE '%10.47.5.155%' OR [notice] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [peer] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [till] LIKE '%10.47.5.155%' OR [renewable] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [request_type] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [service] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [client] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [forwardable] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [next_protocol] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [client_cert_chain_fuids] LIKE '%10.47.5.155%' OR [last_alert] LIKE '%10.47.5.155%' OR [issuer] LIKE '%10.47.5.155%' OR [client_subject] LIKE '%10.47.5.155%' OR [subject] LIKE '%10.47.5.155%' OR [client_issuer] LIKE '%10.47.5.155%' OR [cipher] LIKE '%10.47.5.155%' OR [curve] LIKE '%10.47.5.155%' OR [resumed] LIKE '%10.47.5.155%' OR [established] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [server_name] LIKE '%10.47.5.155%' OR [version] LIKE '%10.47.5.155%' OR [validation_status] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [cert_chain_fuids] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [resp_bytes] LIKE '%10.47.5.155%' OR [history] LIKE '%10.47.5.155%' OR [service] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [conn_state] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [resp_ip_bytes] LIKE '%10.47.5.155%' OR [orig_pkts] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [missed_bytes] LIKE '%10.47.5.155%' OR [duration] LIKE '%10.47.5.155%' OR [orig_bytes] LIKE '%10.47.5.155%' OR [orig_ip_bytes] LIKE '%10.47.5.155%' OR [resp_pkts] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [proto] LIKE '%10.47.5.155%' OR [root_delay] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [org_time] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [precision] LIKE '%10.47.5.155%' OR [stratum] LIKE '%10.47.5.155%' OR [xmt_time] LIKE '%10.47.5.155%' OR [root_disp] LIKE '%10.47.5.155%' OR [num_exts] LIKE '%10.47.5.155%' OR [ref_id] LIKE '%10.47.5.155%' OR [mode] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [version] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [rec_time] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [poll] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [ref_time] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [func] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [request_body_len] LIKE '%10.47.5.155%' OR [orig_mime_types] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [uri] LIKE '%10.47.5.155%' OR [status_code] LIKE '%10.47.5.155%' OR [method] LIKE '%10.47.5.155%' OR [tags] LIKE '%10.47.5.155%' OR [user_agent] LIKE '%10.47.5.155%' OR [origin] LIKE '%10.47.5.155%' OR [resp_filenames] LIKE '%10.47.5.155%' OR [resp_fuids] LIKE '%10.47.5.155%' OR [username] LIKE '%10.47.5.155%' OR [resp_mime_types] LIKE '%10.47.5.155%' OR [orig_fuids] LIKE '%10.47.5.155%' OR [status_msg] LIKE '%10.47.5.155%' OR [trans_depth] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [response_body_len] LIKE '%10.47.5.155%' OR [version] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [host] LIKE '%10.47.5.155%' OR [referrer] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [hostname] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [server_nb_computer_name] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [server_dns_computer_name] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [server_tree_name] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [username] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [success] LIKE '%10.47.5.155%' OR [domainname] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [facility] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [message] LIKE '%10.47.5.155%' OR [severity] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [proto] LIKE '%10.47.5.155%' OR [rx_hosts] LIKE '%10.47.5.155%' OR [conn_uids] LIKE '%10.47.5.155%' OR [seen_bytes] LIKE '%10.47.5.155%' OR [overflow_bytes] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [missing_bytes] LIKE '%10.47.5.155%' OR [source] LIKE '%10.47.5.155%' OR [sha1] LIKE '%10.47.5.155%' OR [total_bytes] LIKE '%10.47.5.155%' OR [timedout] LIKE '%10.47.5.155%' OR [filename] LIKE '%10.47.5.155%' OR [mime_type] LIKE '%10.47.5.155%' OR [depth] LIKE '%10.47.5.155%' OR [md5] LIKE '%10.47.5.155%' OR [fuid] LIKE '%10.47.5.155%' OR [tx_hosts] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [duration] LIKE '%10.47.5.155%' OR [is_orig] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [analyzers] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [failure_reason] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [analyzer] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [proto] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [auth_attempts] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [client] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [version] LIKE '%10.47.5.155%' OR [server] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [data_channel.orig_h] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [reply_msg] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [arg] LIKE '%10.47.5.155%' OR [password] LIKE '%10.47.5.155%' OR [user] LIKE '%10.47.5.155%' OR [reply_code] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [data_channel.resp_p] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [data_channel.resp_h] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [command] LIKE '%10.47.5.155%' OR [data_channel.passive] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [msg] LIKE '%10.47.5.155%' OR [actions] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [suppress_for] LIKE '%10.47.5.155%' OR [dst] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [src] LIKE '%10.47.5.155%' OR [p] LIKE '%10.47.5.155%' OR [fuid] LIKE '%10.47.5.155%' OR [note] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [sub] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [proto] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [uses_code_integrity] LIKE '%10.47.5.155%' OR [compile_ts] LIKE '%10.47.5.155%' OR [uses_seh] LIKE '%10.47.5.155%' OR [has_import_table] LIKE '%10.47.5.155%' OR [has_export_table] LIKE '%10.47.5.155%' OR [has_cert_table] LIKE '%10.47.5.155%' OR [os] LIKE '%10.47.5.155%' OR [is_64bit] LIKE '%10.47.5.155%' OR [uses_aslr] LIKE '%10.47.5.155%' OR [machine] LIKE '%10.47.5.155%' OR [id] LIKE '%10.47.5.155%' OR [section_names] LIKE '%10.47.5.155%' OR [uses_dep] LIKE '%10.47.5.155%' OR [subsystem] LIKE '%10.47.5.155%' OR [has_debug_data] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [is_exe] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [client_build] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [client_name] LIKE '%10.47.5.155%' OR [client_dig_product_id] LIKE '%10.47.5.155%' OR [keyboard_layout] LIKE '%10.47.5.155%' OR [encryption_method] LIKE '%10.47.5.155%' OR [desktop_width] LIKE '%10.47.5.155%' OR [requested_color_depth] LIKE '%10.47.5.155%' OR [desktop_height] LIKE '%10.47.5.155%' OR [security_protocol] LIKE '%10.47.5.155%' OR [cert_count] LIKE '%10.47.5.155%' OR [cookie] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [cert_permanent] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [result] LIKE '%10.47.5.155%' OR [encryption_level] LIKE '%10.47.5.155%' OR [client_channels] LIKE '%10.47.5.155%' OR [cert_type] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [trans_depth] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [is_webmail] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [helo] LIKE '%10.47.5.155%' OR [tls] LIKE '%10.47.5.155%' OR [fuids] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [path] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [last_reply] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [get_requests] LIKE '%10.47.5.155%' OR [get_bulk_requests] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [version] LIKE '%10.47.5.155%' OR [community] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [set_requests] LIKE '%10.47.5.155%' OR [duration] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [get_responses] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [_write_ts] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [native_file_system] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [service] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [path] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [share_type] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%';


# analytical query 1
sqlite3 $path "CREATE TABLE hetero_analytical1 AS SELECT name FROM sqlite_master WHERE name!='new_table';" 

# analytical query 2
sqlite3 $path "SELECT 'conn' AS table_name, COUNT(*) AS row_count FROM conn
UNION ALL
SELECT 'files' AS table_name, COUNT(*) AS row_count FROM files
UNION ALL
SELECT 'modbus' AS table_name, COUNT(*) AS row_count FROM modbus
UNION ALL
SELECT 'pe' AS table_name, COUNT(*) AS row_count FROM pe
UNION ALL
SELECT 'smtp' AS table_name, COUNT(*) AS row_count FROM smtp
UNION ALL
SELECT 'syslog' AS table_name, COUNT(*) AS row_count FROM syslog
UNION ALL
SELECT 'dce_rpc' AS table_name, COUNT(*) AS row_count FROM dce_rpc
UNION ALL
SELECT 'ftp' AS table_name, COUNT(*) AS row_count FROM ftp
UNION ALL
SELECT 'notice' AS table_name, COUNT(*) AS row_count FROM notice
UNION ALL
SELECT 'rdp' AS table_name, COUNT(*) AS row_count FROM rdp
UNION ALL
SELECT 'snmp' AS table_name, COUNT(*) AS row_count FROM snmp
UNION ALL
SELECT 'weird' AS table_name, COUNT(*) AS row_count FROM weird
UNION ALL
SELECT 'dns' AS table_name, COUNT(*) AS row_count FROM dns
UNION ALL
SELECT 'http' AS table_name, COUNT(*) AS row_count FROM http
UNION ALL
SELECT 'ntlm' AS table_name, COUNT(*) AS row_count FROM ntlm
UNION ALL
SELECT 'smb_files' AS table_name, COUNT(*) AS row_count FROM smb_files
UNION ALL
SELECT 'ssh' AS table_name, COUNT(*) AS row_count FROM ssh
UNION ALL
SELECT 'x509' AS table_name, COUNT(*) AS row_count FROM x509
UNION ALL
SELECT 'dpd' AS table_name, COUNT(*) AS row_count FROM dpd
UNION ALL
SELECT 'kerberos' AS table_name, COUNT(*) AS row_count FROM kerberos
UNION ALL
SELECT 'ntp' AS table_name, COUNT(*) AS row_count FROM ntp
UNION ALL
SELECT 'smb_mapping' AS table_name, COUNT(*) AS row_count FROM smb_mapping
UNION ALL
SELECT 'ssl' AS table_name, COUNT(*) AS row_count FROM ssl;" > query_results/heterogeneous/analytical2.db


# analytical query 3
sqlite3 $path "CREATE TABLE hetero_analytical3 AS SELECT AVG(response_body_len) FROM new_table;"