-- Create user to check DB status 
-- Run on the master server (task 1)

CREATE USER IF NOT EXISTS 'holberton_user'@'localhost'
IDENTIFIED BY 'projectcorrection280hbtn';
GRANT  REPLICATION CLIENT, SELECT ON *.*
TO 'holberton_user'@'localhost';
FLUSH PRIVILEGES;
