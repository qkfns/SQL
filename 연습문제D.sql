-- northwind 데이터셋 이용

-- 1. 고객 테이블을 조회하세요
select *
from Customers;

-- 2. 고객테이블에서 고객이름과 도시를 조회하세요
select ContactName,City
from Customers;

-- 3. 고객 테이블에서 도시를 조회하세요
-- (중복은 제외한다)
select distinct City
from Customers;

-- 4. 고객 테이블에서 국가 수를 조회하세요
select count(distinct country)
from Customers;

-- 5. 고객 테이블에서 국가가 'Mexico'인 고객을
-- 조회하세요
select *
from Customers
where Country = 'Mexico';

-- 6. 사원 테이블에서 ID가 5인 사원을 조회하세요
select *
from Employees
where EmployeeID = 5;

-- 7. 고객 테이블에서 국가가 'Germany'이고
-- 도시가 'Berlin'인 고객을 조회하세요
select *
from Customers
where city = 'Berlin' and Country = 'Germany';

-- 8. 고객 테이블에서 도시가 'Berlin' 이거나
-- 'München'인 고객을 조회하세요

select *
from Customers
where city = 'Berlin' or city = 'München';

-- 9. 고객 테이블에서 국가가 'Germany' 또는
-- 'Spain' 인 고객을 조회하세요

select *
from Customers
where Country in ('Germany','Spain');

-- 10. 고객 테이블에서 국가가 'Germany' 이 아닌
-- 고객을 조회하세요

select *
from Customers
where country <> 'Germany';

-- 11. 고객 테이블에서 국가가 'Germany' 이고 도시가
-- 'Berlin' 이거나 'München'인 고객을 조회하세요

select *
from Customers
where country = 'Germany' and city in ('Berlin', 'München');

-- 12. 고객 테이블에서 국가가 'Germany' 아니고
-- 'USA'도 아닌 고객을 조회하세요

select *
from Customers
where Country not in ('Germany','USA');

-- 13. 고객 테이블에서 국가순으로 A-Z로
-- 정렬해서 조회하세요

select *
from Customers
order by Country asc;

-- 14. 고객 테이블에서 국가순으로 Z-A로
-- 정렬해서 조회하세요

select *
from Customers
order by Country desc;

-- 15. 고객 테이블에서 국가순으로 A-Z로 정렬하되,
-- 같은 경우 고객이름으로 A-Z로 정렬해서 조회하세요

select *
from Customers
order by Country asc , ContactName asc;

-- 16. 고객 테이블에서 국가순으로 A-Z로 정렬하되,
-- 같은 경우 고객이름으로 Z-A로 정렬해서 조회하세요

select *
from Customers
order by Country asc , ContactName desc;

-- 17. 다음의 고객정보를 고객 테이블에 입력하세요
-- 회사이름, 연락처이름, 주소, 도시, 우편번호, 국가 =>
-- 'Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway'

insert into Customers
    (CompanyName, ContactName,Address,City,PostalCode,Country)
values ('Cardinal', 'Tom B. Erichsen', 'Skagen 21', 'Stavanger', '4006', 'Norway');

-- 18. 다음의 고객정보를 고객 테이블에 입력하세요
-- 회사이름, 도시, 국가 => 'Cardinal', 'Stavanger', 'Norway'

insert into Customers (companyname, city , Country)
values ('Cardinal', 'Stavanger', 'Norway');

-- 19. 고객 테이블에서 주소가 입력되지 않은
-- 고객이름, 연락처이름, 주소를 조회하세요

select ContactName,CompanyName,Address
from Customers
where Address is null;

-- 20. 고객 테이블에서 주소가 입력된 고객이름,
-- 연락처이름, 주소를 조회하세요

select ContactName, CompanyName, Address
from Customers
where Address is not null;

-- 21. 고객 테이블에서 1번 고객의 연락처 이름을
-- 'Alfred Schmidt'로, 도시를 'Frankfurt'로
-- 수정하세요 (ANATR)

