# TOFIX

Findings from a code scan on 2026-10-04.

## Medium

- `run_pig.sh:3` - `2> /dev/null` throws away all of pig's stderr, including parse and runtime errors, so a broken script fails silently. Drop the redirect (quiet the INFO logging through log4j/`-l` instead).
- `run_pig.sh:3` - every script loads `'../data/...'` (e.g. `src/dumping_a_file.pig:1`), which `pig -x local` resolves against the current directory, but `run_pig.sh` does not `cd` anywhere; the scripts only work when invoked from inside `src/`. `cd` to the script's directory in `run_pig.sh` or make the data paths independent of the cwd.
- `src/run_process.pig:1` - `exec` runs a Pig script, not a shell command, so `exec cat /etc/passwd | wc -l > /tmp/result` cannot work. Use `sh` (e.g. `sh bash -c 'cat /etc/passwd | wc -l > /tmp/result'`).
- `src/dumping_a_file.pig:2` - `DUMP data` has no terminating `;` (same in `src/print.pig:2`); Pig Latin statements must end with a semicolon. Add it.

## Low

- `src/print.pig:1` - `var = {3}` is not a valid Pig Latin relation, and `src/set_variable.pig:1` says outright "does not work"; fix both into working examples (e.g. `%declare`/`-param`) or delete them.
- `src/save_as_csv.pig:2` - `STORE ... INTO '/tmp/passwd'` fails on the second run because the output directory already exists; add `rmf /tmp/passwd` before the `STORE`.
- `doc/TODO.txt:1` - asks for examples of the four join types, but `src/join_simple.pig:4-21` already has inner, left, right and full outer joins; the TODO is stale - delete it (and the typo "exmples").
- `README.md:1` - the README is only a title; add the project description (it exists in `config/project.lua:3`) and how to run the demos (`run_pig.sh`, local mode, which directory to run from).
