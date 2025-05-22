# front

A new Flutter project.

# 0. 담당한 기능 개발 및 구현 기술
- **플랫폼 및 개발 언어**: Flutter (Dart)
- **개발 환경**: VSCode 및 Android Studio
- **테스트 환경**: iPhone 14 에뮬레이터
- **주요 UI 개발**: Flutter 위젯 기반 화면 구성 및 스타일링
- **백엔드 통신**: 단순 HTTP GET 요청으로 JSON 수신 후 파싱

# 1. 프로젝트 명
**싸게가게 – 착한 가격 업소 홍보 서비스**

# 2. 배경 및 문제
- ‘착한가격업소’ 지정 업소에 대한 **낮은 인지도** → 홍보 부진  
- 이용후기(2019~) 총 22건에 불과, **정보 업데이트 미흡**  
- **싼 가격에 대한 품질 불신**으로 소비자 선호도 하락  
- 향후 확대를 고려한 **출발지 선정**:  
  - 경부선·호남선 모두 지나는 유일한 도시, 대전  
  - 유동 인구 많고 2030 비중 높은 지역
- 시나리오 플로우
  <img width="710" alt="image" src="https://github.com/user-attachments/assets/efd5c25a-5776-4cc0-9c29-74e3a6898289" />


# 3. 목표
- ‘착한가격업소’를 한눈에 모아 보여주고, **손쉬운 접근성** 제공  
- **정보 수정 요청** 기능으로 최신화 유지  
- **가격 비교·리뷰**로 품질 불신 해소  
- 대전 시민과 여행객에게 **합리적 소비 경험** 선사  

# 4. 팀 구성
- **기획·발표**: 박현솔
- **디자인**: 김혜림
- **프론트 개발**: 김정환
- **백엔드 개발**: 유재영

# 6. 기대 효과
- 지역 경제 활성화 및 **착한업소 소비 유도**  
- 업소 폐업 감소 – 정부 지원에만 의존 않는 **지속 가능한 운영**  
- 서비스 전문성 확대 시 **소비자 단체 추천**·신규 업소 지정 가능  
- **제휴 이벤트(쿠폰 등)**를 통한 추가 홍보 채널 확보  

# 7. 구현 내용
- **홈 화면**: 지역 선택, 리스트·검색·필터·정렬
- <img width="275" alt="image" src="https://github.com/user-attachments/assets/936bcc9d-622d-4626-a07e-2f63792d9003" />
- **가게 상세 보기**: 영수증 인증 마크, 시세 비교, 리뷰·추천
- <img width="273" alt="image" src="https://github.com/user-attachments/assets/d23b1569-45f4-4671-a3a9-5f2670609f87" />
- **후기 작성 페이지**  
  <div style="text-align:center">
    <img src="https://github.com/user-attachments/assets/d5a22cb9-5d5c-49df-8778-251dd660c36a" width="150" />
    <img src="https://github.com/user-attachments/assets/ff018a36-9e36-4031-a95a-911b92d7014e" width="150" />
    <img src="https://github.com/user-attachments/assets/7f1a8a26-53bd-4448-b543-32e4cc2fcd1e" width="150" />
  </div>
  <div style="text-align:center; margin-top:8px;">
    <img src="https://github.com/user-attachments/assets/021c826c-1ede-476a-8a18-6a564ae1c6c1" width="150" />
    <img src="https://github.com/user-attachments/assets/1a94d909-2757-48e8-bdd3-e407fbbf997d" width="150" />
  </div>
- **브랜딩 적용**: 태그 모티프, 그린 메인 컬러, 2030 타깃 UI  


## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
