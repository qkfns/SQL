

-- 숫자함수
-- 절대값 계산 : abs(값)
select abs(-4.5);

-- 반올림 : round (값, 자리수)
select round(4.1), round(4.5);
select round(-4.1), round(-4.5);
select round(123.456,1), round(123.456,2);

-- 무조건 내림 : floor(값)
select floor(4.1), floor(4.5);
select floor(-4.1), floor(-4.5);

-- 무조건 올림 : ceil(값)
select ceil(4.1), ceil(4.5);
select ceil(-4.1), ceil(-4.5);

-- 나머지 연산 : mod(분자, 분모)
select mod(10,5), mod(10,3);

-- 난수 생성 : rand (0~1사이 실수값 출력)
select rand(), rand() * 10, rand() *100;

-- 생성한 난수에서 정수 추출
select round(rand() * 10); -- 0~10
select ceil(rand() * 10); -- 1~10
select floor(rand() * 10); -- 0~9

-- n ~ m 사이 임의의 정수 생성
-- n + round(rand()  * (m -n) )

-- 1~45 사이 임의의 정수 생성
select 1+round( rand() * 44 );

-- 문자함수
-- 문자의 ASCII 코드 출력 : ascii(문자)
select ascii('a'), ascii('A'), ascii('0');

-- ASCII 코드를 문자 출력 : char(숫자)
select char(97), char(65), char(48);]

-- 문자열 길이 : length ( 문자열 )
-- 영문자 : 1byte
-- 윈도우코드 (완성형,조합형,euc-kr,win949) : 2byte
-- 유니코드 : 3byte
select length('Hello, World!!');
select length('가나다라마바');  -- 유니코드로 인식되어 한글자당 3바이트

-- 문자열 연결 : concat(문자열1, 문자열2, ....)
select concat('Hello', ', ', 'World!!') 이어붙이기;

-- BookMembers테이블의 이름과 주소, 전화번호등을 다음과 같은 형식으로 출력되도록 질의문을 작성하세요
-- 홍길동 고객의 주소는 ????이고, 전화번호는 !!!!입니다.

select concat(name,' 고객의 주소는 ' ,address,'이고, 전화번호는 ' ,phone,'입니다.')
from BookMembers;

-- 문자열 추출 : left(문자열,길이) , right(문자열,길이) , mid(문자열, 시작, 길이)
--             substring, substr
select left ('Hello, World', 5);
select right ('Hello, World', 5);
select mid ('Hello, World', 8,5);
select mid ('123456-1234567',8,7);

select left('가나다라마바', 3);
select right('가나다라마바', 3);
select mid('가나다라마바', 3, 1);

-- 고급 문자열 추출 : substring(문자열, 시작, 길이)
select substring('Quadratically', 5);
select substring('Quadratically' from 5);
select substring('Quadratically', 5,6);
select substring('Quadratically', -5);
select substring('Quadratically', -5,3);
select substring('Quadratically'from -5 for 3);

-- 대소문자 변환 : upper, lower, ucase, lcase
select upper('abc'), lower('ABC');
select ucase('abc'), lcase('ABC');

-- 공백처리 : trim , ltrim, rtrim
select trim('   abc   '), rtrim('abc   '),
       ltrim('   abc');

-- 문자열 채움 : pad(문자열, 총길이, 채움문자)
-- 숫자는 lpad, 문자는 rpad 함수를 이용
select lpad('12345', 10, '_'),
       lpad('12345', 10, '_');

select rpad('가나다라마',10,'_'),
       rpad('가나다',10,'_');

-- 문자열 바꾸기 : replace(문자열, 찾을문자, 바꿀문자)
select replace('Hello,World','World','Mariadb');

-- 문자열 뒤집기 : reverse
select reverse('12345'), reverse('가나다라마');

-- 문자열 위치찾기 : instr(문자열, 찾을문자열)
-- 존재하지 않는 경우 : 0으로 출력
select instr('Hello, World','W'),
       instr('Hello, World','H'),
       instr('Hello, World','!');

select instr('Hello, World','World');

