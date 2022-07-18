create table tbl_bookrent(
rent_no number(5) primary key,
mem_idx number(5) not null,
bcode char(5) not null,
rent_date date not null,
exp_date date not null,
return_date date,
delay_days number(3)
);

create table book_member(
mem_idx number(5,0) primary key,
name varchar2(20) not null,
email varchar2(20) not null,
tel varchar2(20),
password varchar2(10)
);

CREATE TABLE tbl_book(
bcode char(5) PRIMARY KEY,
title varchar2(30) NOT NULL,
writer varchar2(20),
publisher varchar2(20),
pdate DATE
);

alter table book_member add unique (mem_idx,bcode);

create sequence member_seq start with 10001;

create sequence bookrent_seq;

insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'���ϴ�','honey@naver.com','010-9889-0567','1122');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'�̼���','jong@daum.net','010-2354-67773','2345');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'�����','lucky@korea.com','010-5467-8792','9876');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'���浿','nadong@kkk.net','010-3456-8765','3456');
insert into book_member (mem_idx,name,email,tel,password) values (member_seq.nextval,'������','haha@korea.net','010-3987-9087','1234');

insert into tbl_book values ('A1101','�ڽ���','ų���̰�','���̾𽺺Ͻ�','2016-12-01 ');
insert into tbl_book values ('B1101','��Ŀ������','����Ŀ','��Ŀ����','2018-07-10');
insert into tbl_book values ('C1101','Ǫ������ �ʹϴ�','����','â��','2015-06-20');
insert into tbl_book values ('A1102','�佺Ʈ','�˺���Ʈ �','������','2011-03-01');

SELECT * FROM TBL_BOOK

insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10001,'A1101','2021-10-11','2021-10-25');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(bookrent_seq.nextval,10001,'B1101','2021-09-01','2021-09-15','2021-09-14');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(bookrent_seq.nextval,10002,'C1101','2021-09-12','2021-09-26','2021-09-29');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10003,'A1102','2021-10-04','2021-10-18');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date,return_date)
values(bookrent_seq.nextval,10003,'B1101','2021-09-03','2021-09-17','2021-09-17');
insert into tbl_bookrent (rent_no,mem_idx,bcode,rent_date,exp_date)
values(bookrent_seq.nextval,10004,'C1101','2021-10-02','2021-10-16');

insert into tbl_book values('b1102','��Ʈ����ũ ������','��ö��','KBO','2020-11-10');




--�����ϱ� : '�뿩' �⺻���� ������ �뿩��¥�� ����. �ݳ������� ����+14�� �⺻������ �� �� �ֵ��� �մϴ�.
--ALTER TABLE "C##IDEV".TBL_BOOKRENT  MODIFY RENT.DATE DATE DEFAULT sysdate;
--ALTER TABLE "C##IDEV".TBL_BOOKRENT  MODIFY EXP.DATE DATE DEFAULT sysdate+14;	
--INSERT INTO TBL_BOOKRENT (rent_no,mem_idx,bcode)
--values(bookrent_seq.nextval,10002,'A1102');

--�÷� ����Ʈ �� ���ְ� ������
--ALTER TABLE "C##IDEV".TBL_BOOKRENT MODIFY RENT_DATE DATE DEFUALT NULL;