update Customers
set CompanyName = 'Alfred Schmidt' , city = 'Frankfurt'
where CustomerID = 'ANATR';

-- 22. 고객 테이블에서 국가가 Mexico인
-- 고객들의 연락처 이름을 'Juan'으로 변경하세요

update Customers
set ContactName = 'Juan'
where country = 'Mexico';

-- 23. 고객 테이블에서 연락처 이름이
-- 'Alfreds Futterkiste'인 고객들을 삭제하세요

delete from Customers
where CompanyName = 'Alfreds Futterkiste';

select *
from Customers
where CompanyName = 'Alfreds Futterkiste';

-- 24. 고객 테이블에서 3번째부터 7번째 고객을 조회하세요
-- 단, 고객이름은 A-Z로 정렬한다 (페이징)
-- mariadb 에서 페이징은 limit x, y 절을 이용
-- x는 시작위치 , y는 읽어올 행수
-- limit 0, 5 : 0번째 위치에서 5개의 행을 읽어옴 (1~5)
-- limit 5, 5 : 5번째 위치에서 5개의 행을 읽어옴 (6~10)

select *
from Customers
limit 2, 5;

-- 25. 고객 테이블에서 국가가 'Germany' 인 고객들 중
-- 3번째부터 7번째 고객을 조회하세요

select * from Customers
where Country = 'Germany'
limit 2,5;

-- 26. 제품테이블에서 최대, 최소 가격을 조회하세요

select max(UnitPrice), min(UnitPrice)
from Products;

-- 27. 제품테이블에서 제품수, 평균가격을 조회하세요

select count(ProductID) 제품수, round(avg(UnitPrice),2) 평균가격
from Products;

-- 28. 제품테이블에서 가격이 20이상인
-- 제품수를 조회하세요

select count(ProductID)
from Products
where UnitPrice >=20;

-- 29. 제품상세테이블에서 주문수, 총 주문수량을
-- 조회하세요

select count(OrderID) 주문수, sum(Quantity) 총주문수량
from Order_Details;

-- 30. 고객 테이블에서 고객이름이
-- 'A'로 시작하는 고객을 조회하세요

select *
from Customers
where ContactName like 'A%';

-- 31. 고객 테이블에서 고객이름이
-- 'a'로 끝나는 고객을 조회하세요

select *
from Customers
where ContactName like '%a';

-- 32. 고객 테이블에서 고객이름에 'or'을
-- 포함하는 고객을 조회하세요

select ContactName
from Customers
where ContactName like '%or%';

select ContactName
from Customers
where instr(ContactName,'or')>0;

-- 32. 고객 테이블에서 고객이름의 2번째
-- 글자가 'r'로 시작하는 고객을 조회하세요

select ContactName
from Customers
where ContactName like '_r%';

select ContactName
from Customers
where substring(ContactName,2,1) = 'r';

-- 32. 고객 테이블에서 고객이름이 'A'로
-- 시작하고 최소 3자 이상인 고객을 조회하세요

select *
from Customers
where ContactName like 'A__%';

select ContactName
from Customers
where left(ContactName,1) = 'A' and
      char_length(ContactName) >= 3;

-- 33. 고객 테이블에서 연락처이름이 'a'로 시작하고
-- 'o'로 끝나는 고객을 조회하세요

select ContactName
from Customers
where ContactName like 'a%o';

select ContactName
from Customers
where left(ContactName,1) = 'a' and
      right(ContactName,1) = 'o';

-- 34. 고객 테이블에서 고객이름이 'A'로 시작하지
-- 않는 고객을 조회하세요

select ContactName
from Customers
where ContactName not like 'A%';

select ContactName
from Customers
where left(ContactName,1) <> 'A';

-- 35. 고객 테이블에서 도시이름이 'ber'로
-- 시작하는 도시를 조회하세요

