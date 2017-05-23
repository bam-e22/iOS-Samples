//
//  ViewController.swift
//  TopsongWithJSON
//
//  Created by 권병수 on 2017. 1. 18..
//  Copyright © 2017년 stack. All rights reserved.
//

import UIKit

struct SongInfo {
    
    var title : String?
    var image : String?
}

class ViewController: UIViewController, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    // Apple - Top 25 songs RSS (JSON)
    let urlStr = "http://ax.itunes.apple.com/WebObjects/MZStoreServices.woa/ws/RSS/topsongs/limit=25/json"

    // Song List
    var songList = [SongInfo]()
    
    // tableView - numberOfRowsInSection
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return songList.count
    }
    
    // tableView - cellForRowAt
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     
        let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath)
        let song = songList[indexPath.row]
        
        cell.textLabel!.text = song.title
        
        if let url = URL(string: song.image!) {
            
            let request = URLRequest(url: url)
        
            if let cached = URLCache.shared.cachedResponse(for: request) {
                
                let image = UIImage(data: cached.data)
                cell.imageView?.image = image
            }
            else if let data = try? Data(contentsOf: url) {
                
                let image = UIImage(data: data)
                cell.imageView?.image = image
            }
            else {
                
                print("Invalid image")
            }
        }
        
        return cell
    }
    
    public func parseJSON() {
        
        if let url = URL(string: urlStr),
            let data = try? Data(contentsOf: url) {
            
            do {
                
                // JSON 파싱
                if let result = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any],
                    let feed = result["feed"] as? [String:Any],
                    let entry = feed["entry"] as? [ [String:Any] ] {
                    
                    for one in entry {
                        
                        var song = SongInfo()
                        
                        // title
                        if let titleNode = one["title"] as? [String:AnyObject],
                            let title = titleNode["label"] as? String {
                            
                            song.title = title
                        }
                        
                        // image
                        if let imageNode = one["im:image"] as? [ [String:AnyObject] ], // Dictionary의 배열
                            let image = imageNode[0]["label"] as? String {
                            song.image = image
                        }
                        
                        songList.append(song)
                    }
                    
                    tableView.reloadData()
                }
                
            } catch let error {
                
                print("Error: \(error)")
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        parseJSON()
    }
}

