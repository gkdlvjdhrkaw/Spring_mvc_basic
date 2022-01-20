

select systimestamp from dual;

-- ���̺� ���� (ȸ������ : ���̵�. ��й�ȣ, �̸�, ����, ����)
create table tbl_member (
    account varchar2(20) primary key,  --(not null unique)
    password varchar2(200) not null,
    username varchar2(50) not null,
    gender char(2),
    age number(3)
);


-- ��� �ҷ����� �ڵ� (Ŀ�� ���� Ctrl + Enter)
select * from tbl_member;



-- ������ ����(insert��)
insert into tbl_member
    (account, password, username, gender, age)
values
    ('abc1234', 'vvv1234!!!', '��ö��', 'M', '30');
    
    
insert into tbl_member
    (account, password, username, gender, age)
values  
    ('abab11', '1541!!!', '�̿���', 'W', '26');

    
insert into tbl_member
    (account, password, username, gender)
values  
    ('cccc23', '1541!!!', '��浿', 'W');
    
    
insert into tbl_member
values  
    ('zxzx77', '1633!!!', '�ڿ���', 'W', '22');
    
    



select * from tbl_member;
-- ������ ����(UPDATE)
update tbl_member
set gender = 'M', age = 45
where account = 'cccc23';


update tbl_member
set password = 'qqqq1234!!'
where account = 'abc1234';





select * from tbl_member;
-- ������ ���� (DELETE)
delete from tbl_member  -- �̰͸� ���� ��ü�����Ǵ� ���ٿ� �ٷ� ���� �����������
where account = 'abab11';





select * from tbl_member;
-- ������ ��ȸ (SELECT)
select account, username, age
from tbl_member;


select age, gender, username
from tbl_member;


select*  -- ��ü ��ȸ
from tbl_member;


select*
from tbl_member
where gender='W';


select account, username, age
from tbl_member
where age>=30;


select*
from tbl_member
where username LIKE '%��%'  -- �� �� ���Ե� �̸��� ����
    AND age>=20;  -- �߰� ���ǹ�

