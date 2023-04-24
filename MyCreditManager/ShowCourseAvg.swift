//
//  ShowCourseAvg.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation

func ShowCourseAvg(students: inout [Student]) {
    print("평점을 알고싶은 학생의 이름을 입력해주세요")
    
    if let input = readLine() {
        if input.allSatisfy({$0.isWhitespace}) {
            print("입력이 잘못되었습니다. 다시 확인해주세요.")
            return
        }
        
        let studentIndex = students.findIndexByName(name: input)
        if studentIndex == -1 {
            print("\(input) 학생을 찾지 못했습니다.")
            return
        }
        
        if students[studentIndex].courses.isEmpty {
            print("\(input) 학생의 성적이 없습니다. 성적을 먼저 등록해주세요.")
            return
        }
        
        var score = 0.0
        students[studentIndex].courses.forEach { course in
            score += calcGrade(grade: course.grade)
            print("\(course.name): \(course.grade)")
        }
        score = score / Double(students[studentIndex].courses.count)
        let formatter = NumberFormatter()
        formatter.maximumFractionDigits = 2
        let avg = formatter.string(for: score) ?? "0"
        print("평점 : \(avg)")
    } else {
        print("입력이 잘못되었습니다. 다시 확인해주세요.")
    }
}


func calcGrade(grade: String) -> Double {
    switch grade {
    case "A+":
        return 4.5
    case "A":
        return 4
    case "B+":
        return 3.5
    case "B":
        return 3
    case "C+":
        return 2.5
    case "C":
        return 2
    case "D+":
        return 1.5
    case "D":
        return 1
    case "F":
        return 0
    default:
        return 0
    }
}
