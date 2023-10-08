본 페이지는 NetChallenge10_Infra 부분에 해당합니다.

# K-디지털 챌린지 : NET 챌린지 캠프 시즌 10

## 주최: 과학기술정보통신부
## 주관: NIA 한국지능정보사회진흥원, KOREN 연구협력포럼
## 후원: LG유플러스, KT, SK 브로드밴드, 한국전자통신연구원(ETRI), TTA, KMA, NSR, SDNNFV 포럼


### 추진일정

+ 공모전 접수 및 선정: 5.22(월)~6.5(월), 6.23(금) 결과발표
+ 아이디어 및 개발 지원: 7월 ~ 11월
+ 중간 발표: 9월 14일 목요일, 발표자: 노설 (PPT발표 1회, 시연영상 발표 2회)
+ 최종 평가 및 시상: 11월


### 1. Make Image using Dockerfile 
```
docker build --tag seolroh/netchallenge:{version} .
``````
### 2. Push Docker Image in DockerHub
```
docker push seolroh/netchallenge:{version}
```

### 3. Using Docker Image
```
docker run -v ~/ai/NetChallenge10/dataset:/root/dataset seolroh/netchallenge:{version}
```
### 3-1 HPC Server: NVIDIA 
```
docker run -d --gpus all -v ~/dataset:/root/dataset seolroh/netchallenge:{version}
``````
### 4. Execute Docker Container
```
docker exec -it {containerid} /bin/bash
```

### 5. in container
```
sh working.sh
```