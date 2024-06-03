path=" ../homog.db"

# search query 1
sqlite3 $path "SELECT * FROM http WHERE ts = '2018-03-24T17:15:21.196410Z';"  > homogeneous/search1.txt


# search query 2
sqlite3 $path "SELECT * FROM http;" > homogeneous/search2.txt

# search query 3 
sqlite3 $path "SELECT * FROM http WHERE [_write_ts] LIKE '%10.47.5.155%' OR 
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
[uri] LIKE '%10.47.5.155%';" > homogeneous/search3.txt

# analytical query 1
sqlite3 $path "SELECT name FROM sqlite_master WHERE type='table';" > homogeneous/analytical1.txt

# analytical query 2
sqlite3 $path "SELECT 'http' AS table_name, COUNT(*) AS row_count FROM http;" > homogeneous/analytical2.txt

# analytical query 3
sqlite3 $path "SELECT AVG(response_body_len) FROM http;" > homogeneous/analytical3.txt
