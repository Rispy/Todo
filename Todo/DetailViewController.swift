//
//  DetailViewController.swift
//  Todo
//
//  Created by 杨艾平 on 16/3/22.
//  Copyright © 2016年 yap. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var childButton: UIButton!
    
    @IBOutlet weak var phoneButton: UIButton!
    
    @IBOutlet weak var shoppingCardButton: UIButton!
    
    @IBOutlet weak var travelButton: UIButton!
    
    @IBOutlet weak var todoItem: UITextField!
    
    @IBOutlet weak var todoDate: UIDatePicker!
    
    var todo: TodoModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        todoItem.delegate = self
        
        if (todo == nil) {
            childButton.selected = true
            navigationController?.title = "新增Todo"
        } else {
            navigationController?.title = "修改Todo"
            
            if (todo?.image == "child-selected") {
                childButton.selected = true
            } else if (todo?.image == "shopping-cart-selected") {
                shoppingCardButton.selected = true
            } else if (todo?.image == "phone-selected") {
                phoneButton.selected = true
            } else if (todo?.image == "travel-selected") {
                travelButton.selected = true
            }
            
            todoItem.text = todo?.title
            todoDate.setDate((todo?.date)!, animated: false)
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func resetButton(){
        childButton.selected = false;
        phoneButton.selected = false;
        shoppingCardButton.selected = false;
        travelButton.selected = false;
    }
    
    @IBAction func childTipped(sender: AnyObject) {
        resetButton()
        childButton.selected = true;
    }
    
    @IBAction func phoneTipped(sender: AnyObject) {
        resetButton()
        phoneButton.selected = true;
    }
    
    @IBAction func shoppingCartTipped(sender: AnyObject) {
        resetButton()
        shoppingCardButton.selected = true;
    }
    
    @IBAction func travelTipped(sender: AnyObject) {
        resetButton()
        travelButton.selected = true;
    }
    
    @IBAction func confirmTipped(sender: AnyObject) {
        var image = ""
        if (childButton.selected) {
            image = "child-selected"
        } else if (phoneButton.selected) {
            image = "phone-selected"
        } else if (shoppingCardButton.selected) {
            image = "shopping-cart-selected"
        } else if (travelButton.selected) {
            image = "travel-selected"
        }
        if (todo == nil) {
            let uuid = NSUUID().UUIDString
            todo = TodoModel(id: uuid, image: image, title: todoItem.text!, date: todoDate.date)
            todos.append(todo!)
        } else {
            todo?.image = image
            todo?.title = todoItem.text!
            todo?.date = todoDate.date
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesEnded(touches: Set<UITouch>, withEvent event: UIEvent?) {
        todoItem.resignFirstResponder()
    }
}
