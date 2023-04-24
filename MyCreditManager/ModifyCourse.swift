//
//  AddCourse.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

func ModifyCourse(students: inout [Student]) {
    print("성적을 추가할 학생의 이름, 과목 이름, 성적(A+, A, F 등)을 뛰어쓰기로 구분하여 차례로 작성해주세요")
    print("입력예) Mickey Swift A+")
    print("만약에 학생의 성적 중 해당 과목이 존재하면 기존 점수가 갱신됩니다.")
    
    if let input = readLine() {
        let inputList = input.components(separatedBy: " ")
        if inputList.count != 3 {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        let studentIndex = students.findIndexByName(name: inputList[0])
        if studentIndex == -1 {
            print("\(inputList[0]) 학생을 찾지 못했습니다.")
            return
        }
        
        let courseIndex = students[studentIndex].courses.findIndexByName(name: inputList[1])
        let isValidGrade = checkGrade(grade: inputList[2])
        if !isValidGrade {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        if courseIndex == -1 {
            students[studentIndex].courses.append(Course(name: inputList[1], grade: inputList[2]))
        } else {
            students[studentIndex].courses[courseIndex].grade = inputList[2]
        }
        
        print("\(inputList[0]) 학생의 \(inputList[1]) 과목이 \(inputList[2])로 추가(변경)되었습니다.")
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}

func checkGrade(grade: String) -> Bool {
    switch grade {
    case "A+":
        fallthrough
    case "A":
        fallthrough
    case "B+":
        fallthrough
    case "B":
        fallthrough
    case "C+":
        fallthrough
    case "C":
        fallthrough
    case "D+":
        fallthrough
    case "D":
        fallthrough
    case "F":
        return true
    default:
        return false
    }
}
