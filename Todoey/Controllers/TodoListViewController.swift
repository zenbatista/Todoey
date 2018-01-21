//
//  ViewController.swift
//  Todoey
//
//  Created by Harald Batista on 1/1/18.
//  Copyright © 2018 zenbatista. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {
    
    var itemArray = [Item]()
    

    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
//    let defaults = UserDefaults.standard
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
//        print(dataFilePath)
        
        
 
        
        loadItems()
        
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
        
        //     itemArray[indexPath.row].setValue("Completed", forKey: "title")
        
        //        context.delete(itemArray[indexPath.row])
        //        itemArray.remove(at: indexPath.row)
        
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
            
           
            
            let newItem = Item(context: self.context)
            newItem.title = textField.text!
            
            newItem.done = false
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
     
        
        do {
            try context.save()
        } catch {
          print("Error saving context \(error)")
        }
        
        
        //            self.defaults.set(self.itemArray, forKey: "TodoListArray")
        
        tableView.reloadData()
        
    }
    
    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest()) {
        
        
        do {
          itemArray = try context.fetch(request)
        } catch
        {
            print("Error fetching Data \(error)")
        }
    }
    

    
}

//Mark - Search Bar Methods

extension TodoListViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let request : NSFetchRequest<Item> = Item.fetchRequest()
        
        request.predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
    
        request.sortDescriptors = [NSSortDescriptor(key: "title", ascending: true)]
    
        loadItems(with: request)
        
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        if searchBar.text?.count == 0 {
            loadItems()
            
            DispatchQueue.main.async {
                searchBar.resignFirstResponder()
            }
            
            
            
        }
    }
}
