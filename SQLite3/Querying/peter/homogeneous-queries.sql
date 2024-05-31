CREATE TABLE new_table AS SELECT COALESCE(http.[_write_ts], NULL) AS [_write_ts],
COALESCE(http.[status_code], NULL) AS [status_code],
COALESCE(http.[resp_mime_types], NULL) AS [resp_mime_types],
COALESCE(http.[host], NULL) AS [host],
COALESCE(http.[id.orig_p], NULL) AS [id.orig_p],
COALESCE(http.[orig_fuids], NULL) AS [orig_fuids],
COALESCE(http.[resp_filenames], NULL) AS [resp_filenames],
COALESCE(http.[origin], NULL) AS [origin],
COALESCE(http.[uid], NULL) AS [uid],
COALESCE(http.[resp_fuids], NULL) AS [resp_fuids],
COALESCE(http.[info_code], NULL) AS [info_code],
COALESCE(http.[username], NULL) AS [username],
COALESCE(http.[id.resp_p], NULL) AS [id.resp_p],
COALESCE(http.[ts], NULL) AS [ts],
COALESCE(http.[tags], NULL) AS [tags],
COALESCE(http.[version], NULL) AS [version],
COALESCE(http.[trans_depth], NULL) AS [trans_depth],
COALESCE(http.[user_agent], NULL) AS [user_agent],
COALESCE(http.[info_msg], NULL) AS [info_msg],
COALESCE(http.[orig_mime_types], NULL) AS [orig_mime_types],
COALESCE(http.[response_body_len], NULL) AS [response_body_len],
COALESCE(http.[proxied], NULL) AS [proxied],
COALESCE(http.[_path], NULL) AS [_path],
COALESCE(http.[id.orig_h], NULL) AS [id.orig_h],
COALESCE(http.[id.resp_h], NULL) AS [id.resp_h],
COALESCE(http.[method], NULL) AS [method],
COALESCE(http.[request_body_len], NULL) AS [request_body_len],
COALESCE(http.[referrer], NULL) AS [referrer],
COALESCE(http.[status_msg], NULL) AS [status_msg],
COALESCE(http.[uri], NULL) AS [uri]
FROM http
select * from new_table where ts = '2018-03-24T17:15:21.196410Z';
select * from http;
SELECT * FROM new_table WHERE [_write_ts] LIKE '%10.47.5.155%' OR [status_code] LIKE '%10.47.5.155%' OR [resp_mime_types] LIKE '%10.47.5.155%' OR [host] LIKE '%10.47.5.155%' OR [id.orig_p] LIKE '%10.47.5.155%' OR [orig_fuids] LIKE '%10.47.5.155%' OR [resp_filenames] LIKE '%10.47.5.155%' OR [origin] LIKE '%10.47.5.155%' OR [uid] LIKE '%10.47.5.155%' OR [resp_fuids] LIKE '%10.47.5.155%' OR [info_code] LIKE '%10.47.5.155%' OR [username] LIKE '%10.47.5.155%' OR [id.resp_p] LIKE '%10.47.5.155%' OR [ts] LIKE '%10.47.5.155%' OR [tags] LIKE '%10.47.5.155%' OR [version] LIKE '%10.47.5.155%' OR [trans_depth] LIKE '%10.47.5.155%' OR [user_agent] LIKE '%10.47.5.155%' OR [info_msg] LIKE '%10.47.5.155%' OR [orig_mime_types] LIKE '%10.47.5.155%' OR [response_body_len] LIKE '%10.47.5.155%' OR [proxied] LIKE '%10.47.5.155%' OR [_path] LIKE '%10.47.5.155%' OR [id.orig_h] LIKE '%10.47.5.155%' OR [id.resp_h] LIKE '%10.47.5.155%' OR [method] LIKE '%10.47.5.155%' OR [request_body_len] LIKE '%10.47.5.155%' OR [referrer] LIKE '%10.47.5.155%' OR [status_msg] LIKE '%10.47.5.155%' OR [uri] LIKE '%10.47.5.155%';
select name from sqlite_master where name != 'new_table';
create table ans (count_col INTEGER);INSERT INTO ans (count_col) SELECT COUNT(*) FROM http;select * from ans;DROP TABLE IF EXISTS ans;
select avg(response_body_len) from new_table;