select city
from Customers
where city like 'ber%';

select city
from Customers
where left(City,3) = 'ber';

-- 36. 고객 테이블에서 도시이름에 'es'를
-- 포함하는 도시를 조회하세요

select city
from Customers
where city like '%es%';

-- 37. 고객 테이블에서 도시이름이 6자이며
-- 'erlin'로 끝나는 도시를 조회하세요

select city
from Customers
where city like '_erlin';

select City
from Customers
where right(city,5) = 'erlin' and
      char_length(city) = 6;

-- 38. 고객 테이블에서 도시이름이 6자이며
-- 'L'로 시작하고 on으로 끝나며,
-- 3번째 글자가 n인 도시를 조회하세요

select city
from Customers
where city like 'L_n_on';

select City
from Customers
where left(city,1) = 'L' and
      substring(city,3,1) = 'n' and
      substring(city,5,2) = 'on' and
      char_length(city) = '6';

-- 정규표현식
-- ^ : 문자열 시작 (like 가% : ^가)
-- $ : 문자열 끝 (like %가 : 가$)
-- [...] : 어떤 문자들 중 하나를 포함 ([1aA])
-- [^...] : 어떤 문자들을 제외 ([^1aA])
-- | : 선택을 의미 (or)

-- 39. 고객 테이블에서 도시이름이 b, s, p등으로
-- 시작하는 도시를 조회하세요

select city
from Customers
where city like 'b%' or city like 's%' or city like 'p%';

select city from Customers
where city like '^[bsp]'; -- ansi sql, 마리아 디비에선 지원x

select city
from Customers
where city regexp '^[bsp]'; -- 마리아디비 전용

-- 40. 고객 테이블에서 도시이름이 a에서 c사이로
-- 시작하는 도시를 조회하세요

select city
from Customers
where city like 'a%' or city like 'b%' or city like 'c%';

select city
from Customers
where city regexp '^[abc]'; -- 마리아디비 전용

select city
from Customers
where city regexp '^[a-c]'; -- 마리아디비 전용

-- 41. 고객 테이블에서 도시이름이 b, s, p등으로
-- 시작하지 않는 도시를 조회하세요

select city
from Customers
where city regexp '^[^bsp]';

-- 42. 고객 테이블에서 국가이름이 'Germany',
-- 'France', 'UK'인 고객을 조회하세요

select ContactName, Country
from Customers
where Country in ('France','Germany','UK');

select ContactName, Country
from Customers
where Country regexp 'France|Germany|UK';

-- 43. 고객 테이블에서 도시이름이
-- 'Germany', 'France', 'UK'가 아닌
-- 고객을 조회하세요

select ContactName, Country from Customers
where country not in ('France','Germany','UK');

-- 44. 상품 테이블에서 가격이
-- 10 ~ 20사이인 제품을 조회하세요

select ProductName from Products
where UnitPrice between 10 and 20;

-- 45. 상품 테이블에서 가격이 10 ~ 20사이인
-- 제품을 조회하세요 단, 제품분류코드가
-- 1,2,3인 제품은 제외한다

select ProductName from Products
where UnitPrice between 10 and 20 and
      CategoryID not in (1,2,3);

-- 46. 상품 테이블에서 제품이름이
-- 'Carnarvon Tigers' 에서
-- 'Mozzarella di Giovanni' 사이인
-- 제품을 조회하세요

select ProductName from Products
where ProductName between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';

-- 47. 상품 테이블에서 제품이름이
-- 'Carnarvon Tigers' 에서
-- 'Mozzarella di Giovanni' 이외의
-- 제품을 조회하세요

select ProductName from Products
where ProductName not between 'Carnarvon Tigers' and 'Mozzarella di Giovanni';

-- 48. 주문 테이블에서 주문날짜가
-- '01-July-1996' 에서 '31-July-1996'사이인
-- 주문을 조회하세요

