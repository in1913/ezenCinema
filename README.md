# EzenCinema

<p align="center">
  <img width="250" src="https://github.com/in1913/ezenCinema/assets/125331815/b9270a91-559e-460f-b115-44b98bd575a8">
</p>




# EzenCinema v1.1.0
> **이젠아카데미 컴퓨터학원 풀스택 개발자A반 / 웹 디자인 A반** <br/> **개발기간: 2023.05.03 ~ 2023.06.09**

## 배포 주소

> **도메인** : [https://www.ezencinema.com](https://www.ezencinema.com) <br>

<br>

## 웹개발팀 소개
 
| 서택상 | 최인영 | 허정현 | 김병기 |                                                                                                              
| :------: | :------: | :------: | :------: | 
|   <img width="160px" src="https://avatars.githubusercontent.com/u/125331815?s=400&u=e23cb4ca40c2b0cea5795623d57de1145929262b&v=4" />    |                      <img width="160px" src="https://avatars.githubusercontent.com/u/36881702?v=4" />    |                   <img width="160px" src="https://avatars.githubusercontent.com/u/125331780?v=4"/>   |                   <img width="160px" src="https://avatars.githubusercontent.com/u/125331844?v=4"/>   |
|   [@TaeksangSeo](https://github.com/JefferySeo)   |    [@InyoungChoi](https://github.com/ChaeyeonSeo)  | [@JunghyunHur](https://github.com/JunghyunHUR)  | [@ByeonggiKim](https://github.com/bk4533)  |
| Database / Back-end / Front-end | Server / Back-end / Front-end | Back-end / Front-end | Front-end |

<br>

## 디자인팀 소개

|      김보현       |          안시온         |       김민주         |                                                                                                               
| :------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------: | :---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------: | 
|   <img width="160px" src="https://avatars.githubusercontent.com/u/133757374?v=4" />    |                      <img width="160px" src="https://avatars.githubusercontent.com/u/133757349?v=4" />    |                   <img width="160px" src="https://avatars.githubusercontent.com/u/133757358?v=4"/>   |
|   [@BohyeonKim](https://github.com/bohyeon0103)   |    [@SionAhn](https://github.com/sion0520)  | [@MinjuKim](https://github.com/minju011203)  |
| &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Design / Publishing  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Design / Publishing &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Design / Publishing &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;|

<br>

## 프로젝트 소개

이젠시네마는 Team EzenCinema의 팀원들이 수강했던 이젠아카데미컴퓨터학원의 [EZEN] 을 따서 만든 영화관 웹사이트이며,<br>
이젠아카데미컴퓨터학원 김포캠퍼스 최초의 개발자반과 웹디자인반의 합작 프로젝트입니다.

<br>

## 시작 가이드
### Requirements
For building and running the application you need:

- [Eclipse IDE](https://www.eclipse.org/downloads/download.php?file=/oomph/epp/2023-06/R/eclipse-inst-jre-win64.exe)
- [apache tomcat9](https://tomcat.apache.org/download-90.cgi)

### Installation
``` bash
$ git clone https://github.com/in1913/ezenCinema.git
$ cd ezenCinema
```


---
<br>

## Stacks 🐈

### Environment
<div align="left">
  <img src="https://img.shields.io/badge/Eclipse IDE-2C2255?style=for-the-badge&logo=EclipseIDE&logoColor=white" />
  <img src="https://img.shields.io/badge/Git-F05032?style=for-the-badge&logo=Git&logoColor=white" />
  <img src="https://img.shields.io/badge/GitHub-181717?style=for-the-badge&logo=GitHub&logoColor=white" />
</div>             

### Config
![npm](https://img.shields.io/badge/npm-CB3837?style=for-the-badge&logo=npm&logoColor=white)        

### Development
<div align="left">
  <img src="https://img.shields.io/badge/Java-007396?style=for-the-badge&logo=Conda-Forge&logoColor=white" />
  <img src="https://img.shields.io/badge/CSS3-1572B6?style=for-the-badge&logo=CSS3&logoColor=white"/>
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?style=for-the-badge&logo=JavaScript&logoColor=white"/>
  <img src="https://img.shields.io/badge/jQuery-0769AD?style=for-the-badge&logo=jQuery&logoColor=white"/>
  <img src="https://img.shields.io/badge/Oracle Cloud-F80000?style=for-the-badge&logo=Oracle&logoColor=white" />
  <img src="https://img.shields.io/badge/MySQL-4479A1?style=for-the-badge&logo=MySQL&logoColor=white" />
</div> 


---
<br>

## 주요 기능 📦

### ⭐️ Oracle Cloud 서버에 웹사이트 실제 운영
- Oracle Cloud 발신 전용 전자 메일 구성
- Docker 컨테이너로 MySQL, Tomcat 서버 실행
- Docker 컨테이너 Nginx Proxy Manager를 이용하여 프록시, SSL 연결 (HTTPS)

### ⭐️ Jsp, Java Servlet 이용하여 tomcat 서버 구성
- 로그인, 회원가입, 프로필 수정 기능, 프로필 이미지 업로드, 영화 리뷰 등록, 영화 좋아요, 리뷰 좋아요 구현
- 영화 예매, 상품 구매, 상품 장바구니 담기 구현
- Java로 메일 인증 코드 전송 및 JavaScript로 인증 구현
- 카카오, 네이버, 구글 Oauth를 이용하여 싱크로 로그인 구현, 우편번호 검색 구현

### ⭐️ MySQL을 활용하여 데이터베이스 설계
- 상영관, 영화 목록, 상영, 예매 table
- 회원, 좋아요, 리뷰 table
- 스토어, 장바구니, 구매내역 table

---
<br>

## 화면 구성 📺

| 메인 페이지 | 영화 목록 | 영화 상세 |
| :----: | :----: | :----: |
| <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/bae1e21f-fb6d-4250-800d-5fb65e89fcb5"/> |  <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/fb36a148-dda8-40ef-be91-8fadabaf838c"/>  |  <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/6bd85ef8-5f43-45d1-bba3-2bc5a094ecec"/>  | 
| 영화 예매 | 로그인 / 마이페이지 | 회원정보 찾기 |
| <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/23d281e8-fd09-49a3-ac14-6a4ced22cd8a"/><img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/4597b8b8-7713-48f7-b069-bcec14a98482"/>  |  <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/b52a91e4-ec60-4667-8d70-0995cc2e09ce"/><img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/cd781556-139d-452e-a7c2-4b3d638b3d3c"/>  |  <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/3af4f8ee-8558-4e77-9bed-de2280dec0e5"/><img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/2757a499-f832-4aca-ab3a-534ca75a385f"/>  | 
| 회원가입 | 스토어 | 상품 구매 |
| <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/e83f8f2c-34e5-47a9-ae40-c31b04015fce"/> |  <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/d25d8f2d-a87f-4780-a50a-3e0b9d9daae6"/>  |  <img width="300" src="https://github.com/in1913/ezenCinema/assets/125331815/7c819e73-8926-4685-b3b6-60f4f74e3c93"/>  | 





---
<br>

## 아키텍쳐

### 디렉토리 구조

<details>
  <summary>
    <h4>show</h4>
  </summary>
  <div markdown="1">
    
```bash

📦ezenCine
 ┣ 📂.settings
 ┣ 📂src
 ┃ ┣ 📂main
 ┃ ┃ ┣ 📂.vscode
 ┃ ┃ ┣ 📂java
 ┃ ┃ ┃ ┣ 📂com
 ┃ ┃ ┃ ┃ ┗ 📂ezenCine  : Servlet Package
 ┃ ┃ ┃ ┗ 📂ezenCine  : DTO, DDL 메소드 Package
 ┃ ┃ ┣ 📂resources
 ┃ ┃ ┗ 📂webapp
 ┃ ┃ ┃ ┣ 📂css
 ┃ ┃ ┃ ┣ 📂images
 ┃ ┃ ┃ ┣ 📂include 
 ┃ ┃ ┃ ┃ ┣ 📜advertise.jsp  : footer 위에 붙는 랜덤 광고배너
 ┃ ┃ ┃ ┃ ┣ 📜footer.jsp  
 ┃ ┃ ┃ ┃ ┣ 📜header.jsp
 ┃ ┃ ┃ ┃ ┣ 📜listbanner.jsp  : 영화 목록 상단 랜덤배너
 ┃ ┃ ┃ ┃ ┗ 📜patchnotes.jsp  : 메인페이지에 노출되는 패치노트
 ┃ ┃ ┃ ┣ 📂js
 ┃ ┃ ┃ ┣ 📂mem  : 회원 관련 jsp파일 폴더
 ┃ ┃ ┃ ┣ 📂META-INF  : 데이터베이스 관련 정보 폴더
 ┃ ┃ ┃ ┣ 📂movie  : 영화 관련 jsp파일 폴더
 ┃ ┃ ┃ ┣ 📂plan
 ┃ ┃ ┃ ┣ 📂store  : 스토어 관련 jsp파일 폴더
 ┃ ┃ ┃ ┣ 📂team
 ┃ ┃ ┃ ┣ 📂upload
 ┃ ┃ ┃ ┃ ┗ 📂users  : 회원 프로필사진 저장 폴더
 ┃ ┃ ┃ ┣ 📂WEB-INF
 ┃ ┃ ┃ ┃ ┣ 📂lib
 ┃ ┃ ┃ ┃ ┗ 📜web.xml
 ┃ ┃ ┃ ┣ 📜index.jsp
 ┃ ┃ ┃ ┣ 📜main.jsp
 ┃ ┃ ┃ ┣ 📜signup.jsp
 ┃ ┃ ┃ ┗ 📜signupSns.jsp
 ┃ ┗ 📂test
 ┃ ┃ ┣ 📂java
 ┃ ┃ ┗ 📂resources
 ┣ 📂target
 ┃ ┣ 📂classes
 ┃ ┣ 📂generated-sources
 ┃ ┣ 📂generated-test-sources
 ┃ ┣ 📂m2e-wtp
 ┃ ┗ 📂test-classes
 ┣ 📂Users
 ┣ 📜.classpath
 ┣ 📜.project
 ┗ 📜pom.xml

```

    
  </div>
</details>


