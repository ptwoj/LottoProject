-- DROP DATABASE Lotto;
CREATE DATABASE Lotto;
USE Lotto;
-- safe모드 해제 
SET sql_safe_updates=0;
show tables;
select * from user;
select * from lottonumber;


SHOW FULL COLUMNS FROM user;

CREATE TABLE user (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL UNIQUE,
    name VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
    money INT default 0,
    create_at DATETIME DEFAULT NOW()
);
update user set money=2000 where name="jun";
select * from user;

INSERT INTO user (email, name, password,money) VALUES ('aaa', 'jun1', '123',1000);
INSERT INTO user (email, name, password,money) VALUES ('bbb', 'jun2', '123',2000);
INSERT INTO user (email, name, password,money) VALUES ('ccc', 'jun3', '123',3000);
CREATE TABLE winningNumber (
    id INT PRIMARY KEY AUTO_INCREMENT,
    draw_date INT unique KEY NOT NULL,
    winning_numbers VARCHAR(100) NOT NULL
);
INSERT INTO winningNumber (draw_date, winning_numbers) VALUES (1, '1,2,3,4,5,6');
INSERT INTO winningNumber (draw_date, winning_numbers) VALUES (2, '7,8,9,10,11,12');
INSERT INTO winningNumber (draw_date, winning_numbers) VALUES (3, '13,14,15,16,17,18');
select * from winningNumber order by draw_date desc limit 1;
CREATE TABLE lottoNumber (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    lotto_numbers VARCHAR(100) NOT NULL,
    draw_date INT NOT NULL,
    status BOOLEAN DEFAULT FALSE,
    FOREIGN KEY (email) REFERENCES user(email),
    FOREIGN KEY (draw_date) REFERENCES winningNumber(draw_date)
);
select * from lottoNumber where status=1;
-- delete from lottoNumber where status=1;
INSERT INTO user (email, name, password,money) VALUES ('aaa', 'jun1', '123',1000);
INSERT INTO winningNumber (draw_date, winning_numbers) VALUES (1, '1,2,3,4,5,6');

INSERT INTO lottoNumber (email, lotto_numbers, draw_date) VALUES ('aaa', '1,2,3,4,5,6', '1');
-- INSERT INTO lottoNumber (email, lotto_numbers, draw_date,status) VALUES ('bbb', '2,4,8,7,10,12', '3','1');
select * from lottoNumber;

CREATE TABLE userWinningInfo (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    draw_date INT NOT NULL,
    lotto_numbers VARCHAR(100) NOT NULL,
    matched_numbers VARCHAR(100) NOT NULL,
    FOREIGN KEY (email) REFERENCES User(email),
   --  FOREIGN KEY (lotto_numbers) REFERENCES lottoNumber(lotto_numbers), 로또 넘버는 중복으로 살 수 있어서 외래키 사용하면 안됨
    FOREIGN KEY (draw_date) REFERENCES winningNumber(draw_date)
);
CREATE TABLE outUser (
    id INT PRIMARY KEY AUTO_INCREMENT,
    email VARCHAR(100) NOT NULL,
    name VARCHAR(100) NOT NULL,
    create_at DATETIME DEFAULT NOW()
);

