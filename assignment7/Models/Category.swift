//
//  Category.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/9/21.
//

import Foundation

class Category:CustomStringConvertible {
    static var newId:Int = 1
    
    var id:Int
    var name:String
    
    public var description: String { return self.name }
    
    init(name:String){
        self.id = Category.newId
        self.name = name
        
        Category.newId += 1
    }
}
