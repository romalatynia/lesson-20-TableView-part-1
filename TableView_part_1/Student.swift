//
//  Student.swift
//  TableView_part_1
//
//  Created by Harbros47 on 27.01.21.
//

import Foundation

class Student: NSObject {
    var name: String
    var lastName: String
    var averageScore: Int
    var fullName: String {
         name + " " + lastName
    }
    
    static let names = [
        "Рома",
        "Дима",
        "Аня",
        "Катя",
        "Настя",
        "Вадим",
        "Денис",
        "Кристина",
        "Тима"
    ]
    static let lastName = [
        "Кабачук",
        "Полещук",
        "Вандич",
        "Климашевич",
        "Латыня",
        "Кныш",
        "Петров",
        "Кобась",
        "Дулкарнаев"
    ]
    
    override init() {
        name = ""
        lastName = ""
        averageScore = Int()
    }
    
    func randomStudents() {
        name = Student.names.randomElement() ?? ""
        lastName = Student.lastName.randomElement() ?? ""
        averageScore = Int.random(in: 2...5)
    }
}
