//
//  File.swift
//  Task
//
//  Created by Bryson Jones on 4/21/21.
//

import Foundation

class Task: Codable {
    
    let name: String?
    let notes: String?
    let dueDate: Date?
    var isComplete: Bool
    
    init(name: String?, notes: String?, dueDate: Date?, isComplete: Bool = false) {
        self.name = name
        self.notes = notes
        self.dueDate = dueDate
        self.isComplete = isComplete
    }
}//End of class

//Mark: - Extensions
extension Task: Equatable {
    static func == (lhs: Task, rhs: Task) -> Bool {
        return lhs.name == rhs.name
    }
}
