

select * from tbl_member;




-- �������� ���α׷�
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

-- �������� ��ȣ�� ����� ���
CREATE SEQUENCE seq_score;


SELECT * FROM score;



