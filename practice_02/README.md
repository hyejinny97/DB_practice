# 사전 설정

## 실행

```bash
$ sqlite3 healthcare.sqlite3 
```

## Column 출력 설정

```sql
sqlite3> .headers on 
sqlite3> .mode column
```

## table 및 스키마 조회

```sql
sqlite3> .tables
healthcare

sqlite3> .schema healthcare
CREATE TABLE healthcare (
id PRIMARY KEY,        
sido INTEGER NOT NULL, 
gender INTEGER NOT NULL,
age INTEGER NOT NULL,  
height INTEGER NOT NULL,
weight INTEGER NOT NULL,
waist REAL NOT NULL,   
va_left REAL NOT NULL, 
va_right REAL NOT NULL,

blood_pressure INTEGER 
NOT NULL,
smoking INTEGER NOT NULL,
is_drinking BOOLEAN NOT NULL
);
```

# 문제
- [2022.08.16 실습 문제](#-20220816-실습-문제)
  - SELECT문, WHERE, LIMIT/OFFSET, DISTINCT 활용
- [2022.08.17 실습 문제](#-20220817-실습-문제)
  - SELECT문, 논리 연산자, SQL 연산자, 집계함수, LIKE, ORDER BY 활용
- [2022.08.18 실습 문제](#-20220818-실습-문제)
  - SELECT문, 기본 함수(문자열 함수, 숫자 함수), GROUP BY, HAVING 활용


## 🛠 2022.08.16 실습 문제

### 1. 추가되어 있는 모든 데이터의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare;
```

```
COUNT(*)
--------
1000000
```

### 2. 나이 그룹이 10(age)미만인 사람의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE age < 10;
```

```
COUNT(*)
156277
```

### 3. 성별이 1인 사람의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE gender = 1;
```

```
COUNT(*)
510689
```

### 4. 흡연 수치(smoking)가 3이면서 음주(is_drinking)가 1인 사람의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE smoking = 3 AND is_drinking = 1;
```

```
COUNT(*)
150361
```

### 5. 양쪽 시력이(va_left, va_right) 모두 2.0이상인 사람의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE va_left > 2.0 AND va_right > 2.0;
```

```
COUNT(*)
893
```

### 6. 시도(sido)를 모두 중복 없이 출력하시오.

```sql
SELECT DISTINCT sido FROM healthcare;
```

```
sido
36
27
11
31
41
44
48
30
42
43
46
28
26
47
45
29
49
```

### 7. 자유롭게 조합해서 원하는 데이터를 출력해보세요.

> 허리 둘레(waist)가 44 이상이면서 몸무게(weight)가 50이하인 사람의 수 출력

```sql
SELECT COUNT(*) FROM healthcare WHERE waist >= 44 AND weight <= 50;
```

```
COUNT(*)
204247
```

### 8. 자유롭게 조합해서 원하는 데이터를 출력해보세요.

> 혈압(blood_pressure)이 120 이하인 사람의 수 출력

```sql
SELECT COUNT(*) FROM healthcare WHERE blood_pressure <= 120;
``` 

```
COUNT(*)
423239
```

### 9. 자유롭게 조합해서 원하는 데이터를 출력해보세요.

> 5명의 BMI, weight, height 출력

```sql
SELECT weight*10000/(height*height) AS BMI, weight, height FROM healthcare LIMIT 5;
``` 

```
BMI  weight  height
---  ------  ------
22   60      165
28   65      150
22   55      155
27   70      160
20   50      155
```

### 10. 자유롭게 조합해서 원하는 데이터를 출력해보세요.

> smoking 수치 출력

```sql
SELECT DISTINCT smoking FROM healthcare;
```

```
smoking
-------
1
3
2
```

## 🛠 2022.08.17 실습 문제

### 1. 연령 코드(age)의 최대, 최소 값을 모두 출력하시오. 

```sql
SELECT MAX(age) FROM healthcare;
SELECT MIN(age) FROM healthcare;
```

```
MAX(age)
--------
18

MIN(age)
--------
9
```

### 2. 신장(height)과 체중(weight)의 최대, 최소 값을 모두 출력하시오.

```sql
SELECT MAX(height), MIN(height), MAX(weight), MIN(weight) FROM healthcare;
```

```
MAX(height)  MIN(height)  MAX(weight)  MIN(weight)
-----------  -----------  -----------  -----------
195          130          135          30
```

### 3. 신장(height)이 160이상 170이하인 사람은 몇 명인지 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE 160 <= height <= 170;
SELECT COUNT(*) FROM healthcare WHERE 160 <= height AND height <= 170;
SELECT COUNT(*) FROM healthcare WHERE height BETWEEN 160 AND 170;
```

```
COUNT(*)
--------
1000000
↳ 첫 번째 조건식은 올바른 조건식이 아님

COUNT(*)
--------
516930

COUNT(*)
--------
516930
```

### 4. 음주(is_drinking)를 하는 사람(1)의 허리 둘레(waist)를 높은 순으로 5명 출력하시오. 

```sql
SELECT id, age, waist FROM healthcare WHERE is_drinking=1 AND NOT waist='' ORDER BY waist DESC LIMIT 5;
```

```
id      age  waist
------  ---  -----
993531  9    146.0
87897   10   142.0
826643  9    141.4
567314  11   140.0
611146  12   140.0
```

### 5. 시력 양쪽(va_left, va_right)이 1.5이상이면서 음주(is_drinking)를 하는 사람의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE va_left >= 1.5 AND va_right >= 1.5 AND is_drinking=1;
```

```
COUNT(*)
--------
36697
```

### 6. 혈압(blood_pressure)이 정상 범위(120미만)인 사람의 수를 출력하시오.

```sql
SELECT COUNT(*) FROM healthcare WHERE blood_pressure < 120;
```

```
COUNT(*)
--------
360808
```

### 7. 혈압(blood_pressure)이 140이상인 사람들의 평균 허리둘레(waist)를 출력하시오.

```sql
SELECT AVG(waist) FROM healthcare WHERE blood_pressure >= 140;
```

```
AVG(waist)
----------------
85.8665098512525
```

### 8. 성별(gender)이 1인 사람의 평균 키(height)와 평균 몸무게(weight)를 출력하시오.

```sql
SELECT AVG(height), AVG(weight) FROM healthcare WHERE gender=1;
```

```
AVG(height)       AVG(weight)
----------------  ----------------
167.452735422145  69.7131620222875
```

### 9. 키가 가장 큰 사람 중에 두번째로 무거운 사람의 id와 키(height), 몸무게(weight)를 출력하시오.

```sql
SELECT id, height, weight FROM healthcare ORDER BY height DESC, weight DESC LIMIT 1 OFFSET 1;
```

```
id      height  weight
------  ------  ------
836005  195     110
```

### 10. BMI가 30이상인 사람의 수를 출력하시오. 

> BMI는 체중/(키*키)의 계산 결과이다. 
> 키는 미터 단위로 계산한다.

```sql
SELECT COUNT(*) FROM healthcare WHERE weight / (height * height * 0.0001) >= 30;
```

```
COUNT(*)
--------
53121
```

### 11. 흡연(smoking)이 3인 사람의 BMI지수가 제일 높은 사람 순서대로 5명의 id와 BMI를 출력하시오.

> BMI는 체중/(키*키)의 계산 결과이다. 
> 키는 미터 단위로 계산한다.

```sql
SELECT id, weight / (height * height * 0.0001) AS BMI FROM healthcare WHERE smoking=3 ORDER BY weight / (height * height * 0.0001) DESC LIMIT 5;
```

```
id      BMI
------  ----------------
231431  50.78125
934714  49.9479708636837
722707  48.828125
947281  47.7502295684114
948801  47.7502295684114
```

### 12. 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유해주세요.
> 시도(sido)가 11이거나 30이거나 42인 사람의 10명 조회

```sql
SELECT id, sido FROM healthcare WHERE sido IN (11, 30, 42) LIMIT 10;
```

```
id  sido
--  ----
3   11
15  11
17  30
21  42
27  42
28  11
34  30
37  11
42  11
43  11
```

### 13. 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유해주세요.
> 술(1)담배(3) 모두 하는 사람의 혈압 평균과 술(0)담배(1) 모두 안하는 사람의 혈압 평균 비교

```sql
SELECT AVG(blood_pressure) FROM healthcare WHERE is_drinking=1 AND smoking=3;
SELECT AVG(blood_pressure) FROM healthcare WHERE is_drinking=0 AND smoking=1;
```

```
AVG(blood_pressure)
-------------------
125.151076409441

AVG(blood_pressure)
-------------------
123.421820548472
```

### 14. 자유롭게 쿼리를 작성해주시고, 결과와 함께 공유해주세요.
> 양쪽 시력이 1.5 이상인 사람 중에 왼쪽과 오른쪽 시력차가 작고 나이가 5번째로 큰 사람의 id, 왼쪽 시력, 오른쪽 시력, 시력차, 나이 조회

```sql
SELECT id, va_left, va_right, ABS(va_left - va_right) AS diff, age FROM healthcare WHERE va_left >= 1.5 AND va_right >= 1.5 AND NOT(va_left='' OR va_right='') ORDER BY ABS(va_left - va_right) ASC, age DESC LIMIT 1 OFFSET 4;
```

```
id      va_left  va_right  diff  age
------  -------  --------  ----  ---
113182  9.9      9.9       0.0   18
```

## 🛠 2022.08.18 실습 문제

###  1. 흡연 여부(smoking)로 구분한 각 그룹의 컬렴명과 그룹의 사람의 수를 출력하시오.

```sql 
SELECT smoking, COUNT(*) FROM healthcare GROUP BY smoking;
```

```
smoking  COUNT(*)
-------  --------
1        626138
2        189808
3        183711
         343
``` 

###  2. 음주 여부(is_drinking)로 구분한 각 그룹의 컬렴명과 그룹의 사람의 수를 출력하시오.

```sql 
SELECT is_drinking, COUNT(*) FROM healthcare GROUP BY is_drinking;
```

```
is_drinking  COUNT(*)
-----------  --------
0            415119
1            584685
             196
```

### 3. 음주 여부로 구분한 각 그룹에서 혈압(blood_pressure)이 200이상인 사람의 수를 출력하시오.

```sql
SELECT is_drinking, COUNT(*) FROM healthcare WHERE blood_pressure >= 200 AND blood_pressure <> '' GROUP BY is_drinking;
```

```
is_drinking  COUNT(*)
-----------  --------
0            128
1            174
```

### 4. 시도(sido)에 사는 사람의 수가 50000명 이상인 시도의 코드와 그 시도에 사는 사람의 수를 출력하시오.

```sql
SELECT sido, COUNT(*) FROM healthcare GROUP BY sido HAVING COUNT(*) >= 50000;
```

```
sido  COUNT(*)
----  --------
11    166231
26    69025
28    58345
41    247369
47    54438
48    68530
```

### 5. 키(height)를 기준으로 구분하고, 각 키와 사람의 수를 출력하시오.

> 단, 사람의 수를 기준으로 내림차순으로 5개까지 출력하시오.

```sql
SELECT height, COUNT(*) FROM healthcare GROUP BY height ORDER BY COUNT(*) DESC LIMIT 5;
```

```
height  COUNT(*)
------  --------
160     184993
155     181306
165     179352
170     152585
150     128555
```

### 6. 키(height)와 몸무게(weight)를 기준으로 구분하고, 몸무게와, 키, 해당 그룹의 사람의 수를 출력하시오. 

> 단, 사람의 수를 기준으로 내림차순 5개까지 출력하시오.

```sql
SELECT height, weight, COUNT(*) FROM healthcare GROUP BY height, weight ORDER BY COUNT(*) DESC LIMIT 5;
```

```
height  weight  COUNT(*)
------  ------  --------
155     55      45866
160     60      42454
165     65      40385
155     50      38582
160     55      38066
```

### 7. 음주여부에 따라 평균 허리둘레(waist)와 사람의 수를 출력하시오.

```sql 
SELECT is_drinking, AVG(waist), COUNT(*) FROM healthcare GROUP BY is_drinking;
``` 

```
is_drinking  AVG(waist)        COUNT(*)
-----------  ----------------  --------
0            81.2128249971711  415119
1            83.1541594191841  584685
             82.7714285714286  196
```

### 8. 각 성별(gender)의 평균 왼쪽 시력(va_left)과 평균 오른쪽 시력(va_right)를 출력하시오.

> 단, 평균 왼쪽 시력과 평균 오른쪽 시력의 컬럼명을 '평균 왼쪽 시력' '평균 오른쪽 시력'로 표시하고, 평균 시력은 소수점 둘째 자리까지 출력하시오.

```sql
SELECT gender, ROUND(AVG(va_left), 2) AS '평균 왼쪽 시력', ROUND(AVG(va_right), 2) AS '평균 오른쪽 시력' FROM healthcare GROUP BY gender;
```

```
gender  평균 왼쪽 시력  평균 오른쪽 시력
------  --------  ---------
1       0.98      0.99
2       0.88      0.88
```

### 9. 각 나이대(age)의 평균 키와 평균 몸무게를 출력하시오.

> 단, 평균 키와 평균 몸무게의 컬럼명을 '평균 키' '평균 몸무게'로 표시하고, 평균키가 160 이상 평균 몸무게가 60 이상인 데이터만 출력하시오.

```sql
SELECT age, AVG(height) AS '평균 키', AVG(weight) AS '평균 몸무게' FROM healthcare GROUP BY age HAVING AVG(height) >= 160 AND AVG(weight) >= 60;

SELECT age, AVG(height) AS '평균 키', AVG(weight) AS '평균 몸무게' FROM healthcare GROUP BY age HAVING '평균 키' >= 160 AND '평균 몸무게' >= 60;

SELECT age, AVG(height) AS "평균 키", AVG(weight) AS "평균 몸무게" FROM healthcare GROUP BY age HAVING "평균 키" >= 160 AND "평균 몸무게" >= 60;
```

```
age  평균 키              평균 몸무게
---  ----------------  ----------------
9    165.66545300972   67.2402208898302
10   164.119689244962  65.677140776194
11   162.111550610398  63.9036737713782
12   160.653006214415  62.5955563062588

age  평균 키              평균 몸무게
---  ----------------  ----------------
9    165.66545300972   67.2402208898302
10   164.119689244962  65.677140776194
11   162.111550610398  63.9036737713782
12   160.653006214415  62.5955563062588
13   159.12821736215   61.5041974003198
14   157.81034701626   60.7892975430741
15   156.577040996283  59.7307838402474
16   154.966042058751  58.0255298257098
17   153.267381735823  55.8414170334601
18   150.440115440115  51.0261343594677
↳ 별칭 지정 시, 큰 따옴표가 아닌 작은 따옴표를 사용하면 HAVING절에서 인식하지 못함

age  평균 키              평균 몸무게
---  ----------------  ----------------
9    165.66545300972   67.2402208898302
10   164.119689244962  65.677140776194
11   162.111550610398  63.9036737713782
12   160.653006214415  62.5955563062588
```

### 10. 음주 여부(is_drinking)와 흡연 여부(smoking)에 따른 평균 BMI를 출력하시오.

> 단, 음주 여부 또는 흡연 여부가 공백이 아닌 행만 사용하세요.

```sql
SELECT is_drinking, smoking, AVG(weight / (height * height * 0.0001)) AS BMI FROM healthcare WHERE is_drinking <> '' AND smoking <> '' GROUP BY is_drinking, smoking;
```

```
is_drinking  smoking  BMI
-----------  -------  ----------------
0            1        23.8724603942955
0            2        24.6073677352564
0            3        24.3193273448558
1            1        23.9341328992508
1            2        25.0333550564281
1            3        24.6363247421328
```