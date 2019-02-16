data = LOAD '../data/passwd' USING PigStorage(':') AS (user,password,uid,pid,info,homedir,shell);
grouped = GROUP data ALL;
count = FOREACH grouped GENERATE COUNT($1);
DUMP count;
