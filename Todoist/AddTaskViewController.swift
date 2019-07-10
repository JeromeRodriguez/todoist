//
//  ViewController.swift
//  Todoist
//
//  Created by Jerome Rodriguez on 29/6/19.
//  Copyright © 2019 Jerome Rodriguez. All rights reserved.
//

import UIKit

protocol AddTaskViewControllerDelegateProtocol {
    func sendDataToTableView(titleToSend: String, categoryToSend: Int, dateToSend: String)
}

class AddTaskViewController: UIViewController {
    
    var delegate: AddTaskViewControllerDelegateProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "New todo"
    }
    
    @IBOutlet weak var todoCategory: UISegmentedControl!
    
    @IBOutlet weak var todoTitleText: UITextField!
    
    @IBOutlet weak var todoDate: UIDatePicker!
    
    @IBAction func doneButton(_ sender: UIButton) {
        if let delegate = self.delegate {
            let dateFormatter = DateFormatter()
            let titleToSend = self.todoTitleText.text
            let categoryToSend = self.todoCategory.selectedSegmentIndex
            let dateToSend = dateFormatter.string(from: self.todoDate.date)
            delegate.sendDataToTableView(titleToSend: titleToSend!, categoryToSend: categoryToSend, dateToSend: dateToSend)
            dismiss(animated: true, completion: nil)
        }
    }
}
