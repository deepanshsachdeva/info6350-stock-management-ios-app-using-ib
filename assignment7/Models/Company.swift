//
//  Company.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import Foundation

class Company: CustomStringConvertible {
    static var newId:Int = 1
    
    var id:Int
    var name:String
    var symbol:String
    var headquarter:String
    var email:String
    
    public var description: String { return "\(self.name) (\(self.symbol))" }
    
    init(name:String, symbol:String, headquarter:String, email:String){
        self.id          = Company.newId
        self.name        = name
        self.symbol      = symbol
        self.headquarter = headquarter
        self.email       = email
        
        Company.newId += 1
    }
}
