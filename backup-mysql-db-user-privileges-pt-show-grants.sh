#/bin/bash
apt install percona-toolkit -y
pt-show-grants > user_db_backup.sql
