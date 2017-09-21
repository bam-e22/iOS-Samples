import UIKit

class ViewController: UIViewController {

	var scrollView: UIScrollView!
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		// UIScrollView를 코드로 바인딩
		scrollView = self.view.subviews[0] as! UIScrollView
		
		// 이미지 이름 상수 배열
		let imageNames: [String] = [
		
			"ic_3d_rotation_48pt",
			"ic_accessibility_48pt",
			"ic_accessible_48pt",
			"ic_account_balance_48pt",
			"ic_account_balance_wallet_48pt"
		]
		
		// 이미지 5개에 대한 UIImageView 생성
		var imageViews: [UIImageView] = []
		for imageName in imageNames {
			
			let image: UIImage = UIImage(named: imageName)!
			let imageView: UIImageView = UIImageView(image: image)
			imageView.contentMode = .scaleAspectFit
			imageView.translatesAutoresizingMaskIntoConstraints = false
			imageViews.append(imageView)
		}
		
		var constraints: [NSLayoutConstraint] = []
		for imageView in imageViews {
			
			// scrollView에 imageView를 자식으로 추가
			scrollView.addSubview(imageView)
			
			// Constraints 생성
			constraints.append(imageView.topAnchor.constraint(equalTo: scrollView.topAnchor))
			constraints.append(imageView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor))
			constraints.append(imageView.heightAnchor.constraint(equalTo: scrollView.heightAnchor))
			constraints.append(imageView.widthAnchor.constraint(equalTo: scrollView.widthAnchor))
		}
		
		// 가로 스크롤 페이징을 위한 제약조건 추가
		constraints.append(imageViews[0].leadingAnchor.constraint(equalTo: scrollView.leadingAnchor))
		
		for i in 1..<imageViews.count {
			
			constraints.append(imageViews[i-1].trailingAnchor.constraint(equalTo: imageViews[i].leadingAnchor))
		}
		
		constraints.append(imageViews[imageViews.count-1].trailingAnchor.constraint(equalTo: scrollView.trailingAnchor))
		
		// 제약조건 적용
		NSLayoutConstraint.activate(constraints)
		
	}
}

