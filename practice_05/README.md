# [KDT] DB - ORM(Object Relational Mapping) 실습

## 🎯 목표
* ORM 이해
* Django Model 이해
* Django Queryset 이해
* 테이블 간 관계에 대한 이해와 Django에서의 관계 표현 방법

## 🔥 실습과정
1. [실습 환경 설정 및 실행 명령어](#-실습-환경-설정)
2. [2022.08.24 실습 내용](#-20220824-실습)
3. [2022.08.25 실습 내용](#-20220825-실습)

## ⚙ 실습 환경 설정
| 아래 명령어는 모두 터미널에서 수행해주세요.
### 가상환경

* 생성
    ```bash
    python -m venv venv
    ```

* 실행
    * windows
        ```bash
        . venv/Scripts/activate
        ```
    * mac
        ```zsh
        . venv/bin/activate
        ```

* 확인
    * 실행 전
    <img src="./assets/실행전.png">

    * 실행 후, `경로 위 혹은 왼쪽에 가상환경 이름 출력`
    <img src="./assets/실행후.png">

* 종료
    ```bash
    deactivate
    ```
    
### 패키지 설치
| 아래의 모든 명령어는 가상환경을 실행한 상태로 진행하세요. 
* 가상환경 실행
   * windows
        ```bash
        . venv/Scripts/activate
        ```
    * mac
        ```zsh
        . venv/bin/activate
        ```
* pip install
    ```bash
    pip install -r requirements.txt 
    ```

* django 패키지 설치 확인
    ```bash
    python manage.py --version
    # 4.0.6
    ```

### 모델 마이그레이션
```bash
python manage.py makemigrations

python manage.py migrate
```

### django shell
* shell 진입
    ```bash
    python manage.py shell_plus
    ```

* 진입 확인
<img src="./assets/shell.png">


### 파일 실행
| 파일을 실행할 때에는 가상환경을 실행한 상태인지 꼭 확인합니다.
```bash
python main.py
```


## License
The MIT License (MIT) Copyright (c) 2022 Dan Caron

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## 🛠 2022.08.24 실습

<aside>
💡 코드를 작성한 실습 파일을 압축해서 실라버스에 제출해주세요.
</aside>

### 1. `db/models.py` 파일에 아래의 모델 2개 `Director`, `Genre` 를 작성하세요.

> 기본 코드

```python
class Director(models.Model):
    name = models.TextField()
    debut = models.DateTimeField()
    country = models.TextField()

class Genre(models.Model):
    title = models.TextField()
```

### 2. 모델을 마이그레이트(migrate) 하세요.

```bash
# 가상환경 실행 확인 후 아래 명령어를 터미널에 입력합니다.
python manage.py makemigrations

python manage.py migrate
```

### 3. Queryset 메소드 `create` 를 활용해서  `Director` 테이블에 아래 데이터를 추가하는 코드를 작성하세요.

| name | debut | country |
| --- | --- | --- |
| 봉준호 | 1993-01-01 | KOR |
| 김한민 | 1999-01-01 | KOR |
| 최동훈 | 2004-01-01 | KOR |
| 이정재 | 2022-01-01 | KOR |
| 이경규 | 1992-01-01 | KOR |
| 한재림 | 2005-01-01 | KOR |
| Joseph Kosinski | 1999-01-01 | KOR |
| 김철수 | 2022-01-01 | KOR |

> 코드 작성

```python
# Director 테이블에 추가할 데이터 (순서대로 name, debut, contry)
data = [
    ('봉준호', '1993-01-01', 'KOR'), 
    ('김한민', '1999-01-01', 'KOR'),
    ('최동훈', '2004-01-01', 'KOR'),
    ('이정재', '2022-01-01', 'KOR'),
    ('이경규', '1992-01-01', 'KOR'),
    ('한재림', '2005-01-01', 'KOR'),
    ('Joseph Kosinski', '1999-01-01', 'KOR'),
    ('김철수', '2022-01-01', 'KOR')
]

# Director 테이블에 데이터 삽입(Create)
for name_, debut_, country_ in data:
    Director.objects.create(name=name_, debut=debut_, country=country_)
```

### 4. `인스턴스 조작` 을 활용하여`Genre` 테이블에 아래 데이터를 추가하는 코드를 작성하세요.

| title |
| --- |
| 액션 |
| 드라마 |
| 사극 |
| 범죄 |
| 스릴러 |
| SF |
| 무협 |
| 첩보 |
| 재난 |

> 코드 작성

```python
# Genre 테이블에 추가할 데이터
data = ['액션', '드라마', '사극', '범죄', '스릴러', 'SF', '무협', '첩보', '재난']

# Genre 테이블에 데이터 삽입(Create)
for title_ in data:
    Genre.objects.create(title=title_)
```

### 5. Queryset 메소드 `all` 을 활용해서 `Director` 테이블의 모든 데이터를 출력하는 코드를 작성하세요.

> 출력 예시
> 

```
봉준호 1993-01-01 00:00:00 KOR
김한민 1999-01-01 00:00:00 KOR
최동훈 2004-01-01 00:00:00 KOR
이정재 2022-01-01 00:00:00 KOR
이경규 1992-01-01 00:00:00 KOR
한재림 2005-01-01 00:00:00 KOR
Joseph Kosinski 1999-01-01 00:00:00 KOR
김철수 2022-01-01 00:00:00 KOR
```

> 코드 작성

```python
datas = Director.objects.all()

for data in datas:
    print(data.name, data.debut, data.country)
```

### 6. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `id` 가 1인 데이터를 출력하는 코드를 작성하세요.

> 출력 예시

```
봉준호 1993-01-01 00:00:00 KOR
```

> 코드 작성

```python
data = Director.objects.get(id=1)
print(data.name, data.debut, data.country)
```

### 7. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `country` 가 USA인 데이터를 출력하는 코드를 작성하세요.

> 코드 작성

```python
data = Director.objects.get(country='USA')
```

### 8. 위 문제에서 오류가 발생합니다. 출력된 오류 메세지와 본인이 생각하는 혹은 찾은 오류가 발생한 이유를 작성하세요.

> 오류 메세지

```bash
DoesNotExist: Director matching query does not exist.
```

> 이유 작성

```
get() 메서드의 결과로서 반환되는 값이 없기 때문에 오류 발생함
```

### 9. Queryset 메소드 `get` 과 `save` 를 활용해서 `Director` 테이블에서  `name` 이 Joseph Kosinski인 데이터를 조회해서 `country` 를 USA 로 수정하고, 출력하는 코드를 작성하세요.

> 출력 예시

```
Joseph Kosinski 1999-01-01 00:00:00 USA
```

> 코드 작성

```python
data = Director.objects.get(name='Joseph Kosinski')
data.country = 'USA'
data.save()
```

### 10. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `country` 가 KOR인 데이터를 출력하는 코드를 작성하세요.

> 코드 작성

```python
datas = Director.objects.get(country='KOR')

for data in datas:
    print(data.name, data.debut, data.country)
```

### 11. 위 문제에서 오류가 발생합니다. 출력된 오류 메세지와 본인이 생각하는 혹은 찾은 오류가 발생한 이유를 작성하세요.

> 오류 메세지

```bash
MultipleObjectsReturned: get() returned more than one Director -- it returned 7!
```

> 이유 작성

```
get() 메서드가 2개 이상의 object를 반환하려고 했기 때문에 오류 발생
```

### 12. Queryset 메소드 `filter` 를 활용해서 `Director` 테이블에서 `country` 가 KOR인 데이터를 출력하는 코드를 작성하세요.

> 출력 예시

```
봉준호 1993-01-01 00:00:00 KOR
김한민 1999-01-01 00:00:00 KOR
최동훈 2004-01-01 00:00:00 KOR
이정재 2022-01-01 00:00:00 KOR
이경규 1992-01-01 00:00:00 KOR
한재림 2005-01-01 00:00:00 KOR
김철수 2022-01-01 00:00:00 KOR
```

> 코드 작성

```python
datas = Director.objects.filter(country='KOR')

for data in datas:
    print(data.name, data.debut, data.country)
```

### 13. 본인이 생각하는 혹은 찾은 `get` 과 `filter` 의 차이를 작성하세요.

```
get() 메서드는 없거나 2개 이상의 값이 반환될 때 오류를 발생한다.
값이 없거나 2개 이상의 값을 반환하기 위해서는 get()이 아닌 filter() 메서드를 사용하면 QuerySet 형태로 여러 개의 값을 반환가능하다.
```

### 14. Queryset 메소드 `get` 과 `delete`를 활용해서  `Director` 테이블에서 `name` 이 김철수인 데이터를 삭제하는 코드를 작성하세요.

> 코드 작성

```python
data = Director.objects.filter(name='김철수')
data[0].delete()
```


## 🛠 2022.08.25 실습

### 1. `db/models.py` 파일에 아래의 모델 3개 `Director` `Genre` `Movie` 를 작성하세요.

> 기본 코드

```python
class Director(models.Model):
    name = models.TextField()
    debut = models.DateTimeField()
    country = models.TextField()

class Genre(models.Model):
    title = models.TextField()

class Movie(models.Model):
    director = models.ForeignKey(Director,on_delete=models.CASCADE)
    genre = models.ForeignKey(Genre,on_delete=models.CASCADE)
    title = models.TextField()
    opening_date = models.DateField()
    running_time = models.IntegerField()
    screening = models.BooleanField()
```

### 2. 모델을 마이그레이트(migrate) 하세요.

```bash
# 가상환경 실행 확인 후 아래 명령어를 터미널에 입력합니다.
python manage.py makemigrations

python manage.py migrate
```

### 3. 아래 코드를 실행해서 데이터를 추가하세요.

```python
directors = [
    ("봉준호","1993-01-01","KOR"),
    ("김한민","1999-01-01","KOR"),
    ("최동훈","2004-01-01","KOR"),
    ("이정재","2022-01-01","KOR"),
    ("이경규","1992-01-01","KOR"),
    ("한재림","2005-01-01","KOR"),
    ("Joseph Kosinski","1999-01-01","KOR"),
    ("김철수","2022-01-01","KOR"),
]

for director in directors:
    name_ = director[0]
    debut_ = director[1]
    country_ = director[2]
    Director.objects.create(name=name_, debut=debut_, country=country_)

genres = ["액션","드라마","사극","범죄","스릴러","SF","무협","첩보","재난"]

for title_ in genres:
    genre = Genre()
    genre.title = title_
    genre.save()
```

### 4. Queryset 메소드 `get` 을 활용해서 `Director` 테이블에서 `name` 이 봉준호인 데이터를 아래와 같이 출력하는 코드를 작성하세요.

> 출력 예시

```
id : 1
name : 봉준호
debut : 1993-01-01 00:00:00
country : KOR
```

> 코드 작성

```python
director = Director.objects.get(name='봉준호')

print(f'id: {director.id}')
print(f'name: {director.name}')
print(f'debut: {director.debut}')
print(f'country: {director.country}')
```

### 5. Queryset 메소드 `get` 을 활용해서 `Genre` 테이블에서 `title` 이 드라마인 데이터를 아래와 같이 출력하는 코드를 작성하세요.

> 출력 예시

```
id : 2
title : 드라마
```

> 코드 작성

```python
genre = Genre.objects.get(title='드라마')

print(f'id: {genre.id}')
print(f'title: {genre.title}')
```

### 6. 위 문제에서 찾은 `director` 와 `genre` 와 아래 `힌트 코드`를 활용해서 `Movie` 테이블에 아래 데이터를 추가하는 코드를 작성하세요.

| director | genre | title | opening_date | running_time | screening |
| --- | --- | --- | --- | --- | --- |
| 봉준호 | 드라마 | 기생충 | 2019-05-30 | 132 | False |

> 힌트 코드

```python
director_ = Director.objects.get(name='봉준호')
genre_ = Genre.objects.get(title='드라마')

movie = Movie()

# 나머지 코드를 완성시켜주세요.
# ...
# ...

movie.save()
```

> 코드 작성

```python
director_ = Director.objects.get(name='봉준호')
genre_ = Genre.objects.get(title='드라마')

movie = Movie()

movie.director = director_
movie.genre = genre_
movie.title = '기생충'
movie.opening_date = '2019-05-30'
movie.running_time = 132
movie.screening = False

movie.save()
```

### 7. `Movie` 테이블에 아래 데이터를 추가하는 코드를 작성하세요.

| director | genre | title | opening_date | running_time | screening |
| --- | --- | --- | --- | --- | --- |
| 봉준호 | 드라마 | 괴물 | 2006-07-27 | 119 | False |
| 봉준호 | SF | 설국열차 | 2013-10-30 | 125 | False |
| 김한민 | 사극 | 한산 | 2022-07-27 | 129 | True |
| 최동훈 | SF | 외계+인 | 2022-07-20 | 142 | False |
| 이정재 | 첩보 | 헌트 | 2022-08-10 | 125 | True |
| 이경규 | 액션 | 복수혈전 | 1992-10-10 | 88 | False |
| 한재림 | 재난 | 비상선언 | 2022-08-03 | 140 | True |
| Joseph Kosinski | 액션 | 탑건 : 매버릭 | 2022-06-22 | 130 | True |

```python
movies = [
    ("봉준호", "드라마", "괴물", "2006-07-27", 119, False),
    ("봉준호", "SF", "설국열차", "2013-10-30", 125, False),
    ("김한민", "사극", "한산", "2022-07-27", 129, True),
    ("최동훈", "SF", "외계+인", "2022-07-20", 142, False),
    ("이정재", "첩보", "헌트", "2022-08-10", 125, True),
    ("이경규", "액션", "복수혈전", "1992-10-10", 88, False),
    ("한재림", "재난", "비상선언", "2022-08-03", 140, True),
    ("Joseph Kosinski", "액션", "탑건 : 매버릭", "2022-06-22", 130, True)
]
```

> 코드 작성

```python
for director_, genre_, title_, opening_date_, running_time_, screening_ in movies:
    # 새로운 인스턴스 생성
    movie = Movie()   

    # movie 테이블에 데이터 삽입
    movie.director = Director.objects.get(name=director_)   # 객체로 저장
    movie.genre = Genre.objects.get(title=genre_)   # 객체로 저장
    movie.title = title_
    movie.opening_date = opening_date_
    movie.running_time = running_time_
    movie.screening = screening_

    movie.save()
```

### 8. `Movie` 테이블의 모든 데이터를 출력하는 코드를 작성하세요.

> 예시 출력
> 

```
Director object (1) Genre object (2) 기생충 2019-05-30 132 False
Director object (1) Genre object (2) 괴물 2006-07-27 119 False
Director object (1) Genre object (6) 설국열차 2013-10-30 125 False
Director object (2) Genre object (3) 한산 2022-07-27 129 True
Director object (3) Genre object (6) 외계+인 2022-07-20 142 False
Director object (4) Genre object (8) 헌트 2022-08-10 125 True
Director object (5) Genre object (1) 복수혈전 1992-10-10 88 False
Director object (6) Genre object (9) 비상선언 2022-08-03 140 True
Director object (7) Genre object (1) 탑건 : 매버릭 2022-06-22 130 True
```

> 코드 작성

```python
movies = Movie.objects.all()
for movie in movies:
    print(movie.director, movie.genre, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 9. 위 문제에서 조회한 `Director object (n)`  를 활용해서 각 영화의 감독 `name` 을 조회해서 대신 출력하는 코드를 작성하세요.

> 힌트 : 각각의 Director object (n)는 Director 모델의 인스턴스입니다.
> 

> 예시 출력

```
봉준호 Genre object (2) 기생충 2019-05-30 132 False
봉준호 Genre object (2) 괴물 2006-07-27 119 False
봉준호 Genre object (6) 설국열차 2013-10-30 125 False
김한민 Genre object (3) 한산 2022-07-27 129 True
최동훈 Genre object (6) 외계+인 2022-07-20 142 False
이정재 Genre object (8) 헌트 2022-08-10 125 True
이경규 Genre object (1) 복수혈전 1992-10-10 88 False
한재림 Genre object (9) 비상선언 2022-08-03 140 True
Joseph Kosinski Genre object (1) 탑건 : 매버릭 2022-06-22 130 True
```

> 코드 작성

```python
movies = Movie.objects.all()
for movie in movies:
    print(movie.director.name, movie.genre, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 10. 위 문제에서 조회한 `Genre object (n)`  를 활용해서 각 영화의 장르 `title` 을 조회해서 대신 출력하는 코드를 작성하세요.

> 힌트 : 각각의 Genre object (n)는 Genre 모델의 인스턴스입니다.

> 예시 출력

```
봉준호 드라마 기생충 2019-05-30 132 False
봉준호 드라마 괴물 2006-07-27 119 False
봉준호 SF 설국열차 2013-10-30 125 False
김한민 사극 한산 2022-07-27 129 True
최동훈 SF 외계+인 2022-07-20 142 False
이정재 첩보 헌트 2022-08-10 125 True
이경규 액션 복수혈전 1992-10-10 88 False
한재림 재난 비상선언 2022-08-03 140 True
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
```

> 코드 작성

```python
movies = Movie.objects.all()
for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 11. 영화 데이터들을 `최신 개봉한 영화순`으로 조회해서 출력하는 코드를 작성하세요.

> 예시 출력

```
이정재 첩보 헌트 2022-08-10 125 True
한재림 재난 비상선언 2022-08-03 140 True
김한민 사극 한산 2022-07-27 129 True
최동훈 SF 외계+인 2022-07-20 142 False
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
봉준호 드라마 기생충 2019-05-30 132 False
봉준호 SF 설국열차 2013-10-30 125 False
봉준호 드라마 괴물 2006-07-27 119 False
이경규 액션 복수혈전 1992-10-10 88 False
```

> 코드 작성

```python
# 최신 개봉한 영화 순서 = 내림차순 정렬
movies = Movie.objects.order_by('-opening_date')
for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 12. 영화 데이터 중 `가장 먼저 개봉한` 영화를 조회해서 출력하는 코드를 작성하세요.

> 예시 출력

```
이경규 액션 복수혈전 1992-10-10 88 False
```

> 코드 작성

```python
# 가장 먼저 개봉한 영화 = 오름차순으로 정렬했을 때 가장 처음에 오는 데이터
movie = Movie.objects.order_by('opening_date')[0]

print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 13. 영화 데이터 중 현재 `상영 중`인 영화들을 `개봉일 순`으로 조회해서 출력하는 코드를 작성하세요.

> 상영 중 `screening = True`

> 예시 출력

```
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
김한민 사극 한산 2022-07-27 129 True
한재림 재난 비상선언 2022-08-03 140 True
이정재 첩보 헌트 2022-08-10 125 True
```

> 코드 작성

```python
movies = Movie.objects.filter(screening=True).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 14. 영화 감독이 `봉준호` 인 영화들을 `개봉일 순`으로 조회해서 출력하는 코드를 작성하세요.

> 힌트 : `name`이 봉준호인 Director의 인스턴스가 필요합니다.

> 예시 출력

```
봉준호 드라마 괴물 2006-07-27 119 False
봉준호 SF 설국열차 2013-10-30 125 False
봉준호 드라마 기생충 2019-05-30 132 False
```

> 코드 작성

```python
# 방법 1
movies = Movie.objects.filter(director=Director.objects.get(name='봉준호')).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)


# 방법 2
director_bong = Director.objects.get(name='봉준호')
movies = Movie.objects.filter(director=director_bong).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)


# 방법 3
director_bong = Director.objects.get(name='봉준호')
movies = director_bong.movie_set.all().order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 15. `봉준호` 감독 영화 중 두 번째로 개봉한 영화를 조회해서 출력하는 코드를 작성하세요.

> 예시 출력

```
봉준호 SF 설국열차 2013-10-30 125 False
```

> 코드 작성

```python
director_bong = Director.objects.get(name='봉준호')
movie = director_bong.movie_set.all().order_by('opening_date')[1]

print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 16. 영화의 상영 시간 `running_time` 이 119 보다 `큰` 영화들을 상영 시간순으로 조회해서 출력하는 코드를 작성하세요.

> 예시 출력

```
봉준호 SF 설국열차 2013-10-30 125 False
이정재 첩보 헌트 2022-08-10 125 True
김한민 사극 한산 2022-07-27 129 True
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
봉준호 드라마 기생충 2019-05-30 132 False
한재림 재난 비상선언 2022-08-03 140 True
최동훈 SF 외계+인 2022-07-20 142 False
```

> 코드 작성

```python
movies = Movie.objects.filter(running_time__gt=119).order_by('running_time')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 17. 영화의 상영 시간 `running_time` 이 119 `이상`인 영화들을 상영 시간순으로 조회해서 출력하는 코드를 작성하세요.

> 예시 출력

```
봉준호 드라마 괴물 2006-07-27 119 False
봉준호 SF 설국열차 2013-10-30 125 False
이정재 첩보 헌트 2022-08-10 125 True
김한민 사극 한산 2022-07-27 129 True
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
봉준호 드라마 기생충 2019-05-30 132 False
한재림 재난 비상선언 2022-08-03 140 True
최동훈 SF 외계+인 2022-07-20 142 False
```

> 코드 작성

```python
movies = Movie.objects.filter(running_time__gte=119).order_by('running_time')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 18. `2022-01-01` 이후로 개봉한 영화를 개봉일 순으로 조회해서 출력하는 코드를 작성하세요.

> 예시 출력

```
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
최동훈 SF 외계+인 2022-07-20 142 False
김한민 사극 한산 2022-07-27 129 True
한재림 재난 비상선언 2022-08-03 140 True
이정재 첩보 헌트 2022-08-10 125 True
```

> 코드 작성

```python
movies = Movie.objects.filter(opening_date__gt='2022-01-01').order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 19. 봉준호 감독 영화 중 장르가 드라마인 영화들을 개봉일 순으로 조회해서 출력하는 코드를 작성하세요.

> 힌트 :`Movie.objects.filter(조건1, 조건2,...)` 이 코드는 `WHERE 조건1 AND 조건2` 와 동일합니다.

> 예시 출력

```
봉준호 드라마 괴물 2006-07-27 119 False
봉준호 드라마 기생충 2019-05-30 132 False
```

> 코드 작성

```python
director_bong = Director.objects.get(name='봉준호')
genre_drama = Genre.objects.get(title='드라마')
movies = Movie.objects.filter(director=director_bong, genre=genre_drama).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 20. 봉준호 감독의 영화가 아닌 영화들을 개봉일 순으로 조회해서 출력하는 코드를 작성하세요.

> 힌트 : `filter` 와 반대되는 메소드로 `exclude` 가 있습니다.

> 참고 사이트

[[Django] QuerySet 메소드 정리 (2) - CRUD](https://devvvyang.tistory.com/37)

> 예시 출력

```
이경규 액션 복수혈전 1992-10-10 88 False
Joseph Kosinski 액션 탑건 : 매버릭 2022-06-22 130 True
최동훈 SF 외계+인 2022-07-20 142 False
김한민 사극 한산 2022-07-27 129 True
한재림 재난 비상선언 2022-08-03 140 True
이정재 첩보 헌트 2022-08-10 125 True
```

> 코드 작성 

```python
director_bong = Director.objects.get(name='봉준호')
movies = Movie.objects.exclude(director=director_bong).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```