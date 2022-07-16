# MarketKurly
## 케이스 스터디 3주차 과제(TableView 공부하기)
- TableView에 대한 이해, Delegate와 Datasource 공부하기
- 마켓컬리 앱 클론코딩
- Constraint와 색을 정확하게 구현하기 힘들다고 판단하여 최대한 비슷하게 구현
- 상단 탭바와 같은 기능을 구현하기 위해 `PagingKit` 이라는 라이브러리 사용
- TableView Cell 안에 CollectionView를 넣을 수 있다는 사실을 알고 연습

## 결과

<details>
  <summary> 스토리보드 </summary>
  <div markdown="0">
  
  ![스토리보드](https://user-images.githubusercontent.com/75382687/179218458-c3f844e8-a1e7-47e5-b4c4-4e711ced710a.png)

  </div>
</details>

<br>

## 실행 화면 비교

|MarketKurly|Clone|
|---|---|
|![마켓컬리](https://user-images.githubusercontent.com/75382687/179218513-275c566d-ec03-4c77-95c5-2d19ae89ea85.gif)|![클론코딩](https://user-images.githubusercontent.com/75382687/179218516-9a99fef4-3256-4ebc-a758-6b9943bb8efd.gif)|

## iPhone 8 / iPhone 13 Pro Max

|iPhone 8|iPhone 13 Pro Max|
|---|---|
|![아이폰8](https://user-images.githubusercontent.com/75382687/179218525-5f7d4c0d-8101-4a44-a06d-e49dcd71750b.gif)|![아이폰13프로맥스](https://user-images.githubusercontent.com/75382687/179218538-71540f41-a826-471e-ab48-5e32b8e4431b.gif)|

<br>

## 라이브러리
- PagingKit

<br>

## 새로 알게된 점

- TableView 속 CollectionView
  - TableView Cell에 CollectionView를 넣고, CollectionView Cell을 관리할 수 있다.
  - TableView의 awakeFromNib() 에서 기초 설정을 해준다. (스토리보드 기준)

- 이미지 자동 슬라이드
  - CollectionView와 Timer, ScrollTo 함수를 사용한다.
  - CollectionView의 이미지들을 시간이 지남에 따라 넘어가게 할 수 있다.

<br>

## 느낀 점

- PagingKit에 대한 정보가 너무 없어서 처음에 시간이 조금 오래 걸렸다.
- TableView에 CollectionView를 넣어 스크롤이 가능한 여러 뷰를 쉽게 사용할 수 있을 것 같다.
