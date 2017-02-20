//
//  ViewController.swift
//  Collection Types
//
//  Created by LT Carbonell on 2/19/17.
//  Copyright © 2017 LT Carbonell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var removeItem: UITextField!
    @IBOutlet weak var newItem: UITextField!
    @IBOutlet weak var shoppingList: UITextView!
    
    
    var myShoppingList:[String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        shoppingList.text = ""
        
        myShoppingList.append("Eggs")
        myShoppingList.append("Milk")
        myShoppingList.append("Bacon")
        myShoppingList.append("Cookies")
        myShoppingList.remove(at: 2)
        myShoppingList.insert("Chocolate", at: 3)
        myShoppingList[3] = "Bananas"
        
        print("My shopping list has \(myShoppingList.count) items in it")
        print("They are \(myShoppingList)")
        print("The 3rd item in the list is \(myShoppingList[3])")
        
        updateTextView()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateTextView() {
        shoppingList.text = ""
        var index = 0
        while index < myShoppingList.count {
            shoppingList.text.append(myShoppingList[index] + "\n")
            index += 1
        }
    }
    
    @IBAction func addItem(_ sender: Any) {
        if newItem.text != "" {
            myShoppingList.append(newItem.text!)
        }
        myShoppingList.sort()
        updateTextView()
    }
    
    @IBAction func removeItem(_ sender: Any) {
        for index in 0..<myShoppingList.count {
            if myShoppingList[index] == removeItem.text! {
                myShoppingList.remove(at: index)
                break // or else it wil crash because of out of bounds
            }
        }
        updateTextView()
    }


}

