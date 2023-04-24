//
//  Student.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

struct Student: Hashable, Equatable {
    var name: String
    var courses: [Course]
}

extension Student {
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

extension [Student] {
    func findIndexByName(name: String) -> Int {
        if let index = self.firstIndex(where: {$0.name == name}) {
            return index
        } else {
            return -1
        }
    }
}
