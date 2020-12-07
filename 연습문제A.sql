CREATE TABLE Books (
                       bookid      INTEGER,
                       bookname    VARCHAR(40),
                       publisher   VARCHAR(40),
                       price       INTEGER
);

CREATE TABLE  BookMembers (
                              custid      INTEGER PRIMARY KEY,
                              name        VARCHAR(40),
                              address     VARCHAR(50),
                              phone       VARCHAR(20)
);

CREATE TABLE BookOrders (
                            orderid INTEGER,
                            custid  INTEGER ,
                            bookid  INTEGER ,
                            saleprice INTEGER ,
                            orderdate DATE
);

INSERT INTO Books VALUES
(1, '축구의 역사', '굿스포츠', 7000)
                       ,(2, '축구아는 여자', '나무수', 13000)
                       ,(3, '축구의 이해', '대한미디어', 22000)
                       ,(4, '골프 바이블', '대한미디어', 35000)
                       ,(5, '피겨 교본', '굿스포츠', 8000)
                       ,(6, '역도 단계별기술', '굿스포츠', 6000)
                       ,(7, '야구의 추억', '이상미디어', 20000)
                       ,(8, '야구를 부탁해', '이상미디어', 13000)
                       ,(9, '올림픽 이야기', '삼성당', 7500)
                       ,(10, 'Olympic Champions', 'Pearson', 13000);

INSERT INTO BookMembers VALUES
(1, '박지성', '영국 맨체스타', '000-5000-0001')
                             ,(2, '김연아', '대한민국 서울', '000-6000-0001')
                             ,(3, '장미란', '대한민국 강원도', '000-7000-0001')
                             ,(4, '추신수', '미국 클리블랜드', '000-8000-0001')
                             ,(5, '박세리', '대한민국 대전',  NULL);

INSERT INTO BookOrders VALUES
(1, 1, 1, 6000, STR_TO_DATE('2014-07-01','%Y-%m-%d'))
                            ,(2, 1, 3, 21000, STR_TO_DATE('2014-07-03','%Y-%m-%d'))
                            ,(3, 2, 5, 8000, STR_TO_DATE('2014-07-03','%Y-%m-%d'))
                            ,(4, 3, 6, 6000, STR_TO_DATE('2014-07-04','%Y-%m-%d'))
                            ,(5, 4, 7, 20000, STR_TO_DATE('2014-07-05','%Y-%m-%d'))
                            ,(6, 1, 2, 12000, STR_TO_DATE('2014-07-07','%Y-%m-%d'))
                            ,(7, 4, 8, 13000, STR_TO_DATE( '2014-07-07','%Y-%m-%d'))
                            ,(8, 3, 10, 12000, STR_TO_DATE('2014-07-08','%Y-%m-%d'))
                            ,(9, 2, 10, 7000, STR_TO_DATE('2014-07-09','%Y-%m-%d'))
                            ,(10, 3, 8, 13000, STR_TO_DATE('2014-07-10','%Y-%m-%d'));




-- 연습문제A1
-- 1) 모든 도서의 이름과 가격을 조회하세요
select bookname ,price
from Books ;

-- 1b) 모든 도서의 가격,이름을 조회하세요
select price, bookname
from Books;

-- 2) 모든 도서의 번호, 이름, 출판사, 가격을 조회하세요
select bookid,bookname,publisher,price
from Books;
-- 2b) 모든 도서의 정보를 조회하세요
select * from Books;

-- 3) 모든 도서의 출판사를 조회하세요
select publisher
from Books;
-- 3b) 모든 도서의 출판사를 조회하세요 (중복제거)
select DISTINCT publisher
from Books;
-- 4) 고객의 이름, 전화번호를 조회하세요 단, 출력결과의 필드명을 '이름,전화번호'로 바꿔 출력

SELECT  name '이름', phone '전화번호'
FROM BookMembers;

-- 5) 고객의 이름과 핸드폰번호를 조회하세요
select name, phone
from BookMembers;

-- 6) 가격이 20000미만인 도서를 조회하세요
select *
from Books
where price < 20000;