-- 'Hello_World_!!'에서 2번째 _의 위치를 알고 싶음
-- 이에 적절한 질의문은?
select instr( reverse('Hello_World_!!'),'_' );

select length('Hello_World_!!') - instr( reverse('Hello_World_!!'),'_' ) +1;
-- 한글은 3바이트이므로 length로 문자길이 계산하면 안됨!
-- length 대신 char_length 사용

-- substring_index함수를 이용하면 편하게 할 수 있음
select length(substring_index('Hello_World_!!','_',2))+1;

-- 'World_of_Warcraft_Shadow_Land'에서 3번째 _의 위치는?
select length(substring_index('World_of_Warcraft_Shadow_Land','_',3))+1;

-- 도서 제목에 야구가 포함된 도서를 농구로 벼경한 뒤 변경결과를 확인하세요
select bookname
from Books;

update Books
set bookname = replace(bookname , '농구' , '야구');

-- 굿스포츠에서 출판한 도서의 제목과 글자수를 조회하세요

select bookname, char_length(bookname)
from Books
where publisher = '굿스포츠';
-- 고객 중 같은 성을 가진 고객의 수를 조회하세요

select substring(name,1,1) , count(custid)
from BookMembers
group by substring(name,1,1)
having count(custid)>1;

-- Null 처리함수
-- null 처리 : coalesce(문자열, 널일때대체값)
select coalesce(Null, '입력값 없음');

select coalesce(phone,'전화번호 없음')
from BookMembers;

-- null 처리 :ifnull (문자열, 널일때 대체값)
select null, ifnull(null,'널임'),
       ifnull('hello', '널임');

-- coalease vs ifnull
-- if문이나 case 문으로 null값여부에 따라 다른값으로 대체하는 경우
-- ifnull이나 coalease를 사용하는 것이 좋음

select ifnull('abc','xyz');
select ifnull(null,'xyz');

select coalesce(null, 'abc','xyz'); -- ifnull과 기능유사, SQL표준
select coalesce(null, null,'xyz');

-- null 처리 : nullif(문자열1, 문자열2)
-- 두값이 일치하면 null 출력
-- 두값이 일치하지 않으면 문자열1 출력
-- oracle : NVL

select nullif(null, '널임'),
       nullif('hello', '널임'),
       nullif('hello', 'hello');

select coalesce(nullif('hello','hello'), '헬로우');

-- 사원 테이블에서 수당을 받지않는 사원들의 수당은 0으로 설정하세요

select ifnull(commission_pct, 0)
from EMPLOYEES;

-- 조건 판단 : if (조건식, 참일때값, 거짓일때값)
select if(5 > 3, '크다' , '작다')
from EMPLOYEES;

-- 다중 조건 : case when 조건식 then 처리값 else 처리값 end

-- 날짜/시간 함수
-- 현재 날짜/시간
--   now, current_timestamp, sysdate
select now(), current_timestamp, sysdate();

-- 현재 날짜
-- curdate, current_date
select curdate(), current_date;

-- 현재 시간
-- curtime, current_time
select curtime(), current_time();

-- 날짜계산
-- adddate(날짜, 날짜간격), subdate(날짜, 날짜간격)
-- date_add(날짜, 날짜간격), date_sub(날짜, 날짜간격)
-- 간격 식별문자열 : second, minute, hour, day,month,year

select date_add('2020-12-10', interval 15 day);
select date_add('2020-12-10', interval 6 month);
select date_add('2020-12-10', interval 100 day);

-- 날짜/시간 추출 : year, month, day, week, hour, minute, second

select year(now()), month(now()), day(now()) , week(now()), date(now());

-- 날짜/시간 추출 : dayofmonth, dayofweek, dayofyear, dayname, monthname

select dayofyear(now()), dayofmonth(now()), dayname(now()) , dayofweek(now()), monthname(now());

-- dayofweek를 이용해서 요일을 한글로 출력해보세요

select substring('일월화수목금',dayofweek('2020-12-10'),1 );

