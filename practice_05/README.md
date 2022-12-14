# [KDT] DB - ORM(Object Relational Mapping) μ€μ΅

## π― λͺ©ν
* ORM μ΄ν΄
* Django Model μ΄ν΄
* Django Queryset μ΄ν΄
* νμ΄λΈ κ° κ΄κ³μ λν μ΄ν΄μ Djangoμμμ κ΄κ³ νν λ°©λ²

## π₯ μ€μ΅κ³Όμ 
1. [μ€μ΅ νκ²½ μ€μ  λ° μ€ν λͺλ Ήμ΄](#-μ€μ΅-νκ²½-μ€μ )
2. [2022.08.24 μ€μ΅ λ΄μ©](#-20220824-μ€μ΅)
3. [2022.08.25 μ€μ΅ λ΄μ©](#-20220825-μ€μ΅)

## β μ€μ΅ νκ²½ μ€μ 
| μλ λͺλ Ήμ΄λ λͺ¨λ ν°λ―Έλμμ μνν΄μ£ΌμΈμ.
### κ°μνκ²½

* μμ±
    ```bash
    python -m venv venv
    ```

* μ€ν
    * windows
        ```bash
        . venv/Scripts/activate
        ```
    * mac
        ```zsh
        . venv/bin/activate
        ```

* νμΈ
    * μ€ν μ 
    <img src="./assets/μ€νμ .png">

    * μ€ν ν, `κ²½λ‘ μ νΉμ μΌμͺ½μ κ°μνκ²½ μ΄λ¦ μΆλ ₯`
    <img src="./assets/μ€νν.png">

* μ’λ£
    ```bash
    deactivate
    ```
    
### ν¨ν€μ§ μ€μΉ
| μλμ λͺ¨λ  λͺλ Ήμ΄λ κ°μνκ²½μ μ€νν μνλ‘ μ§ννμΈμ. 
* κ°μνκ²½ μ€ν
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

* django ν¨ν€μ§ μ€μΉ νμΈ
    ```bash
    python manage.py --version
    # 4.0.6
    ```

### λͺ¨λΈ λ§μ΄κ·Έλ μ΄μ
```bash
python manage.py makemigrations

python manage.py migrate
```

### django shell
* shell μ§μ
    ```bash
    python manage.py shell_plus
    ```

* μ§μ νμΈ
<img src="./assets/shell.png">


### νμΌ μ€ν
| νμΌμ μ€νν  λμλ κ°μνκ²½μ μ€νν μνμΈμ§ κΌ­ νμΈν©λλ€.
```bash
python main.py
```


## License
The MIT License (MIT) Copyright (c) 2022 Dan Caron

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.


## π  2022.08.24 μ€μ΅

<aside>
π‘ μ½λλ₯Ό μμ±ν μ€μ΅ νμΌμ μμΆν΄μ μ€λΌλ²μ€μ μ μΆν΄μ£ΌμΈμ.
</aside>

### 1. `db/models.py` νμΌμ μλμ λͺ¨λΈ 2κ° `Director`, `Genre` λ₯Ό μμ±νμΈμ.

> κΈ°λ³Έ μ½λ

```python
class Director(models.Model):
    name = models.TextField()
    debut = models.DateTimeField()
    country = models.TextField()

class Genre(models.Model):
    title = models.TextField()
```

### 2. λͺ¨λΈμ λ§μ΄κ·Έλ μ΄νΈ(migrate) νμΈμ.

```bash
# κ°μνκ²½ μ€ν νμΈ ν μλ λͺλ Ήμ΄λ₯Ό ν°λ―Έλμ μλ ₯ν©λλ€.
python manage.py makemigrations

python manage.py migrate
```

### 3. Queryset λ©μλ `create` λ₯Ό νμ©ν΄μ  `Director` νμ΄λΈμ μλ λ°μ΄ν°λ₯Ό μΆκ°νλ μ½λλ₯Ό μμ±νμΈμ.

| name | debut | country |
| --- | --- | --- |
| λ΄μ€νΈ | 1993-01-01 | KOR |
| κΉνλ―Ό | 1999-01-01 | KOR |
| μ΅λν | 2004-01-01 | KOR |
| μ΄μ μ¬ | 2022-01-01 | KOR |
| μ΄κ²½κ· | 1992-01-01 | KOR |
| νμ¬λ¦Ό | 2005-01-01 | KOR |
| Joseph Kosinski | 1999-01-01 | KOR |
| κΉμ² μ | 2022-01-01 | KOR |

> μ½λ μμ±

```python
# Director νμ΄λΈμ μΆκ°ν  λ°μ΄ν° (μμλλ‘ name, debut, contry)
data = [
    ('λ΄μ€νΈ', '1993-01-01', 'KOR'), 
    ('κΉνλ―Ό', '1999-01-01', 'KOR'),
    ('μ΅λν', '2004-01-01', 'KOR'),
    ('μ΄μ μ¬', '2022-01-01', 'KOR'),
    ('μ΄κ²½κ·', '1992-01-01', 'KOR'),
    ('νμ¬λ¦Ό', '2005-01-01', 'KOR'),
    ('Joseph Kosinski', '1999-01-01', 'KOR'),
    ('κΉμ² μ', '2022-01-01', 'KOR')
]

# Director νμ΄λΈμ λ°μ΄ν° μ½μ(Create)
for name_, debut_, country_ in data:
    Director.objects.create(name=name_, debut=debut_, country=country_)
```

### 4. `μΈμ€ν΄μ€ μ‘°μ` μ νμ©νμ¬`Genre` νμ΄λΈμ μλ λ°μ΄ν°λ₯Ό μΆκ°νλ μ½λλ₯Ό μμ±νμΈμ.

| title |
| --- |
| μ‘μ |
| λλΌλ§ |
| μ¬κ·Ή |
| λ²μ£ |
| μ€λ¦΄λ¬ |
| SF |
| λ¬΄ν |
| μ²©λ³΄ |
| μ¬λ |

> μ½λ μμ±

```python
# Genre νμ΄λΈμ μΆκ°ν  λ°μ΄ν°
data = ['μ‘μ', 'λλΌλ§', 'μ¬κ·Ή', 'λ²μ£', 'μ€λ¦΄λ¬', 'SF', 'λ¬΄ν', 'μ²©λ³΄', 'μ¬λ']

# Genre νμ΄λΈμ λ°μ΄ν° μ½μ(Create)
for title_ in data:
    Genre.objects.create(title=title_)
```

### 5. Queryset λ©μλ `all` μ νμ©ν΄μ `Director` νμ΄λΈμ λͺ¨λ  λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μΆλ ₯ μμ
> 

```
λ΄μ€νΈ 1993-01-01 00:00:00 KOR
κΉνλ―Ό 1999-01-01 00:00:00 KOR
μ΅λν 2004-01-01 00:00:00 KOR
μ΄μ μ¬ 2022-01-01 00:00:00 KOR
μ΄κ²½κ· 1992-01-01 00:00:00 KOR
νμ¬λ¦Ό 2005-01-01 00:00:00 KOR
Joseph Kosinski 1999-01-01 00:00:00 KOR
κΉμ² μ 2022-01-01 00:00:00 KOR
```

> μ½λ μμ±

```python
datas = Director.objects.all()

for data in datas:
    print(data.name, data.debut, data.country)
```

### 6. Queryset λ©μλ `get` μ νμ©ν΄μ `Director` νμ΄λΈμμ `id` κ° 1μΈ λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μΆλ ₯ μμ

```
λ΄μ€νΈ 1993-01-01 00:00:00 KOR
```

> μ½λ μμ±

```python
data = Director.objects.get(id=1)
print(data.name, data.debut, data.country)
```

### 7. Queryset λ©μλ `get` μ νμ©ν΄μ `Director` νμ΄λΈμμ `country` κ° USAμΈ λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μ½λ μμ±

```python
data = Director.objects.get(country='USA')
```

### 8. μ λ¬Έμ μμ μ€λ₯κ° λ°μν©λλ€. μΆλ ₯λ μ€λ₯ λ©μΈμ§μ λ³ΈμΈμ΄ μκ°νλ νΉμ μ°Ύμ μ€λ₯κ° λ°μν μ΄μ λ₯Ό μμ±νμΈμ.

> μ€λ₯ λ©μΈμ§

```bash
DoesNotExist: Director matching query does not exist.
```

> μ΄μ  μμ±

```
get() λ©μλμ κ²°κ³Όλ‘μ λ°νλλ κ°μ΄ μκΈ° λλ¬Έμ μ€λ₯ λ°μν¨
```

### 9. Queryset λ©μλ `get` κ³Ό `save` λ₯Ό νμ©ν΄μ `Director` νμ΄λΈμμ  `name` μ΄ Joseph KosinskiμΈ λ°μ΄ν°λ₯Ό μ‘°νν΄μ `country` λ₯Ό USA λ‘ μμ νκ³ , μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μΆλ ₯ μμ

```
Joseph Kosinski 1999-01-01 00:00:00 USA
```

> μ½λ μμ±

```python
data = Director.objects.get(name='Joseph Kosinski')
data.country = 'USA'
data.save()
```

### 10. Queryset λ©μλ `get` μ νμ©ν΄μ `Director` νμ΄λΈμμ `country` κ° KORμΈ λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μ½λ μμ±

```python
datas = Director.objects.get(country='KOR')

for data in datas:
    print(data.name, data.debut, data.country)
```

### 11. μ λ¬Έμ μμ μ€λ₯κ° λ°μν©λλ€. μΆλ ₯λ μ€λ₯ λ©μΈμ§μ λ³ΈμΈμ΄ μκ°νλ νΉμ μ°Ύμ μ€λ₯κ° λ°μν μ΄μ λ₯Ό μμ±νμΈμ.

> μ€λ₯ λ©μΈμ§

```bash
MultipleObjectsReturned: get() returned more than one Director -- it returned 7!
```

> μ΄μ  μμ±

```
get() λ©μλκ° 2κ° μ΄μμ objectλ₯Ό λ°ννλ €κ³  νκΈ° λλ¬Έμ μ€λ₯ λ°μ
```

### 12. Queryset λ©μλ `filter` λ₯Ό νμ©ν΄μ `Director` νμ΄λΈμμ `country` κ° KORμΈ λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μΆλ ₯ μμ

```
λ΄μ€νΈ 1993-01-01 00:00:00 KOR
κΉνλ―Ό 1999-01-01 00:00:00 KOR
μ΅λν 2004-01-01 00:00:00 KOR
μ΄μ μ¬ 2022-01-01 00:00:00 KOR
μ΄κ²½κ· 1992-01-01 00:00:00 KOR
νμ¬λ¦Ό 2005-01-01 00:00:00 KOR
κΉμ² μ 2022-01-01 00:00:00 KOR
```

> μ½λ μμ±

```python
datas = Director.objects.filter(country='KOR')

for data in datas:
    print(data.name, data.debut, data.country)
```

### 13. λ³ΈμΈμ΄ μκ°νλ νΉμ μ°Ύμ `get` κ³Ό `filter` μ μ°¨μ΄λ₯Ό μμ±νμΈμ.

```
get() λ©μλλ μκ±°λ 2κ° μ΄μμ κ°μ΄ λ°νλ  λ μ€λ₯λ₯Ό λ°μνλ€.
κ°μ΄ μκ±°λ 2κ° μ΄μμ κ°μ λ°ννκΈ° μν΄μλ get()μ΄ μλ filter() λ©μλλ₯Ό μ¬μ©νλ©΄ QuerySet ννλ‘ μ¬λ¬ κ°μ κ°μ λ°νκ°λ₯νλ€.
```

### 14. Queryset λ©μλ `get` κ³Ό `delete`λ₯Ό νμ©ν΄μ  `Director` νμ΄λΈμμ `name` μ΄ κΉμ² μμΈ λ°μ΄ν°λ₯Ό μ­μ νλ μ½λλ₯Ό μμ±νμΈμ.

> μ½λ μμ±

```python
data = Director.objects.filter(name='κΉμ² μ')
data[0].delete()
```


## π  2022.08.25 μ€μ΅

### 1. `db/models.py` νμΌμ μλμ λͺ¨λΈ 3κ° `Director` `Genre` `Movie` λ₯Ό μμ±νμΈμ.

> κΈ°λ³Έ μ½λ

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

### 2. λͺ¨λΈμ λ§μ΄κ·Έλ μ΄νΈ(migrate) νμΈμ.

```bash
# κ°μνκ²½ μ€ν νμΈ ν μλ λͺλ Ήμ΄λ₯Ό ν°λ―Έλμ μλ ₯ν©λλ€.
python manage.py makemigrations

python manage.py migrate
```

### 3. μλ μ½λλ₯Ό μ€νν΄μ λ°μ΄ν°λ₯Ό μΆκ°νμΈμ.

```python
directors = [
    ("λ΄μ€νΈ","1993-01-01","KOR"),
    ("κΉνλ―Ό","1999-01-01","KOR"),
    ("μ΅λν","2004-01-01","KOR"),
    ("μ΄μ μ¬","2022-01-01","KOR"),
    ("μ΄κ²½κ·","1992-01-01","KOR"),
    ("νμ¬λ¦Ό","2005-01-01","KOR"),
    ("Joseph Kosinski","1999-01-01","KOR"),
    ("κΉμ² μ","2022-01-01","KOR"),
]

for director in directors:
    name_ = director[0]
    debut_ = director[1]
    country_ = director[2]
    Director.objects.create(name=name_, debut=debut_, country=country_)

genres = ["μ‘μ","λλΌλ§","μ¬κ·Ή","λ²μ£","μ€λ¦΄λ¬","SF","λ¬΄ν","μ²©λ³΄","μ¬λ"]

for title_ in genres:
    genre = Genre()
    genre.title = title_
    genre.save()
```

### 4. Queryset λ©μλ `get` μ νμ©ν΄μ `Director` νμ΄λΈμμ `name` μ΄ λ΄μ€νΈμΈ λ°μ΄ν°λ₯Ό μλμ κ°μ΄ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μΆλ ₯ μμ

```
id : 1
name : λ΄μ€νΈ
debut : 1993-01-01 00:00:00
country : KOR
```

> μ½λ μμ±

```python
director = Director.objects.get(name='λ΄μ€νΈ')

print(f'id: {director.id}')
print(f'name: {director.name}')
print(f'debut: {director.debut}')
print(f'country: {director.country}')
```

### 5. Queryset λ©μλ `get` μ νμ©ν΄μ `Genre` νμ΄λΈμμ `title` μ΄ λλΌλ§μΈ λ°μ΄ν°λ₯Ό μλμ κ°μ΄ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μΆλ ₯ μμ

```
id : 2
title : λλΌλ§
```

> μ½λ μμ±

```python
genre = Genre.objects.get(title='λλΌλ§')

print(f'id: {genre.id}')
print(f'title: {genre.title}')
```

### 6. μ λ¬Έμ μμ μ°Ύμ `director` μ `genre` μ μλ `ννΈ μ½λ`λ₯Ό νμ©ν΄μ `Movie` νμ΄λΈμ μλ λ°μ΄ν°λ₯Ό μΆκ°νλ μ½λλ₯Ό μμ±νμΈμ.

| director | genre | title | opening_date | running_time | screening |
| --- | --- | --- | --- | --- | --- |
| λ΄μ€νΈ | λλΌλ§ | κΈ°μμΆ© | 2019-05-30 | 132 | False |

> ννΈ μ½λ

```python
director_ = Director.objects.get(name='λ΄μ€νΈ')
genre_ = Genre.objects.get(title='λλΌλ§')

movie = Movie()

# λλ¨Έμ§ μ½λλ₯Ό μμ±μμΌμ£ΌμΈμ.
# ...
# ...

movie.save()
```

> μ½λ μμ±

```python
director_ = Director.objects.get(name='λ΄μ€νΈ')
genre_ = Genre.objects.get(title='λλΌλ§')

movie = Movie()

movie.director = director_
movie.genre = genre_
movie.title = 'κΈ°μμΆ©'
movie.opening_date = '2019-05-30'
movie.running_time = 132
movie.screening = False

movie.save()
```

### 7. `Movie` νμ΄λΈμ μλ λ°μ΄ν°λ₯Ό μΆκ°νλ μ½λλ₯Ό μμ±νμΈμ.

| director | genre | title | opening_date | running_time | screening |
| --- | --- | --- | --- | --- | --- |
| λ΄μ€νΈ | λλΌλ§ | κ΄΄λ¬Ό | 2006-07-27 | 119 | False |
| λ΄μ€νΈ | SF | μ€κ΅­μ΄μ°¨ | 2013-10-30 | 125 | False |
| κΉνλ―Ό | μ¬κ·Ή | νμ° | 2022-07-27 | 129 | True |
| μ΅λν | SF | μΈκ³+μΈ | 2022-07-20 | 142 | False |
| μ΄μ μ¬ | μ²©λ³΄ | ννΈ | 2022-08-10 | 125 | True |
| μ΄κ²½κ· | μ‘μ | λ³΅μνμ  | 1992-10-10 | 88 | False |
| νμ¬λ¦Ό | μ¬λ | λΉμμ μΈ | 2022-08-03 | 140 | True |
| Joseph Kosinski | μ‘μ | νκ±΄ : λ§€λ²λ¦­ | 2022-06-22 | 130 | True |

```python
movies = [
    ("λ΄μ€νΈ", "λλΌλ§", "κ΄΄λ¬Ό", "2006-07-27", 119, False),
    ("λ΄μ€νΈ", "SF", "μ€κ΅­μ΄μ°¨", "2013-10-30", 125, False),
    ("κΉνλ―Ό", "μ¬κ·Ή", "νμ°", "2022-07-27", 129, True),
    ("μ΅λν", "SF", "μΈκ³+μΈ", "2022-07-20", 142, False),
    ("μ΄μ μ¬", "μ²©λ³΄", "ννΈ", "2022-08-10", 125, True),
    ("μ΄κ²½κ·", "μ‘μ", "λ³΅μνμ ", "1992-10-10", 88, False),
    ("νμ¬λ¦Ό", "μ¬λ", "λΉμμ μΈ", "2022-08-03", 140, True),
    ("Joseph Kosinski", "μ‘μ", "νκ±΄ : λ§€λ²λ¦­", "2022-06-22", 130, True)
]
```

> μ½λ μμ±

```python
for director_, genre_, title_, opening_date_, running_time_, screening_ in movies:
    # μλ‘μ΄ μΈμ€ν΄μ€ μμ±
    movie = Movie()   

    # movie νμ΄λΈμ λ°μ΄ν° μ½μ
    movie.director = Director.objects.get(name=director_)   # κ°μ²΄λ‘ μ μ₯
    movie.genre = Genre.objects.get(title=genre_)   # κ°μ²΄λ‘ μ μ₯
    movie.title = title_
    movie.opening_date = opening_date_
    movie.running_time = running_time_
    movie.screening = screening_

    movie.save()
```

### 8. `Movie` νμ΄λΈμ λͺ¨λ  λ°μ΄ν°λ₯Ό μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯
> 

```
Director object (1) Genre object (2) κΈ°μμΆ© 2019-05-30 132 False
Director object (1) Genre object (2) κ΄΄λ¬Ό 2006-07-27 119 False
Director object (1) Genre object (6) μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
Director object (2) Genre object (3) νμ° 2022-07-27 129 True
Director object (3) Genre object (6) μΈκ³+μΈ 2022-07-20 142 False
Director object (4) Genre object (8) ννΈ 2022-08-10 125 True
Director object (5) Genre object (1) λ³΅μνμ  1992-10-10 88 False
Director object (6) Genre object (9) λΉμμ μΈ 2022-08-03 140 True
Director object (7) Genre object (1) νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
```

> μ½λ μμ±

```python
movies = Movie.objects.all()
for movie in movies:
    print(movie.director, movie.genre, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 9. μ λ¬Έμ μμ μ‘°νν `Director object (n)`  λ₯Ό νμ©ν΄μ κ° μνμ κ°λ `name` μ μ‘°νν΄μ λμ  μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> ννΈ : κ°κ°μ Director object (n)λ Director λͺ¨λΈμ μΈμ€ν΄μ€μλλ€.
> 

> μμ μΆλ ₯

```
λ΄μ€νΈ Genre object (2) κΈ°μμΆ© 2019-05-30 132 False
λ΄μ€νΈ Genre object (2) κ΄΄λ¬Ό 2006-07-27 119 False
λ΄μ€νΈ Genre object (6) μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
κΉνλ―Ό Genre object (3) νμ° 2022-07-27 129 True
μ΅λν Genre object (6) μΈκ³+μΈ 2022-07-20 142 False
μ΄μ μ¬ Genre object (8) ννΈ 2022-08-10 125 True
μ΄κ²½κ· Genre object (1) λ³΅μνμ  1992-10-10 88 False
νμ¬λ¦Ό Genre object (9) λΉμμ μΈ 2022-08-03 140 True
Joseph Kosinski Genre object (1) νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
```

> μ½λ μμ±

```python
movies = Movie.objects.all()
for movie in movies:
    print(movie.director.name, movie.genre, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 10. μ λ¬Έμ μμ μ‘°νν `Genre object (n)`  λ₯Ό νμ©ν΄μ κ° μνμ μ₯λ₯΄ `title` μ μ‘°νν΄μ λμ  μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> ννΈ : κ°κ°μ Genre object (n)λ Genre λͺ¨λΈμ μΈμ€ν΄μ€μλλ€.

> μμ μΆλ ₯

```
λ΄μ€νΈ λλΌλ§ κΈ°μμΆ© 2019-05-30 132 False
λ΄μ€νΈ λλΌλ§ κ΄΄λ¬Ό 2006-07-27 119 False
λ΄μ€νΈ SF μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
μ΅λν SF μΈκ³+μΈ 2022-07-20 142 False
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
μ΄κ²½κ· μ‘μ λ³΅μνμ  1992-10-10 88 False
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
```

> μ½λ μμ±

```python
movies = Movie.objects.all()
for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 11. μν λ°μ΄ν°λ€μ `μ΅μ  κ°λ΄ν μνμ`μΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯

```
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
μ΅λν SF μΈκ³+μΈ 2022-07-20 142 False
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
λ΄μ€νΈ λλΌλ§ κΈ°μμΆ© 2019-05-30 132 False
λ΄μ€νΈ SF μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
λ΄μ€νΈ λλΌλ§ κ΄΄λ¬Ό 2006-07-27 119 False
μ΄κ²½κ· μ‘μ λ³΅μνμ  1992-10-10 88 False
```

> μ½λ μμ±

```python
# μ΅μ  κ°λ΄ν μν μμ = λ΄λ¦Όμ°¨μ μ λ ¬
movies = Movie.objects.order_by('-opening_date')
for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 12. μν λ°μ΄ν° μ€ `κ°μ₯ λ¨Όμ  κ°λ΄ν` μνλ₯Ό μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯

```
μ΄κ²½κ· μ‘μ λ³΅μνμ  1992-10-10 88 False
```

> μ½λ μμ±

```python
# κ°μ₯ λ¨Όμ  κ°λ΄ν μν = μ€λ¦μ°¨μμΌλ‘ μ λ ¬νμ λ κ°μ₯ μ²μμ μ€λ λ°μ΄ν°
movie = Movie.objects.order_by('opening_date')[0]

print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 13. μν λ°μ΄ν° μ€ νμ¬ `μμ μ€`μΈ μνλ€μ `κ°λ΄μΌ μ`μΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μ€ `screening = True`

> μμ μΆλ ₯

```
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
```

> μ½λ μμ±

```python
movies = Movie.objects.filter(screening=True).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 14. μν κ°λμ΄ `λ΄μ€νΈ` μΈ μνλ€μ `κ°λ΄μΌ μ`μΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> ννΈ : `name`μ΄ λ΄μ€νΈμΈ Directorμ μΈμ€ν΄μ€κ° νμν©λλ€.

> μμ μΆλ ₯

```
λ΄μ€νΈ λλΌλ§ κ΄΄λ¬Ό 2006-07-27 119 False
λ΄μ€νΈ SF μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
λ΄μ€νΈ λλΌλ§ κΈ°μμΆ© 2019-05-30 132 False
```

> μ½λ μμ±

```python
# λ°©λ² 1
movies = Movie.objects.filter(director=Director.objects.get(name='λ΄μ€νΈ')).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)


# λ°©λ² 2
director_bong = Director.objects.get(name='λ΄μ€νΈ')
movies = Movie.objects.filter(director=director_bong).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)


# λ°©λ² 3
director_bong = Director.objects.get(name='λ΄μ€νΈ')
movies = director_bong.movie_set.all().order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 15. `λ΄μ€νΈ` κ°λ μν μ€ λ λ²μ§Έλ‘ κ°λ΄ν μνλ₯Ό μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯

```
λ΄μ€νΈ SF μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
```

> μ½λ μμ±

```python
director_bong = Director.objects.get(name='λ΄μ€νΈ')
movie = director_bong.movie_set.all().order_by('opening_date')[1]

print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 16. μνμ μμ μκ° `running_time` μ΄ 119 λ³΄λ€ `ν°` μνλ€μ μμ μκ°μμΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯

```
λ΄μ€νΈ SF μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
λ΄μ€νΈ λλΌλ§ κΈ°μμΆ© 2019-05-30 132 False
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
μ΅λν SF μΈκ³+μΈ 2022-07-20 142 False
```

> μ½λ μμ±

```python
movies = Movie.objects.filter(running_time__gt=119).order_by('running_time')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 17. μνμ μμ μκ° `running_time` μ΄ 119 `μ΄μ`μΈ μνλ€μ μμ μκ°μμΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯

```
λ΄μ€νΈ λλΌλ§ κ΄΄λ¬Ό 2006-07-27 119 False
λ΄μ€νΈ SF μ€κ΅­μ΄μ°¨ 2013-10-30 125 False
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
λ΄μ€νΈ λλΌλ§ κΈ°μμΆ© 2019-05-30 132 False
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
μ΅λν SF μΈκ³+μΈ 2022-07-20 142 False
```

> μ½λ μμ±

```python
movies = Movie.objects.filter(running_time__gte=119).order_by('running_time')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 18. `2022-01-01` μ΄νλ‘ κ°λ΄ν μνλ₯Ό κ°λ΄μΌ μμΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> μμ μΆλ ₯

```
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
μ΅λν SF μΈκ³+μΈ 2022-07-20 142 False
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
```

> μ½λ μμ±

```python
movies = Movie.objects.filter(opening_date__gt='2022-01-01').order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 19. λ΄μ€νΈ κ°λ μν μ€ μ₯λ₯΄κ° λλΌλ§μΈ μνλ€μ κ°λ΄μΌ μμΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> ννΈ :`Movie.objects.filter(μ‘°κ±΄1, μ‘°κ±΄2,...)` μ΄ μ½λλ `WHERE μ‘°κ±΄1 AND μ‘°κ±΄2` μ λμΌν©λλ€.

> μμ μΆλ ₯

```
λ΄μ€νΈ λλΌλ§ κ΄΄λ¬Ό 2006-07-27 119 False
λ΄μ€νΈ λλΌλ§ κΈ°μμΆ© 2019-05-30 132 False
```

> μ½λ μμ±

```python
director_bong = Director.objects.get(name='λ΄μ€νΈ')
genre_drama = Genre.objects.get(title='λλΌλ§')
movies = Movie.objects.filter(director=director_bong, genre=genre_drama).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```

### 20. λ΄μ€νΈ κ°λμ μνκ° μλ μνλ€μ κ°λ΄μΌ μμΌλ‘ μ‘°νν΄μ μΆλ ₯νλ μ½λλ₯Ό μμ±νμΈμ.

> ννΈ : `filter` μ λ°λλλ λ©μλλ‘ `exclude` κ° μμ΅λλ€.

> μ°Έκ³  μ¬μ΄νΈ

[[Django] QuerySet λ©μλ μ λ¦¬ (2) - CRUD](https://devvvyang.tistory.com/37)

> μμ μΆλ ₯

```
μ΄κ²½κ· μ‘μ λ³΅μνμ  1992-10-10 88 False
Joseph Kosinski μ‘μ νκ±΄ : λ§€λ²λ¦­ 2022-06-22 130 True
μ΅λν SF μΈκ³+μΈ 2022-07-20 142 False
κΉνλ―Ό μ¬κ·Ή νμ° 2022-07-27 129 True
νμ¬λ¦Ό μ¬λ λΉμμ μΈ 2022-08-03 140 True
μ΄μ μ¬ μ²©λ³΄ ννΈ 2022-08-10 125 True
```

> μ½λ μμ± 

```python
director_bong = Director.objects.get(name='λ΄μ€νΈ')
movies = Movie.objects.exclude(director=director_bong).order_by('opening_date')

for movie in movies:
    print(movie.director.name, movie.genre.title, movie.title, movie.opening_date, movie.running_time, movie.screening)
```