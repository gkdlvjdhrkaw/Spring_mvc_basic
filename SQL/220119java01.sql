

select * from tbl_member;




-- 성적관리 프로그램
CREATE TABLE score(
    stu_num NUMBER(10)PRIMARY KEY,
    stu_name VARCHAR(50) NOT NULL,
    kor NUMBER(3) NOT NULL,
    eng NUMBER(3) NOT NULL,
    math NUMBER(3) NOT NULL,
    total NUMBER(3),
    average NUMBER(5,2),
    grade CHAR(1)
);

-- 순차적인 번호를 만드는 방법
CREATE SEQUENCE seq_score;


SELECT * FROM score;



