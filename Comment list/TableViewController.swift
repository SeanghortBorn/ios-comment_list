//
//  TableViewController.swift
//  Comment list
//
//  Created by iMac-09 on 3/14/20.
//  Copyright © 2020 itc. All rights reserved.
//

import UIKit

class TableViewController: UIViewController {
    
    @IBOutlet weak var tblView: UITableView!
    
    
    let dataArray = ["data1", "data2", "data3"]
    var posts = [Posts]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Comment Data"

        let session = URLSession.shared
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            // Check the response
//            print(response)
            
            // Check if an error occured
            if error != nil {
                // HERE you can manage the error
//                print(error)
                return
            }
            
            // Serialize the data into an object
            do {
                let json = try JSONDecoder().decode([Posts].self, from: data! )
                    //try JSONSerialization.jsonObject(with: data!, options: [])
                //print(json)
                self.posts = json
                
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
        
        tblView.dataSource = self
        
        tblView.register(UINib(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
        
        tblView.tableFooterView = UIView()
        
        

    }
    
}



//title = "Fetch Data Comment"
//tableView.dataSource = self
//tableView.delegate = self
//
//tableView.tableFooterView = UIView()
//
//APIManager().get(url: "https://jsonplaceholder.typicode.com/comments") { (success, result) in
//    if success {
//        self.comments.removeAll()
//        self.comments = result
//        self.tableView.reloadData()
//    }
//}


extension TableViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        
        cell.profileImage.image = UIImage(named: "pandapo")
        
        cell.userName.text = posts[indexPath.item].body
        return cell
    }
    
    
}
