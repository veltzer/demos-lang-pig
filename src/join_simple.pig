data1 = LOAD '../data/data1' USING PigStorage(',') AS (user,info);
data2 = LOAD '../data/data2' USING PigStorage(',') AS (user,id);

result_inner = JOIN data1 BY user, data2 BY user;
sh echo "inner"
DUMP result_inner;
sh echo

sh echo "left"
result_left = JOIN data1 BY user LEFT, data2 BY user;
DUMP result_left;
sh echo

sh echo "right"
result_right = JOIN data1 BY user RIGHT, data2 BY user;
DUMP result_right;
sh echo

sh echo "outer"
result_outer = JOIN data1 BY user FULL OUTER, data2 BY user;
DUMP result_outer;
sh echo
