data = LOAD '/etc/passwd' USING PigStorage(':') AS (user,password,uid,pid,info,homedir,shell);
data_limited = LIMIT data 10;
DUMP data_limited;
