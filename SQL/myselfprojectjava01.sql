CREATE SEQUENCE seq_project;

CREATE TABLE project(
    title_num NUMBER(10),
    writer VARCHAR2(10) NOT NULL,
    title VARCHAR2(15) NOT NULL,
    content VARCHAR2(2000),
    view_count NUMBER(10) DEFAULT 0,
    reg_date DATE DEFAULT SYSDATE,
    CONSTRAINT pk_project PRIMARY KEY (title_num)
);

SELECT * FROM project;

UPDATE project
SET view_count = view_count + 1
WHERE title_num = 1;

COMMIT;