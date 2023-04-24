//
//  Course.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

struct Course: Hashable, Equatable {
    var name: String
    var grade: String
}

extension [Course] {
    func findIndexByName(name: String) -> Int {
        if let index = self.firstIndex(where: {$0.name == name}) {
            return index
        } else {
            return -1
        }
    }
}
