# 데이터베이스 모델링 및 ERD 작성 실습
- ERD 작성 플랫폼: <https://app.diagrams.net/> ([플랫폼 활용 가이드](https://drawio-app.com/entity-relationship-diagrams-with-draw-io/))


## 1. Syllaverse 플랫폼
> 문제 설명

- Syllaverse 플랫폼의 커리큘럼 탭을 보고 어떤 구조인지 ERD를 자유롭게 그려보자
- 주요 Entity는 사용자, 강의, 과제
- 아래는 Syllaverse 플랫폼의 커리큘럼 탭 등 페이지 이미지

  ![syllaverse 이미지1](../practice_04/image/syllaverse_01.png)

  ![syllaverse 이미지2](../practice_04/image/syllaverse_02.png)

  ![syllaverse 이미지3](../practice_04/image/syllaverse_03.png)

  ![syllaverse 이미지4](../practice_04/image/syllaverse_04.png)

> 엑셀을 이용해 모델링 구상
  
1. 사용자 테이블

    ![syllaverse users table 이미지](../practice_04/image/syllaverse_users_table.png)

2. 훈련과정 정보 테이블

    ![syllaverse classinfo table 이미지](../practice_04/image/syllaverse_classinfo_table.png)

3. 역할 테이블
 
    ![syllaverse role table 이미지](../practice_04/image/syllaverse_role_table.png)

4. 강의 테이블
 
    ![syllaverse lectures table 이미지](../practice_04/image/syllaverse_lectures_table.png)

5. 과제 테이블

    ![syllaverse assignment table 이미지](../practice_04/image/syllaverse_assignment_table.png)

6. 과제 제출 목록 테이블

    ![syllaverse assignment_submit_states table 이미지](../practice_04/image/syllaverse_assignment_submit_states_table.png)

> ERD

![syllaverse ERD](image/syllaverse.drawio%20(1).png)


## 2. 대학교 학사 관리 시스템
> 문제 설명

- 대학교의 학사관리시스템 기능을 ERD를 자유롭게 그려보자.
- 주요 Entity는 학생, 교수, 교과목
- 교과목은 교양/전공으로 구분되며, 강좌코드가 있음
- 교과목은 매년, 학기별로 개설됨
  - 한 교과목당 여러 강의가 개설될 수 있음
  - 단, 한 강의당 한 명의 교수가 담당
  - ex) 마케팅 원론 - 홍길동 교수, 마케팅 원론 - 김철수 교수
- 학생은 강의를 수강신청하며, 여러 강의를 동시에 들을 수 있음

> 엑셀을 이용해 모델링 구상

1. 생명대 학생 기본 정보 테이블
   
   ![academic_biology_students_profile_table 이미지](image/academic_biology_students_profile_table.png)

2. 생명대 교수 기본 정보 테이블
   
   ![academic_biology_professors_profile_table 이미지](image/academic_biology_professors_profile_table.png)

3. 단과대 테이블
   
   ![academic_college_table 이미지](image/academic_college_table.png)

4. 전공 테이블
   
   ![academic_major_table 이미지](image/academic_major_table.png)

5. 강의실 테이블
   
   ![academic_lecture_room_table 이미지](image/academic_lecture_room_table.png)

6. 교과목 테이블
   
   ![academic_subject_table 이미지](image/academic_subject_table.png)

7. 2022학년도 1학기 개설교과목 테이블

   ![academic_개설교과목_table 이미지](image/academic_개설교과목_table.png)

8. 2022학년도 1학기 수강신청 테이블
   
   ![academic_수강신청_table 이미지](image/academic_수강신청_table.png)

> ERD

![academic_management_system ERD](image/academic_management_system.drawio.png)