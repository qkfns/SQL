-- 사원 테이블에서 사원 이름을 소문자로 출력하세요
select lcase(last_name)
from EMPLOYEES;

-- 사원 테이블에서 사원 이름의 첫글자만 대문자로 출력하세요.

select concat(upper(substring(last_name,1,1)),substring(last_name,2))
from EMPLOYEES;

-- 사원 테이블에서 사원 이름의 길이를 출력하세요.

select char_length(last_name)
from EMPLOYEES;

-- 사원 테이블에서 사원이름과 이름에 A가 몇번째 있는지 출력하세요.

select last_name, instr(last_name,'A')
from EMPLOYEES;

-- 사원 테이블에서 사원이름의 세번째 자리가 R인 사원의 정보를
-- 출력하세요.

select *
from EMPLOYEES
where instr(last_name,'r') = 3;

-- 사원 테이블에서 이름의 끝자리가
-- N으로 끝나는 사원의 정보를 출력하세요.

select *
from EMPLOYEES
where right(last_name,1) = 'n';

-- 사원들의 급여가 평균보다 큰 경우
-- '평균급여이상'이라 출력하고
-- 아닌 경우 '평균급여이하' 라고 출력하세요

select salary,if(salary > 6461 , '평균급여이상', '평균급여이하')
from EMPLOYEES;

select salary,if(salary > (select avg(salary) from EMPLOYEES) , '평균급여이상', '평균급여이하' )
from EMPLOYEES;

-- 사원의 급여에 대해 평균을 계산하고
-- 정수로 변환해서 출력하세요

select cast(avg(salary) as integer)
from EMPLOYEES;

-- 사원들을 입사일자가 빠른 순으로
-- 정렬한 뒤 본인보다 입사일자가 빠른
-- 사원의 급여를 본인의 급여와 함께
-- 출력하세요

select last_name,salary,hire_date,lag(salary) over(order by hire_date) '선임급여'
from EMPLOYEES
order by hire_date;

-- AND나 BETWEEN을 사용하지 않고
-- 2002 년도에 입사한 직원의 이름과
-- 월급을 출력하세요.

select '2002-12-10', left('2002-12-10',4);
select '2002-12-10', substring('2002-12-10',1,4);
select '2002-12-10', year('2002-12-10');

select first_name,salary,hire_date
from EMPLOYEES
where left(hire_date,4) = '2002';

select first_name,salary,hire_date
from EMPLOYEES
where year(hire_date) = 2002;

-- 사원 테이블에서 사원의 이름이
-- 5글자인 사원의 이름을
-- 첫글자만 대문자로 출력하세요.

select concat(left(upper(first_name),1),right(lower(first_name),4))
from EMPLOYEES
where char_length(first_name) = 5;

-- 사원 테이블에서 이름과 입사일자
-- 그리고 현재날까지의 경과일을 산출하세요
-- (소숫점을 빼버리고 해딩이름을
-- 경과일로 바꾸세요)

select current_date 현재,date(hire_date) 입사일, datediff(now(),hire_date) 경과일
from EMPLOYEES;

-- 이전문제에서 경과일을 개월수로 바꿔서
-- 산출하세요. 소숫점을 빼버리고
-- 해당이름을 경과개월수로 바꾸세요
select current_date 현재,date(hire_date) 입사일, timestampdiff(month,hire_date,now()) 경과개월
from EMPLOYEES;

-- 사원 테이블에서 입사후 6개월이
-- 지난날짜 바로 다음 일요일을 구하세요.

select date_add(curdate(),interval 7 - dayofweek(curdate())+1 day);

-- 교육 시작일이 2020-11-02인 경우 5개월이 지난 후 돌아오는 첫번째 금요일이
-- 언제인지 조회하세요

select adddate(adddate('2020-11-02',interval 5 month),
    interval 7 - dayofweek(adddate('2020-11-02',interval 5 month))+6 day);

-- 교육 시작일이 2020-11-02인 경우 131일이 지난 후 돌아오는 첫번째 금요일이
-- 언제인지 조회하세요

select adddate(adddate('2020-11-02',interval 131 day),
               interval 7 - dayofweek(adddate('2020-11-02',interval 131 day))+6 day);

-- 사원 테이블에서 입사후
-- 다음주 일요일이 언제일지 구하세요

select hire_date 입사일 ,adddate(hire_date, interval 7 - dayofweek(hire_date) +1 day) '입사후 다음주 일요일'
from EMPLOYEES;

select '2005-09-17', adddate('2005-09-17', interval 7 - dayofweek('2005-09-17') +1 day);
select dayofweek('2005-09-17');

-- 오늘날짜를 "xx년 xx월 xx일"
-- 형식으로 출력하세요
select date(now()), date_format(date(now()), '%Y년 %m월 %d일');

-- 지금 현재 '몇시 몇분'인지 출력하세요.

select date_format(time(now()),'%h시 %i분');

-- 시간 기준 정하는 표현

set global time_zone = 'Asia/Seoul'; -- 관리자권한 필요
set time_zone = 'Asia/Seoul';

-- 이번 년도 12월 31일까지 몇일이
-- 남았는지 출력하세요.

select datediff('2020-12-31',now());

-- 사원들의 입사일에서
-- 입사 년도와 입사 달을 조회하세요

select left(hire_date,10),date_format(hire_date, '%Y년 %m월 %d일')
from EMPLOYEES;

-- 9월에 입사한 사원을 조회하세요

select substr(hire_date, 6, 2), date_format(hire_date, '%m월'), month(hire_date)
from EMPLOYEES;

select first_name, left(hire_date,10)
from EMPLOYEES
where month(hire_date) = 9;

-- 사원들의 입사일을 출력하되,
-- 요일까지 함께 조회하세요

select first_name,date(hire_date),
       substring('일월화수목금토', dayofweek(hire_date),1) 입사요일
from EMPLOYEES;

-- 사원들의 급여를 통화 기호를 앞에 붙이고
-- 천 단위마다 콤마를 붙여서 조회하세요

select first_name,format(salary,',',3)
from EMPLOYEES;

-- 사원들의 급여를 10자리로 출력하되
-- 자릿수가 남는 경우 빈칸으로
-- 채워서 조회하세요

select lpad(salary,10,' ') 급여
from EMPLOYEES;

-- 각 사원들의 근무한 개월 수를 현재를
-- 기준으로 구하세요

select timestampdiff(month,hire_date,now())
from EMPLOYEES;

-- 각 사원들의 입사일에서
-- 4개월을 추가한 날짜를 조회하세요

select first_name 이름,hire_date 입사일,
       timestampadd(month,4,hire_date) 입사후4개월
from EMPLOYEES;

-- 각 사원들의 입사한 달의 마지막 날을
-- 조회하세요

select first_name,
       last_day(hire_date) 입사월마지막날
from EMPLOYEES;