select OrderDate from Orders
where OrderDate between '1996-07-01' and '1996-07-31';

select OrderDate from Orders
where left(OrderDate, 7) = '1996-07';

select OrderDate from Orders
where instr(OrderDate, '1996-07') =1;

-- 49. 고객 테이블에서 고객번호, 고객이름을
-- 조회하세요 단, 고객번호는 ID로,
-- 고객이름은 Customer라는 별칭을 사용한다

select CustomerID id, ContactName customer from Customers;

-- 50. 고객 테이블에서 고객번호, 주소, 우편번호,
-- 도시, 국가등을 조회하세요 단, 주소, 우편번호,
-- 도시, 국가등은 쉼표로 연결해서
-- Address라는 별칭을 사용한다

select concat(CustomerID,',',Address,',',PostalCode,',',City,',',Country) Adress
from Customers;

-- 51. 고객 테이블을 이용해서
-- 국가별 고객수를 조회하세요

select country 나라,count(CustomerID) 고객수
from Customers
group by country;

-- 52. 고객 테이블을 이용해서
-- 국가별 고객수가 5명 이상인 국가를 조회하세요

select Country, count(CustomerID) 고객수
from Customers
group by Country
having count(CustomerID) >= 5;

-- 53. 고객/주문 테이블을 이용해서
-- 주문번호, 고객이름, 주문일자를 조회하세요

select OrderID, ContactName, orderdate
from Customers inner join Orders O
using(CustomerID);

-- 54. 고객/주문/배송자 테이블을 이용해서
-- 주문번호, 고객이름, 배송업체명을 조회하세요

select CustomerID,ContactName,CompanyName
from Orders O inner join Customers C using(CustomerID)
inner join Shippers S on O.ShipVia = S.ShipperID;

-- 55. 주문/배송자 테이블을 이용해서
-- 배송업체별 주문건수를 조회하세요


-- 56. 주문/배송자 테이블을 이용해서 배송업체별
-- 주문건수가 300건 이상인
-- 배송업체를 조회하세요



-- 57. 주문/사원 테이블을 이용해서
-- 사원 'Davolio' 또는 'Fuller' 가
-- 맡은 총 주문건수 중
-- 100건 이상인 사원은 누구인가?

select LastName,count(OrderID) 건수
from Employees e join Orders
using (EmployeeID)
where LastName in ('Davolio', 'Fuller')
group by LastName
having count(OrderID) >= 100;

-- 58. 고객/주문 테이블을 이용해서
-- 주문번호가 없는 고객을 조회하세요

select ContactName
from Customers C left join Orders O
using(CustomerID)
where OrderID is null;

-- 59. 사원/주문 테이블을 이용해서
-- 주문번호가 없는 사원을 조회하세요

select EmployeeID
from Employees E left join Orders O
using(EmployeeID)
where OrderID is null;

-- 60. 고객 테이블을 이용해서 같은 도시에서
-- 온 고객들을 조회하세요

select distinct C1.ContactName
from Customers C1 join Customers C2
using (city)
where C1.city = C2.city and C1.ContactName <> C2.ContactName;

-- 61. 제품/상세주문 테이블을 이용해서
-- 주문수량이 99 이상인 제품이름을 조회하세요

select ProductName, Quantity
from Products p join Order_Details o
using (ProductID)
where Quantity >=99;

-- 62. 제품 테이블을 이용해서
-- 제품분류코드가 2인 제품의 가격보다
-- 높은 제품의 이름과 가격을 조회하세요

select ProductName, UnitPrice
from Products
where UnitPrice > all (select UnitPrice
                   from Products
                   where CategoryID =2);

-- 64. 제품 테이블을 이용해서 제품이름,
-- 1개당가격 * 재고량, 1개당가격 * 주문량을
-- 조회하세요

select UnitPrice * UnitsInStock 재고총가격, UnitPrice * UnitsOnOrder 주문총가격
from Products;