-- 7) 가격이 15000이상 ~25000이하인 도서의 제목을 조회하세요
select bookname
from Books
where price BETWEEN 15000 and 25000;

-- 8) 책이름이 '축구의 역사' 또는 '피겨 교본'인 도서의 출판사를 조회하세요
select publisher as 출판사
FROM Books
where bookname = '축구의 역사' or bookname = '피겨 교본';

select bookname, publisher
from Books
where bookname in ('축구의 역사', '피겨 교본');

-- 9) '축구'로 시작하는 도서 이름을 조회하세요.
select bookname
from Books
where bookname like '축구%';

-- 9b) '축구'로 끝나는 도서 이름을 조회하세요
select bookname
from Books
where bookname like '%축구';

-- 9c) '축구'를 포함하는 도서 이름을 조회하세요
select bookname
from Books
where bookname like '%축구%';

-- 9d) 도서이름 중에 '의'를 포함하는 책은?

select bookname
from Books
where bookname like '%의%';

-- 10) '골프'를 포함하고 가격이 30000이상인 도서 이름을 조회하세요

select bookname
from Books
where bookname like '%골프%' and price >= 30000;

-- 11) 고객이름을 가나다순으로 오름차순 정렬하고
-- 이름이 같으면 주소로 내림차순 정렬해서 조회하세요

select name , address
from BookMembers
order by name asc , address desc;

-- 11b) 도서의 가격을 내림차순으로,
-- 가격이 같으면 출판사이름으로 오름차순 정렬해서 조회하세요

select price , publisher
from Books
order by price desc , publisher asc;

-- 12) 고객이 주문한 도서의 총, 평균, 최고,
-- 최저 판매액을 조회하세요

select sum(saleprice) '총 판매액', avg(saleprice) 평균, max(saleprice) 최고, min(saleprice) 최저
from BookOrders;

-- 13b) 출판사별 도서의 총 수량 조회하세요

select publisher ,count(bookid)
from Books
group by publisher;

--  14) 출판사별 도서의 총 수량이 2권이상인 출판사 조회하세요

select publisher , count(bookid)
from Books
group by publisher
HAVING count(bookid)>=2;

--  14b) 가격이 8000이상인 도서를 구매한 고객별
--  주문 도서의 총 수량을 구하세요

select custid, count(bookid)
from BookOrders
where saleprice >= 8000
group by custid;


--  14b) 가격이 8000이상인 도서를 구매한 고객별
--  주문 도서의 총 수량을 구하세요
--  단, 고객별 2권이상 주문한 고객을 대상으로 한다

select custid, count(bookid)
from BookOrders bo
where saleprice >= 8000
group by custid
having count(bookid)>=2;

--  15) 주문한 고객번호,고객이름과 주문금액,주소를 조회하세요
-- 고객 테이블과 주문테이블을 결합해야 조회 가능
-- 즉, 외래키 관꼐에 있는 컬럼을 대상으로 결합

select BM.custid, name, saleprice ,address
from BookOrders bo inner join BookMembers BM
on bo.custid = BM.custid;

--  15b) 박지성 고객의 주문금액,주소,주문일자를 조회하세요

select saleprice, address, orderdate
from BookOrders bo inner join BookMembers BM
on bo.custid = BM.custid
where name = '박지성';

--  16) 주문한 도서이름,주문금액,주문일자를 조회하세요

select bookname 도서이름 , saleprice 주문금액, orderdate 주문일자
from BookOrders bo inner join Books B
on bo.bookid = B.bookid;

--  19) 가격이 20000인 도서를 주문한 고객 이름 조회하세요

select name
from BookOrders bo inner join BookMembers BM
on bo.custid = BM.custid
where saleprice = 20000;

--  20) 주문한 고객이름, 도서이름, 주문일자 출력하세요

select name, bookname, orderdate
from BookOrders bo inner join BookMembers BM
on bo.custid = BM.custid
inner join Books B
on bo.bookid = B.bookid;

--  21) 도서를 구매하지 않은 고객을 포함하여
--     고객이름과 주문한 도서의 판매금액을 조회하세요
select name, saleprice
from BookMembers inner join BookOrders BO
on BookMembers.custid = BO.custid ;


































