//
//  Customer.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import Foundation

class Customer: CustomStringConvertible {
    static var newId:Int = 1
    
    var id:Int
    var firstName:String
    var lastName:String
    var address:String
    var contact:String
    var email:String
    
    public var description: String { return self.firstName+" "+self.lastName }
    
    init(firstName:String, lastName:String, address:String, contact:String, email:String){
        self.id = Customer.newId
        self.firstName = firstName
        self.lastName = lastName
        self.address = address
        self.contact = contact
        self.email = email
        
        Customer.newId += 1
    }
}
