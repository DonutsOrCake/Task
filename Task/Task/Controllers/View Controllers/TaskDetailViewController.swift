//
//  TaskDetailViewController.swift
//  Task
//
//  Created by Bryson Jones on 4/21/21.
//

import UIKit

class TaskDetailViewController: UIViewController {
    
    //Mark: - Outlets
    @IBOutlet weak var taskNameTextField: UITextField!
    @IBOutlet weak var taskNotesTextView: UITextView!
    @IBOutlet weak var taskDueDatePicker: UIDatePicker!
    
    
    //Mark: - Properties
    var task: Task?
    var date: Date?
    
    //Mark: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    //Mark: - Actions
    @IBAction func saveButtonTapped(_ sender: Any) {
        guard let nameText = taskNameTextField.text,!nameText.isEmpty  else { return }
        if let task = task   {
            TaskController.sharedInstance.update(task: task,
                                                 name: nameText,
                                                 notes: taskNotesTextView.text ?? "",
                                                 dueDate: date)

            TaskController.sharedInstance.saveToPersistentStore()
            navigationController?.popViewController(animated: true)
        }else {
            TaskController.sharedInstance.createTaskWith(name: nameText,
                                                         notes: taskNotesTextView.text ?? "",
                                                         dueDate: date)
            
           
            TaskController.sharedInstance.saveToPersistentStore()
            navigationController?.popViewController(animated: true)
        }
    }
    @IBAction func dueDatePickerDateChanged(_ sender: UIDatePicker) {
        date = sender.date
    }
    
    func updateViews() {
        taskNameTextField.text = task?.name
        taskNotesTextView.text = task?.notes
        date = task?.dueDate
    }
    
    
}
