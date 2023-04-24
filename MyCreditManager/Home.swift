//
//  Home.swift
//  MyCreditManager
//
//  Created by 송준기 on 2023/04/24.
//

import Foundation


func Home(students: inout [Student]) {
    while true {
        print("원하는 기능을 입력해주세요")
        print("1: 학생추가, 2: 학생삭제, 3: 성적추가(변경), 4: 성적삭제, 5: 평점보기, X: 종료")
        
        if let input = readLine() {
            if input.count == 1 {
                switch input.last! {
                case "1":
                    AddStudent(students: &students)
                case "2":
                    DeleteStudent(students: &students)
                case "3":
                    ModifyCourse(students: &students)
                case "4":
                    DeleteCourse(students: &students)
                case "5":
                    ShowCourseAvg(students: &students)
                case "x":
                    fallthrough
                case "X":
                    print("프로그램을 종료합니다...")
                    exit(0)
                default:
                    print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
                }
            } else {
                print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
            }
        } else {
            print("뭔가 입력이 잘못되었습니다. 1~5 사이의 숫자 혹은 X를 입력해주세요.")
        }
    }
    
}
