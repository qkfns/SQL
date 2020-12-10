-- 연습문제B1
-- 1. 모든 사원의 이름 (FIRST_NAME, LAST_NAME)을 조회하라.
select first_name,last_name
from EMPLOYEES;

-- 2. 모든 사원의 모든 정보를 조회하라.
select * from EMPLOYEES;

-- 3. 모든 도시명을 조회하라.
select city
from LOCATIONS;

-- 4. 이름(FIRST_NAME)이 M으로 시작하는 사원의 모든 정보를 조회하라.
select *
from EMPLOYEES
where first_name like 'M%';

-- 5. 이름(FIRST_NAME)의 두 번째 글자가 'a'인 사원의 이름(FIRST_NAME)과 연봉을 조회하라.

select first_name '사원의 이름', salary 연봉
from EMPLOYEES
where first_name like '_a%';

-- 6. 도시 명을 오름차순으로 정렬하라.

select city
from LOCATIONS
order by city asc;

-- 7. 부서 명을 내림차순 정렬하라.

select department_name
from DEPARTMENTS
order by department_name desc;

-- 8. 연봉이 7000 이상인 사원들의 모든 정보를 연봉순(오름차순)으로 정렬하라.

select *
from EMPLOYEES
where salary >=7000
order by salary asc;

-- 9. 인센티브(COMMISSION_PCT)를 받지 않는 사원들의 모든 정보를 조회하라.

select *
from EMPLOYEES
where commission_pct is NULL ;

-- 10. 인센티브(COMMISSION_PCT)를 받는 사원들의 모든 정보를 조회하라.

select *
from EMPLOYEES
where commission_pct is not NULL;

-- 11. 2007년 06월 21일에 입사한 사원의 사원번호, 이름(FIRST_NAME, LAST_NAME) 그리고 부서번호를 조회하라.

select employee_id 사원번호, first_name , last_name , department_id
from EMPLOYEES
where hire_date ='2007-06-21';

-- 12. 2006년에 입사한 사원의 사원번호와 입사일을 조회하라.

select employee_id 사원번호, hire_date 입사일
from EMPLOYEES e2
where hire_date like '%2006%'
order by hire_date;

-- 13. 이름(FIRST_NAME)의 길이가 5글자 이상인 사원을 조회하라.

select *
from EMPLOYEES
where first_name like '_____%'
order by first_name asc;

-- 14. 연봉이 5000 에서 12000의 범위 이외인 사람들의 LAST_NAME 및 연봉을 조회힌다.

select last_name , salary
from EMPLOYEES
where salary < 5000 or salary >12000;

-- 15. 사원번호가 176 인 사람의 LAST_NAME 과 부서 번호를 조회한다.

select last_name , department_id '부서 번호'
from EMPLOYEES
where employee_id = 176;

-- 16. 연봉이 12000 이상되는 직원들의 LAST_NAME 및 연봉을 조회한다.

select last_name , salary
from EMPLOYEES
where salary >= 12000
order by salary asc;

-- 17. 1994년도에 고용된 모든 사람들의 LAST_NAME 및 고용일을 조회한다.

select last_name , hire_date
from EMPLOYEES
where hire_date like '%1994%';

-- 18. 매니저가 없는 사람들의 LAST_NAME 및 JOB_ID 를 조회한다.

select last_name , job_id
from EMPLOYEES
where manager_id is NULL;

-- 19. 커미션을 버는 모든 사원들의 LAST_NAME, 연봉 및 커미션을 조회한다.
--     단, 연봉 역순, 커미션 역순으로 정렬한다.

select last_name ,salary , commission_pct
from EMPLOYEES
where commission_pct is not null
order by salary desc,commission_pct desc;

-- 20. LAST_NAME 의 네번째 글자가 a 인 사원들의 LAST_NAME 을 조회한다.

select last_name
from EMPLOYEES
where last_name like '___a%';

-- 21. LAST_NAME 에 a 및(OR) e 글자가 있는 사원들의 LAST_NAME 을 조회한다.

select last_name
from EMPLOYEES
where last_name like '%a%' or last_name like '%e%';

-- 22. 연봉이 2,500, 3,500, 7000 이 아니며 직업이 SA_REP 이나 ST_CLERK 인 사람들을 조회한다.

select *
from EMPLOYEES
where (salary <> 2500 and salary <> 3500 and salary <> 7000) and (job_id = 'SA_REP' or job_id = 'ST_CLERK');

-- 23. 회사 전체의 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.

select max(salary) '최대 연봉', min(salary) '최소 연봉', sum(salary) '연봉 총합', ROUND(AVG(salary)) '평균 연봉'
from EMPLOYEES;

-- 24. 각 JOB_ID 별, 최대 연봉, 최소 연봉, 연봉 총 합 및 평균 연봉을 자연수로 포맷하여 조회한다.

select job_id, max(salary)'최대 연봉' , min(salary)'최소 연봉', sum(salary) '연봉 총 합', ROUND(AVG(salary)) '평균 연봉'
from EMPLOYEES
group by job_id;

