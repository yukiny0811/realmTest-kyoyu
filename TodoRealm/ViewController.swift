//
//  ViewController.swift
//  TodoRealm
//
//  Created by クワシマ・ユウキ on 2020/09/21.
//  Copyright © 2020 クワシマ・ユウキ. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController, UITextFieldDelegate {
    
    private var realm: Realm!
    
    @IBOutlet var titleTextField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleTextField.delegate = self
        
        realm = try! Realm()
    }
    
    @IBAction func cancel(){
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func save(){
        let item = Item()
        item.title = titleTextField.text
        item.date = datePicker.date
        try! realm.write(){
            realm.add(item)
        }
        self.dismiss(animated: true, completion: nil)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }


}

