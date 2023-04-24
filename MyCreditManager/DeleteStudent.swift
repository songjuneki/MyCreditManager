//
//  DeleteStudent.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

func DeleteStudent(students: inout [Student]) {
    print("삭제할 학생의 이름을 입력해주세요")
    
    if let input = readLine() {
        if input.allSatisfy({$0.isWhitespace}) {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        let index = students.findIndexByName(name: input)
        if index != -1 {
            students.remove(at: index)
            print("\(input) 학생을 삭제하였습니다.")
        } else {
            print("\(input) 학생을 찾지 못했습니다.")
        }
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}
