//
//  ViewController.swift
//  Todoey
//
//  Created by Harald Batista on 1/1/18.
//  Copyright © 2018 zenbatista. All rights reserved.
//

import UIKit


class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    
      let dataFilePath = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first?.appendingPathComponent("Items.plist")
    
//    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        print(dataFilePath)
        
        
        let newItem = Item()
        newItem.title = "Find Mike"
        itemArray.append(newItem)
        
        let newItem2 = Item()
        newItem2.title = "Find John"
        itemArray.append(newItem2)
        
        let newItem3 = Item()
        newItem3.title = "Find Mary"
        itemArray.append(newItem3)
        

        
//        if let items = defaults.array(forKey: "TodoListArray") as? [Item] {
//            itemArray = items
//        }
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        
        let item = itemArray[indexPath.row]
        
        cell.textLabel?.text = item.title
        
        cell.accessoryType = item.done  ? .checkmark : .none
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //print(itemArray[indexPath.row])
        
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        
        saveItems()
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    //Mark - Add New Items
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
        
        var textField = UITextField()
        
        let alert = UIAlertController(title: "Adiciona tarefa nova", message: "", preferredStyle: .alert)
        
        let action = UIAlertAction(title: "Adiciona item", style: .default)  { (action) in
            //What happens when user clicks on the Add Button
            
            let newItem = Item()
            newItem.title = textField.text!
            
            
            self.itemArray.append(newItem)
            
            self.saveItems()
            
        }
        
        alert.addTextField { (alertTextField) in
            alertTextField.placeholder = "Cria algo novo"
            textField = alertTextField
            //      print(alertTextField.text)
            
        }
        
        alert.addAction(action)
        
        present(alert, animated: true, completion: nil)
        
    }
    
    func saveItems() {
        let encoder = PropertyListEncoder()
        
        do {
            let data = try encoder.encode(itemArray)
            try data.write(to: dataFilePath!)
        } catch {
            print("Error encoding item array, \(error)")
        }
        
        
        //            self.defaults.set(self.itemArray, forKey: "TodoListArray")
        
        tableView.reloadData()
        
    }
    
}
