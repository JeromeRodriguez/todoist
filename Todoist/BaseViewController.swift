//
//  ViewController.swift
//  Todoist
//
//  Created by Jerome Rodriguez on 29/6/19.
//  Copyright © 2019 Jerome Rodriguez. All rights reserved.
//

import UIKit

class BaseViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddTaskViewControllerDelegateProtocol {
    
    var a: String = ""
    var b: String = ""
    var c: String = ""
    
    func sendDataToTableView(titleToSend: String, categoryToSend: Int, dateToSend: String) {
        a = "\(categoryToSend)"
        b = titleToSend
        c = dateToSend
    }

    var todoList = [TodoCellContent]()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "AddTodoSegue"){
            let addTaskVC = segue.destination as! AddTaskViewController
            addTaskVC.delegate = self
        }
    }
    
    public struct TodoCellContent {
        var todoCategory: String
        var todoTitle: String
        var todoDeadline: String
    }
    
    private var data: [String] = []
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellReuseIdentifier") as! CustomTableViewCell?
        cell?.taskLabel.text = b
        cell?.taskCategory.text = a
        cell?.taskTime.text = c
        return cell!
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let todoCell1 = TodoCellContent(todoCategory: "jerome", todoTitle: "rodriguez", todoDeadline: "yesh")
        todoList = [todoCell1]
        
        for _ in 0...2 {
            data.append(" ")
        }
        self.title = "Todoist list"
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    @IBOutlet weak var tableView: UITableView!
    
}

