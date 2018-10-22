DROP DATABASE IF EXISTS buhtig;
CREATE DATABASE buhtig;
USE buhtig;

# 1 - TABLES

CREATE TABLE users(
	id	INT	PRIMARY KEY AUTO_INCREMENT,
	username VARCHAR(30) UNIQUE NOT NULL,
	password VARCHAR(30) NOT NULL,
	email VARCHAR(50) NOT NULL
);

CREATE TABLE repositories(
	id	INT PRIMARY KEY AUTO_INCREMENT,
	name VARCHAR(50) NOT NULL
);

CREATE TABLE repositories_contributors(
	repository_id INT,	#Relationship with table repositories 
	contributor_id	INT #Relationship with table users
);

CREATE TABLE issues(
	id	INT PRIMARY KEY AUTO_INCREMENT,
	title VARCHAR(255) NOT NULL,
	issue_status VARCHAR(6) NOT NULL,
	repository_id INT NOT NULL, #Relationship with table repositories
	assignee_id	INT NOT NULL	#Relationship with table users
);

CREATE TABLE commits(
	id INT PRIMARY KEY AUTO_INCREMENT,
	message VARCHAR(255) NOT NULL,
	issue_id INT, #Relationship with table issues
	repository_id INT NOT NULL,  #Relationship with table repositories
	contributor_id	INT NOT NULL #Relationship with table users
);

CREATE TABLE files(
	id	INT PRIMARY KEY	AUTO_INCREMENT,
	name VARCHAR(100) NOT NULL,
	size DECIMAL(10, 2) NOT NULL,
	parent_id INT, #Relationship with table files
	commit_id INT NOT NULL #Relationship with table commits
);

# 2 - CONSTRAINTS 
# - "repositories_contributors" - constraints  

ALTER TABLE repositories_contributors
ADD CONSTRAINT fk_repository
	FOREIGN KEY repositories_contributors(repository_id)
	REFERENCES repositories(id);

ALTER TABLE repositories_contributors
ADD CONSTRAINT fk_contributor
	FOREIGN KEY repositories_contributors(contributor_id)
	REFERENCES users(id);

# - "issues" - constraints    

ALTER TABLE issues
ADD CONSTRAINT fk_issues_repository
	FOREIGN KEY issues(repository_id)
    REFERENCES repositories(id);

ALTER TABLE issues
ADD CONSTRAINT fk_issues_users
	FOREIGN KEY issues(assignee_id)
    REFERENCES users(id);

# - "commits" - constraints

ALTER TABLE commits
ADD CONSTRAINT fk_commits_issues
	FOREIGN KEY commits(issue_id)
	REFERENCES issues(id);

ALTER TABLE commits
ADD CONSTRAINT fk_commits_repository
	FOREIGN KEY commits(repository_id)
    REFERENCES repositories(id);
    
ALTER TABLE commits
ADD CONSTRAINT fk_commits_users
	FOREIGN KEY commits(contributor_id)
    REFERENCES users(id);

# - "files" - constraints 

ALTER TABLE files
ADD CONSTRAINT fk_files_files_parent_id
	FOREIGN KEY files(parent_id)
	REFERENCES files(id);

ALTER TABLE files
ADD CONSTRAINT fk_files_commits
	FOREIGN KEY files(commit_id)
    REFERENCES commits(id);


