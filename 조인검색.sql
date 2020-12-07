-- 조인 검색
-- 다중 테이블을 대상으로 하는 연산
-- 여러 개의 테이블을 결합해서
-- 원하는 데이터를 검색하는 것
-- 조인방법
-- cross join : cartesian product (카테시안 곱)
-- inner join : 조건에 맞는 값만 가져옴
-- outer join : 조건에 맞지 않은 값도 가져옴
-- self join : 자기자신을 대상으로 조인 수행

-- inner join
-- 각 테이블에 존재하는 동일한 컬럼을 대상으로
-- 결합해서 결과 조회
-- select A.a, A.b, B.a, B.b from A, B
-- where A.a = B.b

-- select A.a, A.b, B.a, B.b
-- from A inner join B
-- on A.a = B.b (표준)

-- select 컬럼들... from 조인할 테이블들
-- using (a) (표준)

-- a. 두 테이블 결합하기 cartesian product
select *
from sales_orders, sales_products
where sales_orders.sprdid = sales_products.sprdid;
-- 테이블명이 길어서 별칭을 사용해서 간단히 작성

select *
from sales_orders so, sales_products sp
where so.sprdid = sp.sprdid;

select *
from sales_orders so inner join sales_products sp
on so.sprdid = sp.sprdid;

select *
from sales_orders so inner join sales_products sp
using (sprdid);

-- 23)주문테이블에서 banana 고객에 주문한 상품의 이름을 조회하세요
select ordno, sprdid, sprdname
from sales_orders so inner join sales_products sp
using (sprdid)
where scustid = 'banana';

-- 24) 주문 테이블에서 나이가 30세 이상인 고객이 주문한 제품의 주문제품과 주문일자를 조회하세요
select sprdid, orddate
from sales_orders so inner join sales_customers sc
on so.scustid = sc.scustid
where scustage >= 30;

-- 25) 주문 테이블에서 고명석 고객이 주문한 제품의 이름을 조회하세요
select scustname ,sprdname
from sales_orders so inner join sales_customers sc
                     inner join sales_products sp
on so.scustid = sc.scustid and so.sprdid = sp.sprdid
where scustname = '고명석';

select scustname ,sprdname
from sales_orders so
inner join sales_customers sc
using(scustid)
inner join sales_products sp
using(sprdid)
where scustname = '고명석';

-- 주문 + 고객 inner join : 교집합
-- => 주문한 상품과 주문한 고객

-- 주문 + 고객 outer join : 차집합
-- => 주문이 안된 상품과 주문하지 않은 고객

-- 도서를 구매한 고객

select orderid, name
from BookOrders o inner join BookMembers BM
on o.custid = BM.custid;

-- 도서를 구매한 고객 + 도서를 구매하지 않은 고객

select orderid, name
from BookOrders BO right outer join BookMembers BM
on BO.custid = BM.custid

-- 도서를 구매하지 않은 고객
select orderid, name
from BookOrders BO right outer join BookMembers BM
on BO.custid = BM.custid
where orderid is null;

-- 주문된 도서 + 주문되지 않은 도서

select bookname, orderid
from BookOrders BO right outer join Books B
on BO.bookid = B.bookid;
