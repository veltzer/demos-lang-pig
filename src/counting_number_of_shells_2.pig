data = LOAD '/etc/passwd' USING PigStorage(':') AS (user,password,uid,pid,info,homedir,shell);
only_shells = FOREACH data GENERATE shell;
unique_shells = DISTINCT only_shells;
on_one_line = GROUP unique_shells ALL;
result = FOREACH on_one_line GENERATE COUNT($1);
DUMP result;
