-- 서브쿼리 subquery
-- 메인쿼리안에 또 다른 쿼리문으로 구성
-- 스칼라 서브쿼리 : 결과값으로 하나의 값이 조회
-- 인라인 뷰 : 결과값으로 여러개의 값이 조회
-- 질의문을 여러 단계로 구조화하기 때문에
-- 각 질의문이 의도하는 의미를 쉽게 파악

-- where, from, select등에 서브쿼리 사용가능


-- 26) 달콤비스킷을 생산한 제조업체가 만든 제품의 이름과 단가를 검색
-- a) 달콤비스킷을 생산한 제조업체?

select sprdmaker
from  sales_products
where sprdname = '달콤비스킷';

-- b) 한빛제과가 만든 제품의 이름과 단가를 검색
select sprdname, sprdprice
from sales_products
where sprdmaker = '한빛제과';

-- c) 두개의 질의문을 하나로 합침
select sprdname, sprdprice
from sales_products
where sprdmaker =
      (select sprdmaker
      from  sales_products
      where sprdname = '달콤비스킷');

-- 27) 적립금이 가장 많은 고객의 이름과 적립금 조회
-- a) 가장 많은 적립금은?
select max(scustmileage)
from sales_customers;

-- b) 적립금이 5000인 고객의 고객의 이름과 적립금?
select scustname, scustmileage
from sales_customers
where scustmileage = 5000;

-- c) 두개의 질의문을 하나로 합침
select scustname, scustmileage
from sales_customers
where scustmileage =
    (select max(scustmileage)
        from sales_customers);

-- 28) banana(2번) 고객이 주문한 제품의 제품명과 제조업체를 조회
-- a)
select sprdid
from sales_orders
where scustid = 'banana';

-- b)
select sprdname, sprdmaker
from sales_products
where sprdid in ('p06','p01','p04');

-- c)
select sprdname, sprdmaker
from sales_products
where sprdid in (select sprdid
                 from sales_orders
                 where scustid = 'banana');

-- 29) banana(2번) 고객이 주문하지 않은 제품의 제품명과 제조업체를 조회
select sprdname, sprdmaker
from sales_products
where sprdid not in (select sprdid
                 from sales_orders
                 where scustid = 'banana');

-- 30) 대한식품이 제조한 모든 제품의 단가보다 비싼 제품의 제품명, 단가 제조업체 조회
-- a)
select sprdprice
from sales_products
where sprdmaker = '대한식품'
group by sprdmaker;
-- b)
select sprdname, sprdprice, sprdmaker
from sales_products
where sprdprice > 4500;
-- c)
select sprdname, sprdprice, sprdmaker
from sales_products
where sprdprice > (select sprdprice
                   from sales_products
                   where sprdmaker = '대한식품'
                   group by sprdmaker);

-- 정답)
select sprdname, sprdprice, sprdmaker
from sales_products
where sprdprice > all (select sprdprice
                   from sales_products
                   where sprdmaker = '대한식품');


-- 31) 2019년 3월 15일에 제품을 주문한 고객의 이름 조회
-- 서브쿼리로 풀이
select scustname
from sales_customers
where scustid = (select scustid
                 from sales_orders
                 where orddate = '2019-03-15');

-- 이너조인으로 풀이
select scustname
from sales_orders so inner join sales_customers sc
using(scustid)
where orddate = '2019-03-15';

-- 32) 2019년 3원 15일에 제품을 주문하지 않은 고객의 이름 조회

select scustname
from sales_customers
where scustid <> (select scustid
                 from sales_orders
                 where orddate = '2019-03-15');