//
//  TaskController.swift
//  Task
//
//  Created by Bryson Jones on 4/21/21.
//

import Foundation

class TaskController {
    
    static let sharedInstance = TaskController()
    
    var tasks: [Task] = []
    
    //CRUD
    func createTaskWith(name: String, notes: String?, dueDate: Date?) {
        
        let newTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(newTask)
        TaskController.sharedInstance.saveToPersistentStore()
        
    }
    func update(task: Task, name: String?, notes: String?, dueDate: Date?) {
        
        let updateTask = Task(name: notes, notes: notes, dueDate: dueDate)
        //updateTask = Task(name: name, notes: notes, dueDate: dueDate)
        tasks.append(updateTask)
        TaskController.sharedInstance.saveToPersistentStore()
    }
    func toggleIsComplete(task: Task) {
        task.isComplete.toggle()
        TaskController.sharedInstance.saveToPersistentStore()
    }
    func delete(task: Task) {
        
        guard let index = tasks.firstIndex(of: task) else {return}
        tasks.remove(at: index)
        TaskController.sharedInstance.saveToPersistentStore()

    }
    
    //Mark: - Persistence
    func createPersistentStore() -> URL {
        let url = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let fileURL = url[0].appendingPathComponent("Tasks.json")
        return fileURL
    }
    
    func saveToPersistentStore() {
        do {
            let data = try JSONEncoder().encode(tasks)
            try data.write(to: createPersistentStore())
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
    
    func loadFromPersistentStore() {
        do {
            let data = try Data(contentsOf: createPersistentStore())
            tasks = try JSONDecoder().decode([Task].self, from: data)
        } catch {
            print("Error in \(#function) : \(error.localizedDescription) \n---\n \(error)")
        }
    }
 
}//End of class
