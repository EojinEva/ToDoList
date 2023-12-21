//
//  Task.swift
//  ToDoList
//
//  Created by t2023-m0099 on 12/20/23.
//

import Foundation

struct Task {
    var title: String = ""
    var content: String?
    var done: Bool = false
    
    init(title: String, content: String, done: Bool = false) {
        self.title = title
        self.content = content
        self.done = done
    }
}
