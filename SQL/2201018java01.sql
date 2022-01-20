

select systimestamp from dual;

-- 테이블 생성 (회원정보 : 아이디. 비밀번호, 이름, 성별, 나이)
create table tbl_member (
    account varchar2(20) primary key,  --(not null unique)
    password varchar2(200) not null,
    username varchar2(50) not null,
    gender char(2),
    age number(3)
);


-- 결과 불러오는 코드 (커서 놓고 Ctrl + Enter)
select * from tbl_member;



-- 데이터 삽입(insert문)
insert into tbl_member
    (account, password, username, gender, age)
values
    ('abc1234', 'vvv1234!!!', '김철수', 'M', '30');
    
    
insert into tbl_member
    (account, password, username, gender, age)
values  
    ('abab11', '1541!!!', '이영희', 'W', '26');

    
insert into tbl_member
    (account, password, username, gender)
values  
    ('cccc23', '1541!!!', '고길동', 'W');
    
    
insert into tbl_member
values  
    ('zxzx77', '1633!!!', '박영희', 'W', '22');
    
    



select * from tbl_member;
-- 데이터 수정(UPDATE)
update tbl_member
set gender = 'M', age = 45
where account = 'cccc23';


update tbl_member
set password = 'qqqq1234!!'
where account = 'abc1234';





select * from tbl_member;
-- 데이터 삭제 (DELETE)
delete from tbl_member  -- 이것만 쓰면 전체삭제되니 밑줄에 바로 삭제 지정해줘야함
where account = 'abab11';





select * from tbl_member;
-- 데이터 조회 (SELECT)
select account, username, age
from tbl_member;


select age, gender, username
from tbl_member;


select*  -- 전체 조회
from tbl_member;


select*
from tbl_member
where gender='W';


select account, username, age
from tbl_member
where age>=30;


select*
from tbl_member
where username LIKE '%영%'  -- 영 이 포함된 이름이 나옴
    AND age>=20;  -- 추가 조건문

