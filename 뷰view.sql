-- 뷰view
-- 다른 테이블을 기반으로 만들어진 가상(논리적)의 테이블을 의미함
-- 뷰는 실제로 데이터를 저장하고 있지는 않음
-- 하지만, 사용자가 이사실을 인지하지 못하고 실제의 테이블처럼 조작가능

-- 뷰의 목적 : 특정필드에만 접근 허용 (보안)
--           데이터 조작의 간소화 (조인/검색)

-- create view 뷰이름 as
-- select문

-- create or replace view 뷰이름 as
-- select문

-- 39) vip 고객의 아이디, 이름, 나이로 구성된 뷰 생성
--     단, 이름은 우수고객으로 작성

create view 우수고객 as
select scustid, scustname, scustage
from playground.sales_customers
where scustgrd = 'vip';

select * from 우수고객;

-- 40) 제조업체별 제품수로 구성된 뷰 생성 뷰 이름은 제조업체별제품수로 지정

create view 제조업체별제품수(제조업체, 제품수) as
select sprdmaker , count(sprdid)
from sales_products
group by sprdmaker;

select * from 제조업체별제품수;

-- 41) 우수고객 테이블에서 나이가 25세이상인 회원 조회

select *
from 우수고객
where scustage >= 25;

-- 뷰를 이용한 데이터 삽입, 수정, 삭제
-- 뷰는 원본테이블의 분신이므로 삽입, 수정, 삭제 작업은 원본테이블을 대상으로 진행
-- 단, 삽입, 수정, 삭제는 제한적으로 수행될 수 있음.

-- 42) 제품번호, 재고량, 제조업체를 골라서
--     제품1이라는 뷰를 생성하고 제품번호는 p08, 재고량은 1000, 제조업체는 신선식품이라는 정보를 추가함

create view 제품1 as
select sprdid, invent, sprdmaker
from sales_products;

insert into 제품1 value ('p08',1000,'신선식품');

select * from 제품1;

-- 테이블의 컬럼에 특정 제약이 설정되어 있는 경우
-- 뷰를 통한 데이터 삽입은 제한 될 수 있음.

create table sales_product2 (
    prodno int primary key ,
    prdname varchar(10) not null,
    stock int,
    price int,
    prdmaker varchar(10)
);

-- sales_product2 테이블에서 제품번호, 재고량, 제조업체를 골라서
-- 제품2라는 뷰를 생성하고 제품번호는 p09, 재고량은 5000, 제조업체는 새로운식품이라는 정보를 추가함

create view 제품2 as
select prodno 제품번호, stock 재고량, prdmaker 제조업체
from sales_product2;

insert into 제품2 values (9, 5000, '새로운식품');
-- 제품이름이 누락되었기 때문에 입력 실패!

-- sales_products 테이블에서 제품명, 재고량, 제조업체를 골라서 제품3이라는 뷰를 생성

create view 제품3 as
select sprdname 제품명, invent 재고량, sprdmaker 제조업체 from sales_products;

-- 제품명이 얼큰라면인 정보를 삭제하세요
delete from 제품3 where 제품명 = '얼큰라면';
-- prdname 컬럼이 기본키컬럼이 아니므로 지우면 안되는 데이터까지 지워질 수 있다.

select * from 제품3;

-- 주문, 상품, 고객테이블을 조인하고 판매데이터라는 뷰를 만드세요
-- 또한, apple 고객이 주문한 상품이름을 조회하세요

create view 판매데이터 as
select *
from sales_orders
inner join sales_products using (sprdid)
inner join sales_customers using(scustid);

select * from 판매데이터
where scustid = 'banana';

-- 사원, 부서, 위치 테이블을 조인하고 empdeptloc라는 뷰를 만드세요
-- 또한, King이라는 사원이 근무하는 사무실의 도시를 조회하세요

create view empdeptloc as
select location_id,department_id,employee_id,first_name,last_name,email,phone_number,hire_date,job_id,salary,
       commission_pct,EMPLOYEES.manager_id,department_name,street_address,postal_code,city,state_province,country_id
from EMPLOYEES
join DEPARTMENTS using (department_id)
join LOCATIONS using (location_id);

select * from empdeptloc
where last_name = 'King';