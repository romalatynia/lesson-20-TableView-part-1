//
//  ViewController.swift
//  TableView_part_1
//
//  Created by Harbros47 on 26.01.21.
//

import UIKit
private enum Constants {
    static let cellReuseIdentifier = "cell"
    static let bad = "bad"
    static let cGrade = "C grade"
    static let good = "good"
    static let excellentStudent = "excellentStudent"
    static let color = "color"
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet private var tableView: UITableView!
    private var contactsArray = [Contact]()
    private var studentArray = [[Student]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: Constants.cellReuseIdentifier)
    }
    
    private func createStudent() -> [[Student]] {
        var bad = [Student]()
        var cGrade = [Student]()
        var good = [Student]()
        var excellentStudent = [Student]()
        for _ in 0..<30 {
            let student = Student()
            student.randomStudents()
            
            switch student.averageScore {
            case 2:
                bad.append(student)
            case 3:
                cGrade.append(student)
            case 4:
                good.append(student)
            case 5:
                excellentStudent.append(student)
            default:
                break
            }
        }
        
        let sortedBad = bad.sorted { $0.name < $1.name }
        let sortedCGrade = cGrade.sorted { $0.name < $1.name }
        let sortedGood = good.sorted { $0.name < $1.name }
        let sortedExcellentStudent = excellentStudent.sorted { $0.name < $1.name }
        
        if !sortedBad.isEmpty {
            studentArray.append(sortedBad)
        }
        if !sortedCGrade.isEmpty {
            studentArray.append(sortedCGrade)
        }
        if !sortedGood.isEmpty {
            studentArray.append(sortedGood)
        }
        if !sortedExcellentStudent.isEmpty {
            studentArray.append(sortedExcellentStudent)
        }
        return studentArray
    }
    
    private func createContact() -> [Contact] {
        for _ in 0..<10 {
            let contact = Contact()
            contactsArray.append(contact)
        }
        return contactsArray
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        studentArray.count + 1
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        
        switch section {
        case 0:
            title = Constants.bad
        case 1:
            title = Constants.cGrade
        case 2:
            title = Constants.good
        case 3:
            title = Constants.excellentStudent
        case 4:
            title = Constants.color
        default:
            break
        }
        return title
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        var countRows = 0
        if section < 4 {
            countRows = createStudent()[section].count
        } else {
            countRows = createContact().count
        }
        return countRows
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = UITableViewCell()
        if indexPath.section < 4 {
            cell = UITableViewCell(
                style: .value1,
                reuseIdentifier: Constants.cellReuseIdentifier
            )
            let studentArray = createStudent()[indexPath.section]
            let student = studentArray[indexPath.row]
            cell.contentView.backgroundColor = student.averageScore < 3 ? .systemRed : .white
            cell.textLabel?.text = student.fullName
            cell.detailTextLabel?.text = "ср.балл \(student.averageScore) уч."
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: Constants.cellReuseIdentifier)
            let contact = createContact()[indexPath.row]
            cell.textLabel?.text = contact.text
            cell.backgroundColor = contact.color
        }
        return cell
    }
}
