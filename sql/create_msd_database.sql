-- -----------------------------------------------------
-- Kaggle Million Song Data
-- -----------------------------------------------------
DROP DATABASE IF EXISTS msd;
CREATE DATABASE IF NOT EXISTS msd DEFAULT CHARACTER SET utf8;
USE msd;

-- -----------------------------------------------------
-- Create tables
-- -----------------------------------------------------
DROP TABLE IF EXISTS kaggle_songs;

CREATE TABLE IF NOT EXISTS kaggle_songs (
  id INT NOT NULL AUTO_INCREMENT,
  song CHAR(18) NULL,
  PRIMARY KEY (id),
  INDEX song_index (song));


DROP TABLE IF EXISTS kaggle_users;

CREATE TABLE IF NOT EXISTS kaggle_users (
  id INT NOT NULL AUTO_INCREMENT,
  user CHAR(40) NULL,
  PRIMARY KEY (id),
  INDEX user_index (user));


DROP TABLE IF EXISTS kaggle_evaluation_triplets;

CREATE TABLE IF NOT EXISTS kaggle_evaluation_triplets (
  id INT NOT NULL AUTO_INCREMENT,
  user CHAR(40) NULL,
  song CHAR(18) NULL,
  count INT NULL,
  PRIMARY KEY (id),
  INDEX user_index (user),
  INDEX song_index (song));

-- -----------------------------------------------------
-- Load data into tables
-- -----------------------------------------------------
LOAD DATA INFILE '/Users/kamson/Kaggle/MSD/data/kaggle_songs.txt'
INTO TABLE kaggle_songs
FIELDS TERMINATED BY ' ' OPTIONALLY ENCLOSED BY '"'
(song);

LOAD DATA INFILE '/Users/kamson/Kaggle/MSD/data/kaggle_users.txt'
INTO TABLE kaggle_users
FIELDS TERMINATED BY ' ' OPTIONALLY ENCLOSED BY '"'
(user);

LOAD DATA INFILE '/Users/kamson/Kaggle/MSD/data/kaggle_visible_evaluation_triplets.txt'
INTO TABLE kaggle_evaluation_triplets
FIELDS TERMINATED BY '\t' OPTIONALLY ENCLOSED BY '"'
(user, song, count);


