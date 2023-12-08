-- Create db on the master server
CREATE DATABASE IF NOT EXISTS tyrell_corp;

-- Create table
CREATE TABLE IF NOT EXISTS tyrell_corp.nexus6
(
	id INT UNIQUE AUTO_INCREMENT NOT NULL,
	name VARCHAR(256) NOT NULL,
	PRIMARY KEY (id),
);

-- Insert an entry
INSERT INTO `tyrell_corp.nexus6` (`name`) VALUES ("Emmastro");
