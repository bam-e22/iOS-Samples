iOS - Swift Practice Repository
=========================

### 1. TopSong With JSON
  - Json Parsing
	- json : [http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json](http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json)
	- [http://stack07142.tistory.com/84](http://stack07142.tistory.com/84)

<img src="./img/TopSong25.png" width="280" height="498">

### 2. Sample_Layout
- Layout(code)
	- UIColor
	- Layout constraint
	- addSubView

### 3. iOS_Study_Week_1
- LaunchScreen.storyboard, Main.storyboard
- Layout Constraints
- UIViews(UILabel, UIButton, UITextView)
- IBOutlet, IBAction

### 4. iOS_Study_Week_2
- Sign-In Form Example
	- ImageView
	- StackView
	- Dialog
	- Regular expression
	- Gesture Recognizer
	- UITextFieldDelegate
	- FirstResponder 

### 5. iOS_Study_Week_3
- TableView
	- UITableViewCell

- 화면 전환(Segue)
	- Action Segue
	- Manual Segue
		- performSegue
		- prepare(화면 전환 시 데이터 전달)
		- unWind

- Button이 아닌 View에 리스너 달기
	- extension

- Cocoapod + Toast_Swift 라이브러리 사용

### 6. iOS_Study_Week_4
- TableView를 UITableViewController를 이용하지 않고 사용해보기
	- 채팅 형식 구현
- ScrollView

### 7. iOS_Study_Week_5
- 키패드 처리
	- 여백 터치 시 키패드 닫기
	- 키패드 열릴 때 뷰 움직이기
- TableView 채팅 예제에서 TableView 새로고침


### 8. iOS_Study_Week_6
- ScrollView Paging


### 9. iOS_Study_Week_7
- Swift4 & Xcode9 변경사항 체크
- Realm
- Alamofire
- 날씨앱 만들기
	- openweathermap.org Open API
        - Alamofire를 이용하여 날씨 데이터를 받아온 후 JSON parsing해서 TableView에 표시
	- Realm 사용해보기

### 10. iOS_Study_Week_8
- Xcode9
- Swift4
	- JSON Encoder, Decoder
- Realm
	- Realm Browser 사용해보기
- AlamofireImage 사용해보기




### TO-DO

- Realm
	- Singleton 패턴의 RealmManager 클래스를 만들어 사용하기
	- 쿼리를 이용하여 특정 데이터만 가져오기
	- DispatchQueue를 사용한 백그라운드 처리
	- Realm에 사용할 클래스 내부에 배열도 추가해보기?

- SwiftyJSON
	- Alamofire 응답형태 중 JSON 데이터를 조금 더 짧은 코드로 다뤄보기

- 날씨 앱
	- 프로젝트 생성
	- iOS 폰에 직접 실행해보기
	- 라이브러리 연결(Alamofire, Realm, SwiftyJSON
	- extension을 사용하여 UIAlertController, Alamofire 코드 단순화
	- Splash 화면 (네트워크 상태 체크)
	- 메인 화면 (지역리스트, UITableView)














