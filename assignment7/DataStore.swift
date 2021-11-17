//
//  DataStore.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import Foundation


class DataStore {
    var categories:[Category] = []
    var companies:[Company]   = []
    var stocks:[Stock]        = []
    var customers:[Customer]  = []
    var orders:[Order]        = []
    
    init() {
        categories.append(Category(name: "electronics"))
        categories.append(Category(name: "groceries"))
        
        companies.append(Company(name: "Apple", symbol: "APL", headquarter: "California", email: "hello@apple.com"))
        companies.append(Company(name: "Stop & Shop", symbol: "SNS", headquarter: "Massachusetts", email: "contact@sns.com"))
        
        customers.append(Customer(firstName: "Deepansh", lastName: "Sachdeva", address: "Boston", contact: "1234567890", email: "deepansh@gmail.com"))
        customers.append(Customer(firstName: "Varidhi", lastName: "Garg", address: "Boston", contact: "9087654321", email: "darthvader@mail.com"))
        customers.append(Customer(firstName: "Aishwarya", lastName: "Kumar", address: "Connecticut", contact: "1023456789", email: "asiwayrya@test.com"))
    }
}

let ds = DataStore()
