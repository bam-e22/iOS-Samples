import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
	
	let ID_REGEX = "[A-Za-z0-9]{8,16}"
	let PASSWD_REGEX = "(?=.*[a-zA-Z])(?=.*[0-9]).{8,16}"
	let NAME_REGEX = "[가-힣]{2,30}"
	let EMAIL_REGEX = "[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\\.]?[0-9a-zA-Z])*\\.[a-zA-Z]{2,3}"
	
	@IBOutlet weak var tf_id: UITextField!
	@IBOutlet weak var tf_pw: UITextField!
	@IBOutlet weak var tf_name: UITextField!
	@IBOutlet weak var tf_email: UITextField!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// 다른 밖의 영역 클릭 시 키패드 숨기기
		let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap(gesture:)))
			
		self.view.addGestureRecognizer(gestureRecognizer)
		
	}
	
	func handleTap(gesture: UITapGestureRecognizer) {
		
		if tf_id.isFirstResponder {
			
			tf_id.resignFirstResponder()
		} else if tf_pw.isFirstResponder {
			
			tf_pw.resignFirstResponder()
		} else if tf_name.isFirstResponder {
			
			tf_name.resignFirstResponder()
		} else if tf_email.isFirstResponder {
			
			tf_email.resignFirstResponder()
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func onClick(_ sender: Any) {
		
		if tf_id.text?.characters.count == 0 {
			
			showAlert(title: "에러", message: "아이디를 입력하세요", completion: nil)
		}
		
		else if (!(tf_id.text!.match(pattern: ID_REGEX))) {
			
			showAlert(title: "에러", message: "아이디는 영문, 숫자 조합 8~16자", completion: nil)
		}
		
		else if tf_pw.text?.characters.count == 0 {
			
			showAlert(title: "에러", message: "패스워드를 입력하세요", completion: nil)
		}

		else if tf_name.text?.characters.count == 0 {
			
			showAlert(title: "에러", message: "이름을 입력하세요", completion: nil)
		}
			
		else if tf_email.text?.characters.count == 0 {
			
			showAlert(title: "에러", message: "이메일을 입력하세요", completion: nil)
		}
		
		else {
			
			showAlert(title: "가입", message: "성공적으로 가입되셨습니다", completion: nil)
		}
		
		
		/*
		let dialog = UIAlertController(
			title: "제목",
			message: "내용",
			preferredStyle: UIAlertControllerStyle.alert)
		
		dialog.addTextField { textField in
			textField.placeholder = "값 입력"
		}
		
		dialog.addTextField { textField in
			textField.placeholder = "값 입력"
		}
		
		dialog.addTextField { textField in
			textField.placeholder = "값 입력"
		}
		
		dialog.addAction(UIAlertAction(
			title: "확인",
			style: .default,
			handler: { action in
				print("press 확인")
				if let textField = dialog.textFields?[0] {
					
					print("값 = " + textField.text!)
				}
		}))
		
		dialog.addAction(UIAlertAction(
			title: "취소",
			style: .default,
			handler: { action in
				print("press 취소")
		}))
		
		present(dialog, animated: true,
		        completion: {
					print("AlertController 닫힘")
		})
*/
	}
	
	private func showAlert(title: String, message: String, completion:((UIAlertAction) -> Void)?) {
		
		let dialog = UIAlertController(
			title: title,
			message: message,
			preferredStyle: UIAlertControllerStyle.alert)
		
		dialog.addAction(UIAlertAction(
			title: "확인",
			style: .default, handler: completion
		))
		
		present(dialog, animated: true,
		        completion: nil)
	}
	
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		
		if textField.isEqual(tf_id) {
			
			tf_pw.becomeFirstResponder()
		}
		
		return true
	}
}

extension String {
	func match(pattern:String) -> Bool {
		let regex = try! NSRegularExpression(pattern: pattern, options: [])
		
		let matches = regex.matches(in: self, options: [], range: NSRange(location:0,length:characters.count))
		
		return matches.count > 0
	}
}
