//
//  DeleteCourse.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

func DeleteCourse(students: inout [Student]) {
    print("성적을 삭제할 학생의 이름, 과목 이름을 띄어쓰기로 구분하여 차례로 작성해주세요.")
    print("입력예) Mickey Swift")
    
    if let input = readLine() {
        if input.allSatisfy({$0.isWhitespace}) {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        let inputList = input.components(separatedBy: " ")
        if inputList.count != 2 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        let studentIndex = students.findIndexByName(name: inputList[0])
        if studentIndex == -1 {
            print("\(inputList[0]) 학생을 찾지 못했습니다.")
            return
        }
        
        let courseIndex = students[studentIndex].courses.findIndexByName(name: inputList[1])
        if courseIndex == -1 {
            print("\(inputList[0]) 학생의 \(inputList[1]) 과목을 찾지 못했습니다.")
            return
        }
        
        students[studentIndex].courses.remove(at: courseIndex)
        print("\(inputList[0]) 학생의 \(inputList[1]) 과목의 성적이 삭제되었습니다.")
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}
