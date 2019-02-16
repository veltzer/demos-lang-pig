data = LOAD '../data/passwd' USING PigStorage(':') AS (user,password,uid,pid,info,homedir,shell);
DUMP data