-- 날짜 계산 : datediff(날짜1, 날짜2)
-- 오늘기준 크리스마스가 몇일남았는지 계산
select datediff('2020-12-25', now());

-- 오늘 기준 2021-03-21이 얼마나 남았는지 계산
select datediff('2021-03-21',now());

-- 날짜/시간 계산
-- timestampdiff(유형, 날짜1, 날짜2)
-- 오늘 기준 크리스마스가 몇일, 몇시간, 몇분 남았는지 계산
select timestampdiff(day,'2020-12-10' ,'2020-12-25'),
       timestampdiff(hour,'2020-12-10' ,'2020-12-25'),
       timestampdiff(minute,'2020-12-10','2020-12-25');

-- 달의 마지막 일 출력 : last_day(날짜)
select last_day('2020-12-10');

-- 변환함수
-- 각 나라별로 날짜, 시간을 표시하는 방법이 제각각임
-- 이러한 제각각인 날짜/시간 데이터를
-- 적절한 날짜형식 데이터로 인식하기 위해 변환함수 사용
-- 한국 : 년-월-일
-- 미국 : 월/일/

-- 날짜변환함수 : str_to_date(문자열, 형식문자열)
-- 형식문자열 : %H/%h, %i, %s(시간관련) ,
--            %Y/%y, %m, %d(날짜관련)
select str_to_date('2020-12-10', '%Y-%m-%d'),
       str_to_date('12/10/2020', '%m/%d/%y'),
       str_to_date('12/10/20', '%m/%d/%y');

select date_format('2020-12-10', '%W %M'),
       date_format('2020-12-10', '%a %b %j');

-- 숫자문자변환 : cast(대상 as 자료형)
-- 자료형 : char, date/time, decimal, float
-- 묵시적(자동)형변환, 명시적(수동)형변환

select substring(123456789,5,1);
-- 숫자형 데이터가 자동으로 문자형으로 변환되어 추출

select 1234567890, cast(1234567890 as char);

select 10/3, 10/'3';
-- 문자가 실수(float)로 자동형변환

select 10/cast(3 as decimal), 10/'3';

select cast(124035 as time), cast(201210 as date);
-- 시간, 날짜도 변환가능 (단, 정수형태로 작성해야 함)

-- 분석함수 (윈도우함수) - OLAP
-- 윈도우 함수 : 행과 행간의 관계를 정의하기 위해 사용하는 함수
-- 복잡한 기능을 함수로 구현해서 사용하기 편리하게 만들어 둠
-- 경우에 따라 over 절을 사용해야 할 필요가 있음
-- 집계함수 : max, min, avg, sum, count
-- 순위함수 : rank, dense, row_number
-- 통계,회귀분석 : stddev, variance, covar, corr
-- 순서함수 : lag, lead, first_value, last_value

-- 현재 행을 기준으로 이전/이후 값 출력 : lag , lead
-- mariadb는 10이상 지원하기 시작
-- 분석함수를 적용하기 위해서는
-- 먼저 대상 컬럼이 정렬되어 있어야 함

-- 상품 테이블에서 현재 상품명을 기준으로 이전 상품명과 이후 상품명을 조회하세요

select sprdname 현재상품명 , lag(sprdname) over (order by sprdid), lead (sprdname) over (order by sprdid)
from sales_products;

-- 주문테이블에서 주문일자가 빠른순으로 정렬한 후
-- 자신보다 주문일자가 빠른 고객의 이름과 주문일자를 조회하세요

select scustid 이름,lag(scustid) over(order by orddate) 내앞고객,
       orddate 주문일자, lag(orddate) over (order by orddate) 빠른주문일자
from sales_orders;

-- 정렬된 데이터를 기준으로 맨처음/맨마지막 값을 출력 :
-- first_value(컬럼명), last_value(컬럼명)

-- 상품을 주문한 고객중에서
-- 가장 많은/적은 수량으로 주문한 고객을 조회하세요

select first_value(scustid) over (order by ordstatus) 가장적게주문한고객,
       last_value(scustid) over (order by ordstatus) 가장많이주문한고객
from sales_orders limit 8,1;
