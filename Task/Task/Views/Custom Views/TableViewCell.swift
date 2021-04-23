//
//  TableViewCell.swift
//  Task
//
//  Created by Bryson Jones on 4/21/21.
//

import UIKit
protocol TaskCompletionDelegate : AnyObject {
    func taskCellButtonTapped(_ sender: TaskTableViewCell)
}

class TaskTableViewCell: UITableViewCell {
    @IBOutlet weak var taskNameLabel: UILabel!
    @IBOutlet weak var completionButton: UIButton!
    
    weak var delegate:TaskCompletionDelegate?
    
    var task : Task? {
        didSet{
            updateViews()
        }
    }
    
    @IBAction func completionButtonTapped(_ sender: UIButton) {
        delegate?.taskCellButtonTapped(self)
    }

    func updateViews() {
        if let newTask = task {
            taskNameLabel.text = newTask.name
            setButtonBackgroundFor(status: newTask.isComplete)
        }
       
    }
    
    func isComplete(task: Task) -> Bool {
        return task.isComplete
    }
    
    func setButtonBackgroundFor(status: Bool) {
        if status == true {
            completionButton.setImage(#imageLiteral(resourceName: "complete"), for: .normal)
            
            }else {
                
            completionButton.setImage(#imageLiteral(resourceName: "incomplete"), for: .normal)
        }
    }
}
