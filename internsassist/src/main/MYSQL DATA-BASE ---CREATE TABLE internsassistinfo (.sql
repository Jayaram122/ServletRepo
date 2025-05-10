CREATE TABLE internsassistinfo (
    user_Name VARCHAR(50),
    name VARCHAR(50),
    mail_Id VARCHAR(60),
    phoneNumber BIGINT,
    photo BLOB,
    point int,
    PRIMARY KEY (user_Name, mail_Id)
);

CREATE TABLE attendance (
    sl_No INT PRIMARY KEY auto_increment,
    user_Name VARCHAR(30),
    date_Time DATETIME,
    status enum('present','absent'),
    FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name)
);

CREATE TABLE pointtable (
    user_Name VARCHAR(30),
    points INT,
    FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name)
);

CREATE TABLE internsgitinfo (
    sl_No INT PRIMARY KEY auto_increment,
    user_Name VARCHAR(30),
    hashlink VARCHAR(255),
    date_Time DATETIME,
    FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name)
);

CREATE TABLE projects (
    project_Name VARCHAR(100) PRIMARY KEY,
    projectdescription VARCHAR(500),
    rating INT
);


CREATE TABLE project_assignments (
    sl_No INT PRIMARY KEY auto_increment,
    user_Name VARCHAR(30),
    project_Name VARCHAR(100),
    FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name),
    FOREIGN KEY (project_Name) REFERENCES projects(project_Name)
);

CREATE TABLE leaves (
    sl_no int auto_increment primary key,
    user_Name varchar(30),
    date_Time DATETIME,
    team VARCHAR(30),
    leave_Type VARCHAR(30),
    leave_Start DATE,
    leave_End DATE,
    reason varchar(500),
    FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name),
    FOREIGN KEY (team) REFERENCES team(team),
    FOREIGN KEY (leave_Type) REFERENCES team(leave_Type)
);

CREATE TABLE team (
    team_id INT AUTO_INCREMENT PRIMARY KEY,
    scrumInCharge VARCHAR(30),
    team VARCHAR(30),
    leave_Type VARCHAR(30),
    UNIQUE (team, leave_Type, scrumInCharge),
    INDEX (team),
    INDEX (leave_Type),
    INDEX (scrumInCharge)
);


create table scrumMorning(
sl_No int auto_increment primary key ,
user_Name varchar(30),
date_time datetime,
 team varchar(30),
 attendance enum('yes','no'),
 scrumInCharge varchar(60),
 yesterdayTask varchar(100),
 task_status enum('completed','not completed'),
projectName varchar(50),
task1 varchar(100),
task2 varchar(100),
task3 varchar(100),
addtional varchar(500),
stuck varchar(500),
FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name),
FOREIGN KEY (team) REFERENCES team(team),
FOREIGN KEY (scrumInCharge) REFERENCES team(scrumInCharge));


create table scrumUpdate(
sl_No int auto_increment primary key ,
user_Name varchar(30),
date_time datetime, 
team varchar(30),
task varchar(150),
task_status enum('completed','not completed'),
hashlink varchar(100),
reason varchar(500),
photo longblob,
FOREIGN KEY (user_Name) REFERENCES internsassistinfo(user_Name),
FOREIGN KEY (team) REFERENCES team(team));
