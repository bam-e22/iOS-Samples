//
//  ViewController.swift
//  iOS_Study_Week_8
//
//  Created by 권병수 on 2017. 9. 30..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage
import RealmSwift

class ViewController: UIViewController {
	
	var imageView : UIImageView!
	let url = "http://www.devwon.com/andstudy/list/1";
	
	let realm = try! Realm();
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		/*
		let width = 200
		let height = 200
		let rect = CGRect(x: Int(self.view.frame.width)/2 - width/2, y: Int(self.view.frame.height)/2 - height/2, width: width, height: height)
		
	    self.imageView = UIImageView(frame: rect)
		self.view.addSubview(imageView)
		
		let url: String = "https://store.storeimages.cdn-apple.com/4974/as-images.apple.com/is/image/AppleInc/aos/published/images/i/ph/iphone/x/iphone-x-gallery3-2017?wid=835&hei=641&fmt=jpeg&qlt=95&op_sharpen=0&resMode=bicub&op_usm=0.5,0.5,0,0&iccEmbed=0&layer=comp&.v=1504742326385"
		
		print(url)
		
		Alamofire.request(url).responseImage { response in
			debugPrint(response)
			
			print(response.request)
			print(response.response)
			debugPrint(response.result)
			
			if let image = response.result.value {
				print("image downloaded: \(image)")
				
				self.imageView.image = image.af_imageRounded(withCornerRadius: 25.0)
			}
		}
		*/
		
		try! realm.write {
			realm.deleteAll()
		}
		
		Alamofire.request(url).responseJSON { (response) in
			
			let decoder = JSONDecoder()
			var products: [Product]?
			do {
			
				products = try decoder.decode([Product].self, from: response.data!)
			} catch {
			}
			
			try! self.realm.write {
			
				products?.forEach({
					self.realm.add($0)
				})
				
			}
			print(products)
			print(NSHomeDirectory())
			
			
			
			
			//let resultProduct = self.realm.objects(Product.self).filter("idx == 2")
			let resultProduct = self.realm.objects(Product.self)
			print(resultProduct[0].name)
		}
	}
}

class Product : Object, Decodable {
	
	@objc dynamic var idx: Int = 0
	@objc dynamic var name: String = ""
	
	/*
	override static func primaryKey() -> String? {
		return "idx"
	}
*/
}

