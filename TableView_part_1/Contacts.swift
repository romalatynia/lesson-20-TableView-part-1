//
//  Contacts.swift
//  TableView_part_1
//
//  Created by Harbros47 on 27.01.21.
//

import UIKit

class Contact: NSObject {
    var text = String()
    var color = UIColor()
    
    override init() {
        
        super.init()
        let red = CGFloat.random(in: 0...1)
        let green = CGFloat.random(in: 0...1)
        let blue = CGFloat.random(in: 0...1)
        
        self.text = String(format: "RGB (%.3f %.3f %.3f)", red, green, blue)
        self.color = self.randomColor(red: red, green: green, blue: blue)
    }
    
    private func randomColor(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        UIColor(red: red, green: green, blue: blue, alpha: 1)
    }
}