-- 25. 동일한 직업을 가진 사원들의 총 수를 조회한다.

select job_id, count(employee_id) '직업군별 사원 총수'
from EMPLOYEES
group by job_id;

-- 26. 매니저로 근무하는 사원들의 총 수를 조회한다.

select count(DISTINCT(manager_id)) '매니저로 근무하는 사원 수'
from EMPLOYEES;

-- 27. 사내의 최대 연봉 및 최소 연봉의 차이를 조회한다.

select max(salary) - min(salary) as '최고 최소 연봉 차이'
from EMPLOYEES;

-- 28. 매니저의 사번 및 그 매니저 밑 사원들 중 최소 연봉을 받는 사원의 연봉을 조회한다.
--     매니저가 없는 사람들은 제외한다.
--     최소 연봉이 6000 미만인 경우는 제외한다.
--     연봉 기준 역순으로 조회한다.

select employee_id 사원번호, manager_id '담당 매니저 번호',min(salary) '연봉'
from EMPLOYEES
where salary >= 6000
group by manager_id
having manager_id is not null
order by min(salary) desc;

-- 29. 부서 명, 위치 ID, 각 부서 별 사원 총 수, 각 부서 별 평균 연봉을 조회한다.
--     평균 연봉은 소수점 2 자리까지만 표현한다.

select department_id , COUNT(employee_id) ,ROUND(AVG(salary),2)
from EMPLOYEES
group by department_id;


-- 30. 총 사원 수 및 2005, 2006, 2007, 2008 년도 별 고용된 사원들의 총 수를 다음과 같이 조회한다.



-- 31. 부서번호별 사원수를 조회하라. (부서번호 오름차순 정렬)

select department_id 부서번호, count (employee_id) '부서번호별 사원수'
from EMPLOYEES
group by department_id
having department_id is not null
order by department_id asc;

-- 32.  각 부서별 각 직업 별 연봉 총 합 및 평균 연봉을 조회한다.

select department_id '부서번호', job_id '직업',sum(salary) '연봉 총 합', round(avg(salary)) '평균 연봉'
from EMPLOYEES
group by department_id , job_id
having department_id is not null;

-- 33. 모든 사원들의 LAST_NAME, 부서 이름 및 부서 번호을 조회하세요

select last_name, D.department_id, department_name
from EMPLOYEES e join DEPARTMENTS D
on e.department_id = D.department_id;

-- 34. 부서번호 30의 모든 직업들과 부서명으로 조회하세요 90 부서 또한 포함한다.

select job_id, department_name
from EMPLOYEES e join DEPARTMENTS D
on D.department_id = e.department_id
where D.department_id = 30 or D.department_id =90;

select job_id, department_name
from EMPLOYEES E join DEPARTMENTS D
on E.department_id = D.department_id
where D.department_id in (30,90);

-- 36. 커미션을 버는 모든 사람들의 LAST_NAME,
-- 부서명, 지역 ID 및 도시 명을 조회하세요
select last_name,department_name,D.location_id,city
from EMPLOYEES E inner join DEPARTMENTS D
on E.department_id = D.department_id
inner join LOCATIONS L
on D.location_id = L.location_id
where commission_pct is not null;

-- 37. 커미션을 버는 사람들 중 옥스포드에 거주하는 사람들의 LAST_NAME, 부서명,지역 ID및
-- 도시명을 조회하세요
select last_name, department_name, D.location_id, city
from EMPLOYEES E join DEPARTMENTS D
on E.department_id = D.department_id
join LOCATIONS L
on D.location_id = L.location_id
where commission_pct is not null and L.city = 'Oxford';

-- 38. 부서별 사원수를 조회하세요 -- 단, 부서명도 함께 출력합니다
select department_name 부서명, count (employee_id) 사원수
from EMPLOYEES E inner join DEPARTMENTS D
on E.department_id = D.department_id
group by D.department_name;

-- 39. 부서별 사원수를 조회하세요.단, 부서명도 함께 출력하고 단, 사원수가 0이어도 부서명을 출력합니다

select department_name , count(employee_id) 사원수
from EMPLOYEES E right join DEPARTMENTS D
    on E.department_id = D.department_id
group by department_name
order by 사원수 desc;

-- 자신의 매니저의 이름과 고용일을 조회하세요

select emp.first_name 사원,mgr.first_name 매니저이름, mgr.hire_date '매니저 입사일'
from EMPLOYEES mgr join EMPLOYEES emp
on emp.manager_id = mgr.employee_id;

-- 자신의 매니저보다 먼저 고용된 사원들의 LAST_NAME 및 고용일을 조회하세요.

select emp.last_name 사원,emp.hire_date '사원의 입사일',mgr.last_name 매니저이름, mgr.hire_date '매니저 입사일'
from EMPLOYEES mgr join EMPLOYEES emp
on emp.manager_id = mgr.employee_id
where emp.hire_date < mgr.hire_date;

