data = LOAD '/etc/passwd' USING PigStorage(':') AS (user,password,uid,pid,info,homedir,shell);
only_shells = FOREACH data GENERATE shell;
grouped = GROUP only_shells BY shell;
unique_shells = FOREACH grouped GENERATE $0;
on_one_line = GROUP unique_shells ALL;
result = FOREACH on_one_line GENERATE COUNT($1);
DUMP result;
