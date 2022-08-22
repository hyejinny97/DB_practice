# 문제
- [2022.08.19 실습 문제](#-20220819-실습-문제)
  - SELECT문, CASE, 서브쿼리 활용
- [2022.08.22 실습 문제](#-20220822-실습-문제)
  - SELECT문, JOIN 활용

## 🛠 2022.08.19 실습 문제


### 1. 모든 테이블의 이름을 출력하세요.

```sql
.tables
```

```
albums          employees       invoices        playlists
artists         genres          media_types     tracks
customers       invoice_items   playlist_track
```

### 2. 모든 테이블의 데이터를 확인해보세요.
| 공백은 있는지 NULL은 있는지 데이터 타입은 어떤지 등등 데이터를 직접 확인해보세요.

> albums 테이블

💡 데이터 구조

```sql
.schema albums
```

```
CREATE TABLE IF NOT EXISTS "albums"
(
    [AlbumId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Title] NVARCHAR(160)  NOT NULL,
    [ArtistId] INTEGER  NOT NULL,
    FOREIGN KEY ([ArtistId]) REFERENCES "artists" ([ArtistId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_AlbumArtistId] ON "albums" ([ArtistId]);
```
↳ 모든 컬럼의 데이터에는 NULL이 들어올 순 없음

↳ NVARCHAR() 데이터 타입: 유니코드를 저장하는 가변길이의 문자열

↳ aritists 테이블의 ArtistId 컬럼을 참조해서 albums 테이블에 ArtistId 컬럼을 외래 키로 만듦

💡 일부 데이터 조회

```sql
SELECT * FROM albums LIMIT 5;
```

```
AlbumId  Title                                  ArtistId
-------  -------------------------------------  --------
1        For Those About To Rock We Salute You  1
2        Balls to the Wall                      2
3        Restless and Wild                      2
4        Let There Be Rock                      1
5        Big Ones                               3
```

💡 원하는 데이터 조회

```sql
SELECT COUNT(*) FROM albums WHERE title = '' or ArtistId = '';
```

```
COUNT(*)
--------
0
```
↳ 모든 컬럼의 데이터에는 공백이 없음

*****

> artists 테이블

💡 데이터 구조

```sql
.schema artists
```

```
CREATE TABLE IF NOT EXISTS "artists"
(
    [ArtistId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
```
↳ name 컬럼의 데이터에는 NULL이 들어올 수 있음

💡 일부 데이터 조회

```sql
SELECT * FROM artists LIMIT 5;
```

```
ArtistId  Name
--------  -----------------
1         AC/DC
2         Accept
3         Aerosmith
4         Alanis Morissette
5         Alice In Chains
```

💡 원하는 데이터 조회

```sql
SELECT COUNT(*) FROM artists WHERE Name = '' OR Name IS NULL;
```

```
COUNT(*)
--------
0
```
↳ 현재 name 컬럼의 데이터에 공백이나 NULL이 없음

*****

> customers 테이블

💡 데이터 구조

```sql
.schema customers
```

```
CREATE TABLE IF NOT EXISTS "customers"
(
    [CustomerId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [FirstName] NVARCHAR(40)  NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [Company] NVARCHAR(80),
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60)  NOT NULL,
    [SupportRepId] INTEGER,
    FOREIGN KEY ([SupportRepId]) REFERENCES "employees" ([EmployeeId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_CustomerSupportRepId] ON "customers" ([SupportRepId]);
```
↳ Company, Address, City, State, Country, PostalCode, Phone, Fax, SupportRepId 컬럼의 데이터에는 NULL이 들어올 수 있음

↳ 이름, 성, 이메일만 필수 기입 (NOT NULL)

↳ Phone과 Fax의 데이터 타입도 NVARCHAR

↳ employees 테이블의 EmployeeId 컬럼을 참조해서 customers 테이블에 SupportRepId 컬럼을 외래 키로 만듦

💡 일부 데이터 조회

```sql
SELECT * FROM customers LIMIT 3;
```

```
CustomerId  FirstName  LastName   Company                                           Address                          City                 State  Country  PostalCode  Phone               Fax                 Email                  SupportRepId
----------  ---------  ---------  ------------------------------------------------  -------------------------------  -------------------  -----  -------  ----------  ------------------  ------------------  ---------------------  ------------
1           Luis       Goncalves  Embraer - Empresa Brasileira de Aeronautica S.A.  Av. Brigadeiro Faria Lima, 2170  Sao Jose dos Campos  SP     Brazil   12227-000   +55 (12) 3923-5555  +55 (12) 3923-5566  luisg@embraer.com.br   3
2           Leonie     Kohler                                                       Theodor-Heuss-Straße 34          Stuttgart                   Germany   
70174       +49 0711 2842222                        leonekohler@surfeu.de  5
3           Francois   Tremblay                                                     1498 rue Belanger                Montreal             QC     Canada   H2G 1A7     +1 (514) 721-4711                       ftremblay@gmail.com    3
```

💡 원하는 데이터 조회

```sql
SELECT COUNT(*) FROM customers WHERE Company = '' OR Company is NULL;
```

```
COUNT(*)
--------
49
```
↳ 현재 Company 컬럼의 데이터에 공백이나 NULL이 49개 있음

*****

> employees 테이블

💡 데이터 구조

```sql
.schema employees
```

```
CREATE TABLE IF NOT EXISTS "employees"
(
    [EmployeeId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [LastName] NVARCHAR(20)  NOT NULL,
    [FirstName] NVARCHAR(20)  NOT NULL,
    [Title] NVARCHAR(30),
    [ReportsTo] INTEGER,
    [BirthDate] DATETIME,
    [HireDate] DATETIME,
    [Address] NVARCHAR(70),
    [City] NVARCHAR(40),
    [State] NVARCHAR(40),
    [Country] NVARCHAR(40),
    [PostalCode] NVARCHAR(10),
    [Phone] NVARCHAR(24),
    [Fax] NVARCHAR(24),
    [Email] NVARCHAR(60),
    FOREIGN KEY ([ReportsTo]) REFERENCES "employees" ([EmployeeId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_EmployeeReportsTo] ON "employees" ([ReportsTo]);
```
↳ Title, Reportsto, BirthDate, HireDate, Address, City, State, Country, PostalCode, Phone, Fax, Email 컬럼의 데이터에는 NULL이 들어올 수 있음

↳ 이름, 성만 필수 기입 (NOT NULL)

↳ BirthDate와 HireDate의 데이터 타입은 DATETIME

↳ employees 테이블 자신의 EmployeeId 컬럼을 참조해서 employees 테이블에 ReportsTo 컬럼을 외래 키로 만듦

💡 일부 데이터 조회

```sql
SELECT * FROM employees LIMIT 3;
```

```
EmployeeId  LastName  FirstName  Title                ReportsTo  BirthDate            HireDate             Address              City      State  Country  PostalCode  Phone              Fax                Email
----------  --------  ---------  -------------------  ---------  -------------------  -------------------  -------------------  --------  -----  -------  ----------  -----------------  -----------------  ----------------------
1           Adams     Andrew     General Manager                 1962-02-18 00:00:00  2002-08-14 00:00:00  11120 Jasper Ave NW  Edmonton  AB     Canada   T5K 2N1     +1 (780) 428-9482  +1 (780) 428-3457  andrew@chinookcorp.com
2           Edwards   Nancy      Sales Manager        1          1958-12-08 00:00:00  2002-05-01 00:00:00  825 8 Ave SW         Calgary   AB     Canada   T2P 2T3     +1 (403) 262-3443  +1 (403) 262-3322  nancy@chinookcorp.com
3           Peacock   Jane       Sales Support Agent  2          1973-08-29 00:00:00  2002-04-01 00:00:00  1111 6 Ave SW        Calgary   AB     Canada   T2P 5M5     +1 (403) 262-3443  +1 (403) 262-6712  jane@chinookcorp.com
```

💡 원하는 데이터 조회

```sql
SELECT EmployeeId, LastName FROM employees WHERE ReportsTo is NULL;
```

```
EmployeeId  LastName
----------  --------
1           Adams
```
↳ ReportsTo(보고 대상)이 없는 Adams가 이 회사의 CEO인 것을 짐작할 수 있음

*****

> genres 테이블

💡 데이터 구조

```sql
.schema genres
```

```
CREATE TABLE IF NOT EXISTS "genres"
(
    [GenreId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
```
↳ Name 컬럼의 데이터에는 NULL이 들어올 수 있음

💡 일부 데이터 조회

```sql
SELECT * FROM genres LIMIT 5;
```

```
GenreId  Name
-------  ------------------
1        Rock
2        Jazz
3        Metal
4        Alternative & Punk
5        Rock And Roll
```

💡 원하는 데이터 조회

```sql
SELECT COUNT(*) FROM genres;
```

```
COUNT(*)
--------
25
```
↳ 기록된 장르 갯수는 총 25개

*****

> invoice_items 테이블

💡 데이터 구조

```sql
.schema invoice_items
```

```
CREATE TABLE IF NOT EXISTS "invoice_items"
(
    [InvoiceLineId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [InvoiceId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    [Quantity] INTEGER  NOT NULL,
    FOREIGN KEY ([InvoiceId]) REFERENCES "invoices" ([InvoiceId])
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_InvoiceLineInvoiceId] ON "invoice_items" ([InvoiceId]);
CREATE INDEX [IFK_InvoiceLineTrackId] ON "invoice_items" ([TrackId]);
```
↳ 모든 컬럼의 데이터에는 NULL이 들어올 수 없음

↳ UnitPrice 컬럼의 데이터 타입은 NUMERIC으로, 전체 자릿수와 소수 자릿수가 고정된 숫자 데이터 형식임 ⇒ NUMERIC(최대자리수, 소수점이하정밀도)

↳ invoices 테이블의 InvoiceId 컬럼을 참조해서 invoice_items 테이블에 InvoiceId 컬럼을 외래 키로 만듦

↳ tracks 테이블의 TrackId 컬럼을 참조해서 invoice_items 테이블에 TrackId 컬럼을 외래 키로 만듦

💡 일부 데이터 조회

```sql
SELECT * FROM invoice_items LIMIT 5;
```

```
InvoiceLineId  InvoiceId  TrackId  UnitPrice  Quantity
-------------  ---------  -------  ---------  --------
1              1          2        0.99       1
2              1          4        0.99       1
3              2          6        0.99       1
4              2          8        0.99       1
5              2          10       0.99       1
```

💡 원하는 데이터 조회

```sql
SELECT UnitPrice FROM invoice_items GROUP BY UnitPrice;
```

```
UnitPrice
---------
0.99
1.99
```
↳ 단위당 가격으로는 0.99나 1.99 밖에 없음

*****

> invoices 테이블

💡 데이터 구조

```sql
.schema invoices
```

```
CREATE TABLE IF NOT EXISTS "invoices"
(
    [InvoiceId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [CustomerId] INTEGER  NOT NULL,
    [InvoiceDate] DATETIME  NOT NULL,
    [BillingAddress] NVARCHAR(70),
    [BillingCity] NVARCHAR(40),
    [BillingState] NVARCHAR(40),
    [BillingCountry] NVARCHAR(40),
    [BillingPostalCode] NVARCHAR(10),
    [Total] NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY ([CustomerId]) REFERENCES "customers" ([CustomerId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_InvoiceCustomerId] ON "invoices" ([CustomerId]);
```
↳ BillingAddress, BillingCity, BillingState, BillingCountry, BillingPostalCode 컬럼의 데이터에는 NULL이 들어올 수 있음

↳ CustomerId, InvoiceDate, Total은 필수 기입 (NOT NULL)

↳ customers 테이블의 CustomerId 컬럼을 참조해서 invoices 테이블에 CustomerId 컬럼을 외래 키로 만듦

💡 일부 데이터 조회

```sql
SELECT * FROM invoices LIMIT 5;
```

```
InvoiceId  CustomerId  InvoiceDate          BillingAddress           BillingCity  BillingState  BillingCountry  BillingPostalCode  Total
---------  ----------  -------------------  -----------------------  -----------  ------------  --------------  -----------------  -----
1          2           2009-01-01 00:00:00  Theodor-Heuss-Straße 34  Stuttgart                  Germany         70174              1.98
2          4           2009-01-02 00:00:00  Ullevalsveien 14         Oslo                       Norway          0171               3.96
3          8           2009-01-03 00:00:00  Gretrystraat 63          Brussels                   Belgium         1000               5.94
4          14          2009-01-06 00:00:00  8210 111 ST NW           Edmonton     AB            Canada          T6G 2C7            8.91
5          23          2009-01-11 00:00:00  69 Salem Street          Boston       MA            USA             2113               13.86
```

💡 원하는 데이터 조회

```sql
SELECT CustomerId, Max(Total) FROM invoices;
```

```
CustomerId  Max(Total)
----------  ----------
6           25.86
```
↳ 구매 금액이 가장 높은 고객은 6번 고객

*****

> media_types 테이블

💡 데이터 구조

```sql
.schema media_types
```

```
CREATE TABLE IF NOT EXISTS "media_types"
(
    [MediaTypeId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
```
↳ Name 컬럼의 데이터에는 NULL이 들어올 수 있음

💡 일부 데이터 조회

```sql
SELECT * FROM media_types LIMIT 5;
```

```
MediaTypeId  Name
-----------  ---------------------------
1            MPEG audio file
2            Protected AAC audio file
3            Protected MPEG-4 video file
4            Purchased AAC audio file
5            AAC audio file
```

💡 원하는 데이터 조회

```sql
SELECT * FROM media_types WHERE Name LIKE '%audio file';
```

```
MediaTypeId  Name
-----------  ------------------------
1            MPEG audio file
2            Protected AAC audio file
4            Purchased AAC audio file
5            AAC audio file
```
↳ 오디오 파일 종류

*****

> playlist_track 테이블

💡 데이터 구조

```sql
.schema playlist_track
```

```
CREATE TABLE IF NOT EXISTS "playlist_track"
(
    [PlaylistId] INTEGER  NOT NULL,
    [TrackId] INTEGER  NOT NULL,
    CONSTRAINT [PK_PlaylistTrack] PRIMARY KEY  ([PlaylistId], [TrackId]),
    FOREIGN KEY ([PlaylistId]) REFERENCES "playlists" ([PlaylistId])
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([TrackId]) REFERENCES "tracks" ([TrackId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_PlaylistTrackTrackId] ON "playlist_track" ([TrackId]);
```
↳ 모든 컬럼의 데이터에는 NULL이 들어올 수 없음

↳ playlists 테이블의 PlaylistId 컬럼을 참조해서 playlist_track 테이블에 PlaylistId 컬럼을 외래 키로 만듦

↳ tracks 테이블의 TrackId 컬럼을 참조해서 playlist_track 테이블에 TrackId 컬럼을 외래 키로 만듦

↳ 동시에 ([PlaylistId], [TrackId])를 기본 키로 설정

💡 일부 데이터 조회

```sql
SELECT * FROM playlist_track LIMIT 5;
```

```
PlaylistId  TrackId
----------  -------
1           3402
1           3389
1           3390
1           3391
1           3392
```

💡 원하는 데이터 조회

```sql
SELECT COUNT(*) FROM playlist_track;
SELECT COUNT(DISTINCT PlaylistId) FROM playlist_track;
SELECT PlaylistId, COUNT(TrackId) FROM playlist_track GROUP BY PlaylistId;
```

```
COUNT(*)
--------
8715

COUNT(DISTINCT PlaylistId)
--------------------------
14

PlaylistId  COUNT(TrackId)
----------  --------------
1           3290
3           213
5           1477
8           3290
9           1
10          213
11          39
12          75
13          25
14          25
15          25
16          15
17          26
18          1
```
↳ PlaylistId의 종류는 14개

*****

> playlists 테이블

💡 데이터 구조

```sql
.schema playlists
```

```
CREATE TABLE IF NOT EXISTS "playlists"
(
    [PlaylistId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(120)
);
```
↳ Name 컬럼의 데이터에는 NULL이 들어올 수 있음

💡 일부 데이터 조회

```sql
SELECT * FROM playlists LIMIT 5;
```

```
PlaylistId  Name
----------  ----------
1           Music
2           Movies
3           TV Shows
4           Audiobooks
5           90’s Music
```

💡 원하는 데이터 조회

```sql
SELECT COUNT(*) FROM playlists;
```

```
COUNT(*)
--------
18
```
↳ 기록된 Playlists는 총 18개

*****

> tracks 테이블

💡 데이터 구조

```sql
.schema tracks
```

```
CREATE TABLE IF NOT EXISTS "tracks"
(
    [TrackId] INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    [Name] NVARCHAR(200)  NOT NULL,
    [AlbumId] INTEGER,
    [MediaTypeId] INTEGER  NOT NULL,
    [GenreId] INTEGER,
    [Composer] NVARCHAR(220),
    [Milliseconds] INTEGER  NOT NULL,
    [Bytes] INTEGER,
    [UnitPrice] NUMERIC(10,2)  NOT NULL,
    FOREIGN KEY ([AlbumId]) REFERENCES "albums" ([AlbumId])
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([GenreId]) REFERENCES "genres" ([GenreId])
                ON DELETE NO ACTION ON UPDATE NO ACTION,
    FOREIGN KEY ([MediaTypeId]) REFERENCES "media_types" ([MediaTypeId])
                ON DELETE NO ACTION ON UPDATE NO ACTION
);
CREATE INDEX [IFK_TrackAlbumId] ON "tracks" ([AlbumId]);
CREATE INDEX [IFK_TrackGenreId] ON "tracks" ([GenreId]);
CREATE INDEX [IFK_TrackMediaTypeId] ON "tracks" ([MediaTypeId]);
```
↳ AlbumId, GenreId, Composer, Bytes 컬럼의 데이터에는 NULL이 들어올 수 있음

↳ Name, MediaTypeId, Milliseconds, UnitPrice는 필수 기입 (NOT NULL)

↳ albums 테이블의 AlbumId 컬럼을 참조해서 tracks 테이블에 AlbumId 컬럼을 외래 키로 만듦

↳ genres 테이블의 GenreId 컬럼을 참조해서 tracks 테이블에 GenreId 컬럼을 외래 키로 만듦

↳ media_types 테이블의 MediaTypeId 컬럼을 참조해서 tracks 테이블에 MediaTypeId 컬럼을 외래 키로 만듦

💡 일부 데이터 조회

```sql
SELECT * FROM tracks LIMIT 3;
```

```
TrackId  Name                                     AlbumId  MediaTypeId  GenreId  Composer                                             Milliseconds  Bytes  
   UnitPrice
-------  ---------------------------------------  -------  -----------  -------  ---------------------------------------------------  ------------  --------  ---------
1        For Those About To Rock (We Salute You)  1        1            1        Angus Young, Malcolm Young, Brian Johnson            343719        11170334  0.99
2        Balls to the Wall                        2        2            1                                                             342562        5510424   0.99
3        Fast As a Shark                          3        2            1        F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman  230619        3990994   0.99
```

💡 원하는 데이터 조회

```sql
SELECT GenreId, ROUND(AVG(Milliseconds)) FROM tracks GROUP BY GenreId;
SELECT * FROM genres WHERE GenreId = 20;
```

```
GenreId  ROUND(AVG(Milliseconds))
-------  ------------------------
1        283910.0
2        291755.0
3        309749.0
4        234354.0
5        134644.0
6        270360.0
7        232859.0
8        247178.0
9        229034.0
10       244371.0
11       219590.0
12       189164.0
13       297453.0
14       220067.0
15       302986.0
16       224924.0
17       178176.0
18       2625549.0
19       2145041.0
20       2911783.0
21       2575284.0
22       1585264.0
23       264059.0
24       293868.0
25       174813.0

GenreId  Name
-------  ----------------
20       Sci Fi & Fantasy
```
↳ 장르별 평균 재생시간은 위와 같음

↳ 장르Id가 20인 Sci Fi & Fantasy 장르가 평균 재생시간이 2911783ms(= 2911s = 48min)으로 가장 길었음



### 3. 앨범(albums) 테이블의 데이터를 출력하세요.
| 단, `Title`을 기준으로 내림차순해서 5개까지 출력하세요.

```sql
SELECT * FROM albums ORDER BY Title DESC LIMIT 5;
```

```
AlbumId  Title                         ArtistId
-------  ----------------------------  --------
208      [1997] Black Light Syndrome   136
240      Zooropa                       150
267      Worlds                        202
334      Weill: The Seven Deadly Sins  264
8        Warner 25 Anos                6
```

### 4. 고객(customers) 테이블의 행 개수를 출력하세요.
| 단, 컬럼명을 `고객 수`로 출력하세요.

```sql
SELECT COUNT(*) AS "고객 수" FROM customers;
```

```
고객 수
----
59
```

### 5. 고객(customers) 테이블에서 고객이 사는 나라가 `USA`인 고객의 `FirstName`, `LastName`을 출력하세요.
| 단, 각각의 컬럼명을 `이름`, `성`으로 출력하고, `이름`을 기준으로 내림차순으로 5개까지 출력하세요.

```sql
SELECT FirstName 이름, LastName 성 FROM customers WHERE Country = 'USA' ORDER BY 이름 DESC LIMIT 5;
```

```
이름        성
--------  ----------
Victor    Stevens
Tim       Goyer
Richard   Cunningham
Patrick   Gray
Michelle  Brooks
```

### 6. 송장(invoices) 테이블에서 `BillingPostalCode`가 `NULL` 이 아닌 행의 개수를 출력하세요.
| 단, 컬렴명을 `송장수`로 출력하세요.

```sql
SELECT COUNT(*) 송장수 FROM invoices WHERE BillingPostalCode IS NOT NULL;
```

```
송장수
---
384
```

### 7. 송장(invoices) 테이블에서 `BillingState`가 `NULL` 인 데이터를 출력하세요.
| 단, `InvoiceDate`를 기준으로 내림차순으로 5개까지 출력하세요.

```sql
SELECT * FROM invoices WHERE BillingState IS NULL ORDER BY InvoiceDate DESC LIMIT 5;
```

```
InvoiceId  CustomerId  InvoiceDate          BillingAddress                            BillingCity   BillingState  BillingCountry  BillingPostalCode  Total 
---------  ----------  -------------------  ----------------------------------------  ------------  ------------  --------------  -----------------  ----- 
412        58          2013-12-22 00:00:00  12,Community Centre                       Delhi                       India           110017             1.99  
411        44          2013-12-14 00:00:00  Porthaninkatu 9                           Helsinki                    Finland         00530              13.86 
410        35          2013-12-09 00:00:00  Rua dos Campeoes Europeus de Viena, 4350  Porto                       Portugal                           8.91  
404        6           2013-11-13 00:00:00  Rilska 3174/6                             Prague                      Czech Republic  14300              25.86 
403        56          2013-11-08 00:00:00  307 Macacha Guemes                        Buenos Aires                Argentina       1106               8.91  
```

### 8. 송장(invoices) 테이블에서 `InvoiceDate`의 년도가 `2013`인 행의 개수를 출력하세요.
| `strftime`를 검색해서 활용해보세요. (참고: [https://araikuma.tistory.com/744]())

```sql
SELECT COUNT(*) FROM invoices WHERE strftime('%Y', InvoiceDate) = '2013';
```

```
COUNT(*)
--------
80
```

### 9. 고객(customers) 테이블에서 `FirstName`이 `L` 로 시작하는 고객의 `CustomerId`, `FirstName`, `LastName`을 출력하세요.
| 단, 각각의 컬럼명을 `고객ID`, `이름`,`성`으로 출력하고, `고객ID`을 기준으로 오름차순으로 출력하세요.

```sql
SELECT CustomerId 고객ID, FirstName 이름, LastName 성 FROM customers WHERE FirstName LIKE 'L%' ORDER BY 고객ID;
``` 

```
고객ID  이름        성
----  --------  ---------
1     Luis      Goncalves
2     Leonie    Kohler
45    Ladislav  Kovacs
47    Lucas     Mancini
57    Luis      Rojas
```

### 10. 고객(customers) 테이블에서 각 나라의 고객 수와 해당 나라 이름을 출력하세요.
| 단, 각각의 컬렴명을 `고객 수`,`나라`로 출력하고, 고객 수 상위 5개의 나라만 출력하세요.

```sql
SELECT country 나라, COUNT(*) "고객 수" FROM customers GROUP BY country ORDER BY "고객 수" DESC LIMIT 5;
```

```
나라       고객 수
-------  ----
USA      13
Canada   8
France   5
Brazil   5
Germany  4
```

### 11. 앨범(albums) 테이블에서 가장 많은 앨범이 있는 Artist의 `ArtistId`와 `앨범 수`를 출력하세요.

```sql
SELECT ArtistId, COUNT(*) "앨범 수" FROM albums GROUP BY ArtistId ORDER BY "앨범 수" DESC LIMIT 1;
```

```
ArtistId  앨범 수
--------  ----
90        21
```

### 12. 앨범(albums) 테이블에서 보유 앨범 수가 10개 이상인 Artist의 `ArtistId`와 `앨범 수` 출력하세요
| 단, 앨범 수를 기준으로 내림차순으로 출력하세요.

```sql 
SELECT ArtistId, COUNT(*) "앨범 수" FROM albums GROUP BY ArtistId HAVING "앨범 수" >= 10 ORDER BY "앨범 수" DESC;
```

```
ArtistId  앨범 수
--------  ----
90        21
22        14
58        11
50        10
150       10
```

### 13. 고객(customers) 테이블에서 `State`가 존재하는 고객들을 `Country` 와 `State`를 기준으로 그룹화해서 각 그룹의 `고객 수`, `Country`, `State` 를 출력하세요.
| 단, `고객 수`, `Country` 순서 기준으로 내림차순으로 5개까지 출력하세요.

```sql 
SELECT Country, State, COUNT(*) "고객 수" FROM customers WHERE State != '' AND State IS NOT NULL GROUP BY Country, State ORDER BY "고객 수" DESC, Country DESC LIMIT 5;
```

```
Country  State  고객 수
-------  -----  ----
USA      CA     3
Brazil   SP     3
Canada   ON     2
USA      WI     1
USA      WA     1
```

### 14.  고객(customers) 테이블에서 `Fax` 가 `NULL`인 고객은 'X' NULL이 아닌 고객은 'O'로 `Fax 유/무` 컬럼에 표시하여 출력하세요.
| 단, `CustomerId`와 `Fax 유/무` 컬럼만 출력하고, `CustomerId` 기준으로 오름차순으로 5개까지 출력하세요. 

```sql 
SELECT 
  CustomerId,
  CASE
    WHEN Fax IS NULL THEN 'X'
    ELSE 'O'
  END AS "Fax 유/무"
FROM customers
ORDER BY CustomerId
LIMIT 5;
```

```
CustomerId  Fax 유/무
----------  -------
1           O
2           X
3           X
4           X
5           O
```

### 15. 점원(employees) 테이블에서 `올해년도 - BirthDate 년도 + 1` 를 계산해서 `나이` 컬럼에 표시하여 출력하세요.
| 단, 점원의 `LastName`, `FirstName`, `나이` 컬럼만 출력하고, `EmployeeId`를 기준으로 오름차순으로 출력하세요.

| cast(), strftime(), 오늘 날짜를 구하는 함수를 검색하고, 활용해보세요. ([cast() 참고자료](https://m.blog.naver.com/PostView.naver?isHttpsRedirect=true&blogId=diceworld&logNo=220163553808))

```sql 
SELECT 
  LastName, 
  FirstName, 
  cast(strftime('%Y', 'now') AS INT) - cast(strftime('%Y', BirthDate) AS INT) + 1 AS 나이 
FROM employees
ORDER BY EmployeeId; 
``` 

```
LastName  FirstName  나이
--------  ---------  --
Adams     Andrew     61
Edwards   Nancy      65
Peacock   Jane       50
Park      Margaret   76
Johnson   Steve      58
Mitchell  Michael    50
King      Robert     53
Callahan  Laura      55
```

### 16. 가수(artists) 테이블에서 앨범(albums)의 개수가 가장 많은 가수의 `Name`을 출력하세요.
| artists 테이블과 albums 테이블의 `ArtistId` 활용하세요.

```sql 
-- albums 테이블에서 앨범 수가 가장 많은 ArtistId 조회
SELECT ArtistId, COUNT(*) "앨범 수" FROM albums GROUP BY ArtistId ORDER BY "앨범 수" DESC LIMIT 1;
-- artists 테이블에서 ArtistId가 90인 가수의 Name을 조회
SELECT Name FROM artists WHERE ArtistId = 90;

-- 위 두 쿼리문 합치기
SELECT Name 
FROM artists 
WHERE ArtistId = (
  SELECT ArtistId 
  FROM (
    SELECT ArtistId, COUNT(*) "앨범 수" 
    FROM albums 
    GROUP BY ArtistId 
    ORDER BY "앨범 수" DESC 
    LIMIT 1
  )
);
```

```
ArtistId  앨범 수
--------  ----
90        21

Name
---------------
Iron Maiden

Name
---------------
Iron Maiden
```

### 17. 장르(genres) 테이블에서 음악(tracks)의 개수가 가장 적은 장르의 `Name`을 출력하세요.
| genres 테이블과 tracks 테이블의 `GenreId` 활용하세요.

```sql
-- tracks 테이블에서 음악의 갯수가 가장 적은 장르 조회
SELECT GenreId, COUNT(*) "음악 수" FROM tracks GROUP BY GenreId ORDER BY "음악 수" LIMIT 1;
-- genres 테이블에서 GenreId가 25인 장르의 Name을 조회
SELECT Name FROM genres WHERE GenreId = 25;

-- 위 두 쿼리문 합치기
SELECT Name 
FROM genres 
WHERE GenreId = (
  SELECT GenreId
  FROM (
    SELECT GenreId, COUNT(*) "음악 수" 
    FROM tracks 
    GROUP BY GenreId 
    ORDER BY "음악 수" 
    LIMIT 1
  )
);
```

```
GenreId  음악 수
-------  ----
25       1

Name
-----
Opera

Name
-----
Opera
```



## 🛠 2022.08.22 실습 문제

### 1. playlist_track 테이블에 `A`라는 별칭을 부여하고 데이터를 출력하세요.
| 단, 모든 컬럼을 `PlaylistId` 기준으로 내림차순으로 5개만 출력하세요.

```sql
SELECT * FROM playlist_track "A" ORDER BY A.PlaylistId DESC LIMIT 5;
```

```
PlaylistId  TrackId
----------  -------
18          597
17          3290
17          2096
17          2095
17          2094
```

### 2. tracks 테이블에 `B`라는 별칭을 부여하고 데이터를 출력하세요
| 단, 모든 컬럼을 `TrackId` 기준으로 오름차순으로 5개만 출력하세요.

```sql
SELECT * FROM tracks "B" ORDER BY B.TrackId LIMIT 5;
``` 

```
TrackId  Name                                     AlbumId  MediaTypeId  GenreId  Composer                                                      Milliseconds  Bytes     UnitPrice
-------  ---------------------------------------  -------  -----------  -------  ------------------------------------------------------------  ----------- 
  --------  ---------
1        For Those About To Rock (We Salute You)  1        1            1        Angus Young, Malcolm Young, Brian Johnson                     343719      
  11170334  0.99

2        Balls to the Wall                        2        2            1                                                                      342562      
  5510424   0.99

3        Fast As a Shark                          3        2            1        F. Baltes, S. Kaufman, U. Dirkscneider & W. Hoffman           230619      
  3990994   0.99

4        Restless and Wild                        3        2            1        F. Baltes, R.A. Smith-Diesel, S. Kaufman, U. Dirkscneider &   252051      
  4331779   0.99
                                                                                 W. Hoffman


5        Princess of the Dawn                     3        2            1        Deaffy & R.A. Smith-Diesel                                    375418      
  6290521   0.99
```
 
### 3. 각 playlist_track 해당하는 track 데이터를 함께 출력하세요.
| 단, PlaylistId, Name 컬럼을 `PlaylistId` 기준으로 내림차순으로 10개만 출력하세요. 

```sql
SELECT A.PlaylistID, B.Name 
FROM playlist_track "A" INNER JOIN tracks "B"
  ON A.TrackId = B.TrackId
ORDER BY A.PlaylistId DESC
LIMIT 10;
```  

```
PlaylistId  Name
----------  -----------------------
18          Now's The Time
17          The Zoo
17          Flying High Again
17          Crazy Train
17          I Don't Know
17          Looks That Kill
17          Live To Win
17          Ace Of Spades
17          Creeping Death
17          For Whom The Bell Tolls
```

### 4. `PlaylistId`가 `10`인 track 데이터를 함께 출력하세요. 
| 단, PlaylistId, Name 컬럼을 `Name` 기준으로 내림차순으로 5개만 출력하세요.

```sql
SELECT A.PlaylistId, B.Name
FROM playlist_track "A" INNER JOIN tracks "B"
  ON A.TrackId = B.TrackId
WHERE A.PlaylistId = 10
ORDER BY B.Name DESC
LIMIT 5;
``` 

```
PlaylistId  Name
----------  ------------------------
10          Women's Appreciation
10          White Rabbit
10          Whatever the Case May Be
10          What Kate Did
10          War of the Gods, Pt. 2
```

### 5. tracks 테이블을 기준으로 tracks `Composer` 와 artists 테이블의 `Name`을 `INNER JOIN`해서 데이터를 출력하세요.
| 단, 행의 개수만 출력하세요.

```sql
SELECT COUNT(*)
FROM tracks "A" INNER JOIN artists "B"
  ON A.Composer = B.Name;
```

```
COUNT(*)
--------
402
```

### 6. tracks 테이블을 기준으로 tracks `Composer` 와 artists 테이블의 `Name`을 `LEFT JOIN`해서 데이터를 출력하세요.
| 단, 행의 개수만 출력하세요.

```sql
SELECT COUNT(*)
FROM tracks "A" LEFT JOIN artists "B"
  ON A.Composer = B.Name;
```

```
COUNT(*)
--------
3503
```
↳ tracks 테이블의 전체 행의 갯수와 같음

### 7. `INNER JOIN` 과 `LEFT JOIN` 행의 개수가 다른 이유를 작성하세요.

```plain
INNER JOIN은 두 테이블에 공통으로 존재하는 데이터 값만 묶어주는 반면, 
LEFT JOIN은 왼쪽에 적은 테이블과 오른쪽에 적은 테이블을 특정 조건으로 묶어줄 때 
왼쪽에 적은 테이블의 데이터와 매칭되는 값이 없더라도 NULL값을 사용해서 데이터를 반환해 줌
```

### 8. invoice_items 테이블의 데이터를 출력하세요.
| 단, InvoiceLineId, InvoiceId 컬럼을 `InvoiceId` 기준으로 오름차순으로 5개만 출력하세요.

```sql
SELECT A.InvoiceLineId, A.InvoiceId
FROM invoice_items "A"
ORDER BY InvoiceId
LIMIT 5;
``` 

```
InvoiceLineId  InvoiceId
-------------  ---------
1              1
2              1
3              2
4              2
5              2
```

### 9. invoices 테이블의 데이터를 출력하세요.
| 단, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 오름차순으로 5개만 출력하세요.

```sql
SELECT B.InvoiceId, B.CustomerId
FROM invoices "B"
ORDER BY InvoiceId
LIMIT 5; 
``` 

```
InvoiceId  CustomerId
---------  ----------
1          2
2          4
3          8
4          14
5          23
```

### 10. 각 invoices_item에 해당하는 invoice 데이터를 함께 출력하세요.
| 단, InvoiceLineId, InvoiceId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력하세요.

```sql
SELECT A.InvoiceLineId, A.InvoiceId
FROM invoice_items "A" INNER JOIN invoices "B"
  ON A.InvoiceId = B.InvoiceId
ORDER BY A.InvoiceId DESC
LIMIT 5;

SELECT A.InvoiceLineId, A.InvoiceId
FROM invoice_items "A" INNER JOIN invoices "B"
  ON A.InvoiceId = B.InvoiceId
ORDER BY B.InvoiceId DESC
LIMIT 5;
``` 

```
InvoiceLineId  InvoiceId
-------------  ---------
2240           412
2239           411
2238           411
2237           411
2236           411

InvoiceLineId  InvoiceId
-------------  ---------
2240           412
2226           411
2227           411
2228           411
2229           411
```

### 11. 각 invoice에 해당하는 customer 데이터를 함께 출력하세요.
| 단, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력하세요.

```sql
SELECT A.InvoiceId, A.CustomerId
FROM invoices "A" INNER JOIN customers "B"
  ON A.CustomerId = B.CustomerId
ORDER BY A.InvoiceId DESC
LIMIT 5;
``` 

```
InvoiceId  CustomerId
---------  ----------
412        58
411        44
410        35
409        29
408        25
```

### 12. 각 invoices_item(상품)을 포함하는 invoice(송장)와 해당 invoice를 받을 customer(고객) 데이터를 모두 함께 출력하세요.
| 단, InvoiceLineId, InvoiceId, CustomerId 컬럼을 `InvoiceId` 기준으로 내림차순으로 5개만 출력하세요.

```sql
SELECT A.InvoiceLineId, B.InvoiceId, C.CustomerId
FROM invoice_items "A" 
  JOIN invoices "B"
    ON A.InvoiceId = B.InvoiceId
  JOIN customers "C"
    ON B.CustomerId = C.CustomerId
ORDER BY A.InvoiceId DESC
LIMIT 5;
```

```
InvoiceLineId  InvoiceId  CustomerId
-------------  ---------  ----------
2240           412        58
2239           411        44
2238           411        44
2237           411        44
2236           411        44
```

### 13. 각 cusotmer가 주문한 invoices_item의 개수를 출력하세요.
| 단, CustomerId와 개수 컬럼을 `CustomerId` 기준으로 오름차순으로 5개만 출력하세요.

```sql
SELECT C.CustomerId, COUNT(*)
FROM invoice_items "A" 
  JOIN invoices "B"
    ON A.InvoiceId = B.InvoiceId
  JOIN customers "C"
    ON B.CustomerId = C.CustomerId
GROUP BY C.CustomerId
ORDER BY C.CustomerId
LIMIT 5;
```

```
CustomerId  COUNT(*)
----------  --------
1           38
2           38
3           38
4           38
5           38
```

