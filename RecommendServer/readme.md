# 추천 서버 설명서
이 서버는 Spring으로 만든 서버와 통신하여 업체 번호와 이미지 등의 정보를 가져와 머신러닝 라이브러리인 scikit-learn과 이미지 분석 라이브러리인 opencv를 이용해 이미지가 비슷한 업체를 추천해주는 서버입니다.

## 필요 라이브러리
- Flask
- urllib
- numpy
- opencv-python
- scikit-learn (앞에 -U 붙혀서)

이 서버를 작동시키기 위해서 설치해야하는 라이브러리(모듈) 입니다. 가상 환경을 만들어 pip install (모듈 이름) 을 이용하여 설치한 후 실행해주세요.

## 실행
server.py를 실행시켜주시면 됩니다.  
실행시켜 주시면 해당 컴퓨터의 8585 포트로 서버가 실행되도록 설정되어있습니다.   
기능들은 REST API로 되어있습니다.

## 기능
- 메인 화면 (/) - GET     
메인 화면입니다. 데이터가 어떻게 구분되고 있는지 간단히 확인해볼 수 있는 페이지입니다.  
수신 데이터 : 없음      
송신 데이터 : 이미지 그룹화 결과 화면 (HTML)

- 데이터 초기화 (/init) - GET     
서버를 초기화 합니다. Spring 서버와 통신하여 모든 업체 정보를 받아온 뒤, 이미지를 분석하여 분석한 결과를 json 파일로 저장합니다.    
수신 데이터 : 없음
송신 데이터 : 결과값, {"success":True}만 보내주게 되어있음 (JSON)

- 데이터 추가(/add) - POST   
업체 정보를 추가합니다. 추가시 자동으로 저장, 변환, 분석을 합니다.  
수신 데이터 : {Company 번호(id), 도시(city), 분류(sort), 이미지(url)} (JSON)    
송신 데이터 : 결과값, {"success":True}만 보내주게 되어있음 (JSON)

- 추천 데이터 받아오기(/get/\<id>/\<city>/\<sort>) - GET      
해당 업체와 비슷한 업체를 가져옵니다.   
수신 데이터 : Company 번호(id), 도시(city), 분류(sort) (파라미터)   
송신 데이터 : {id:[업체 id 리스트]} (JSON)

## URL 위치
Spring에서 Flask - indexController의 recommendServerURL 을 수정해주시면 됩니다.     
Flask에서 Spring - server.py의 맨 위의 server_url 을 수정해주시면 됩니다.