//
//  ViewController.swift
//  SedinApp
//
//  Created by Deepak on 29/12/21.
//

import UIKit

class ViewController: UIViewController {

   
    let parser = Parser()
    var sedinJson : [UsersData] = []
    
    @IBOutlet weak var sedinUserListView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sedinUserListView.delegate = self
        sedinUserListView.dataSource = self
        
        self.loadData()
        
    }
    
    func loadData() {
        
        parser.parseSedinData { userDetailsJson in
            self.sedinJson = userDetailsJson
            DispatchQueue.main.async {
                self.sedinUserListView.reloadData()
            }
        }
    }
}


extension ViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sedinJson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell : DataCellTableViewCell = tableView.dequeueReusableCell(withIdentifier: "sedinCell") as! DataCellTableViewCell
        
        cell.sedinLoginName.text = self.sedinJson[indexPath.row].user.login
        cell.sedinUserLabel.text = self.sedinJson[indexPath.row].title
        
        cell.sedinUserImage.layer.masksToBounds = true
        cell.sedinUserImage.layer.cornerRadius = cell.sedinUserImage.bounds.width / 2
        
        DispatchQueue.global(qos: .background).async {
            
            let imageURL = self.sedinJson[indexPath.row].user.avatarURL
            let url = URL(string: imageURL)
            guard let imageurl = url else {return}
            
            if let data = try? Data(contentsOf: imageurl) {
                DispatchQueue.main.async {
                    cell.sedinUserImage.image = UIImage(data: data)
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120.0
    }
    
}
