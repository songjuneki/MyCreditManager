//
//  AddStudent.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

func AddStudent(students: inout [Student]) {
    print("추가할 학생의 이름을 입력해주세요")
    
    if let input = readLine() {
        let index = students.findIndexByName(name: input)
        if input.allSatisfy({$0.isWhitespace}) {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        if index == -1 {
            students.append(Student(name: input))
            print("\(input) 학생을 추가했습니다.")
        } else {
            print("\(input)은 이미 존재하는 학생입니다. 추가하지 않습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}
