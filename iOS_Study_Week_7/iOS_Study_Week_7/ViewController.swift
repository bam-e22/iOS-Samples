// https://home.openweathermap.org/api_keys
// 37.432142, 127.129375
// api.openweathermap.org/data/2.5/forecast?lat={lat}&lon={lon}
// http://api.openweathermap.org/data/2.5/forecast?lat=37.432142&lon=127.129375&appid=ce5589a939397afa66db9dc403d229f5&units=metric

import UIKit
import Alamofire
import RealmSwift

class ViewController: UITableViewController {
	
	let url: String = "http://api.openweathermap.org/data/2.5/forecast?lat=37.432142&lon=127.129375&appid=ce5589a939397afa66db9dc403d229f5&units=metric"

	var weatherDatas: [WeatherData] = []
	
	// Get the default Realm
	let realm = try! Realm()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		tableView.refreshControl = UIRefreshControl()
		tableView.refreshControl!.addTarget(self, action: #selector(handRefresh(_:)), for: .valueChanged)
		
		self.tableView.refreshControl!.beginRefreshing()
		
		weatherDataAlamofireLoad()
		
		print("ddd")
		print(NSHomeDirectory())
	}
	
	func handRefresh(_ sender: UIRefreshControl) {
		
		weatherDatas.removeAll()
		tableView.reloadData()
		
		DispatchQueue.main.asyncAfter(deadline: .now()+1) {
			self.weatherDataRealmLoad()
		}
	}
	
	override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
	
		return weatherDatas.count
	}
	
	override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

		let cell = tableView.dequeueReusableCell(withIdentifier: "defaultCell", for: indexPath)

		if let label = cell.contentView.subviews[0] as? UILabel {
			
			let weatherData: WeatherData = weatherDatas[indexPath.row]
			
			var text: String = "시간 : \(weatherData.time) \n"
			text += "온도 : \(weatherData.temp) \n"
			text += "최저온도 : \(weatherData.tempMin) \n"
			text += "최고온도 : \(weatherData.tempMax) \n"
			text += "최고온도 : \(weatherData.tempMax) \n"
			text += "상태 : \(weatherData.weather)"
			
			label.text = text;
		}
		
		return cell
	}
	
	func weatherDataRealmLoad() {
		
		weatherDatas.append(contentsOf: realm.objects(WeatherData.self))
		
		
		self.tableView.reloadData()
		self.tableView.refreshControl!.endRefreshing()
		
	}
	
	func weatherDataAlamofireLoad() {
		
		try! realm.write {
			realm.deleteAll()
		}
		
		Alamofire.request(url).responseJSON { response in
			//print("Request: \(String(describing: response.request))")   // original url request
			//print("Response: \(String(describing: response.response))") // http url response
			//print("Result: \(response.result)")                         // response serialization result
			
			if let json = response.result.value {
				//print("JSON: \(json)") // serialized json response
				
				if let d1 = json as? [String: Any] {
					
					if let list = d1["list"] as? [[String:Any]] {
						
						for item in list {
							
							var weatherData: WeatherData = WeatherData()
							
							// 시간
							if let dt_txt = item["dt_txt"] as? String {
								
								weatherData.time = dt_txt
								print(weatherData.time)
							}
							
							if let main = item["main"] as? [String:Any] {
								
								weatherData.temp = main["temp"] as! Double
								weatherData.tempMin = main["temp_min"] as! Double
								weatherData.tempMax = main["temp_max"] as! Double
								
								print(weatherData.temp)
								print(weatherData.tempMin)
								print(weatherData.tempMax)
							}
							
							if let weather = item["weather"] as? [[String:Any]] {
								
								weatherData.weather = weather[0]["main"] as! String
							}
							
							self.weatherDatas.append(weatherData)
							
							
							try! self.realm.write {
								
								self.realm.add(weatherData)
							}
						}
						
						
						self.tableView.reloadData()
						self.tableView.refreshControl!.endRefreshing()
					}
				}
			}
		} // ~ Alamofire Request
	}
}

class WeatherData : Object {
	
	dynamic var time: String = ""
	dynamic var temp: Double = 0.0
	dynamic var tempMin: Double = 0.0
	dynamic var tempMax: Double = 0.0
	dynamic var weather: String = ""
}

