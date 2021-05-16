//
//  MainTableViewController.swift
//  TodoRealm
//
//  Created by クワシマ・ユウキ on 2020/09/21.
//  Copyright © 2020 クワシマ・ユウキ. All rights reserved.
//

import UIKit
import RealmSwift

class MainTableViewController: UITableViewController{
    
    private var realm: Realm!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.tableView.reloadData()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        realm = try! Realm()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let objs: Results<Item> = realm.objects(Item.self)
        return objs.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let titleLabel = cell.viewWithTag(1) as! UILabel
        let dateLabel = cell.viewWithTag(2) as! UILabel
        
        let objs: Results<Item> = realm.objects(Item.self)
        
        titleLabel.text = objs[indexPath.row].title
        dateLabel.text = objs[indexPath.row].date?.toString()

        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60.0
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCell.EditingStyle.delete{
            
            let item = realm.objects(Item.self)[indexPath.row]
            try! realm.write(){
                realm.delete(item)
            }
            
            self.tableView.deleteRows(at: [indexPath as IndexPath], with: UITableView.RowAnimation.automatic)
        }
    }

}

extension Date{
    func toString() -> String?{
        let formatter = DateFormatter()
        formatter.calendar = Calendar(identifier: .gregorian)
        formatter.dateFormat = "yyyy/MM/dd"
        return formatter.string(from: self)
    }
}
