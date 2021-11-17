//
//  Order.swift
//  assignment7
//
//  Created by Deepansh Sachdeva on 11/10/21.
//

import Foundation

class Order: CustomStringConvertible {
    static var newId:Int = 1
    
    var id:Int
    var customer:Customer
    var stock:Stock
    var quantity:Int
    
    var date:Date
    var buyAmount: Double
    var sellAmount: Double?
    
    public var description: String { return "Order ID: \(self.id) (\(self.stock))" }
    
    init(customer: Customer, stock:Stock, quantity:Int){
        self.id        = Stock.newId
        self.customer  = customer
        self.stock     = stock
        self.quantity  = quantity
        
        self.date = Date.now
        
        self.buyAmount = stock.lastTradePrice * Double(quantity)
        
        Order.newId += 1
    }
    
    func sell() {
        sellAmount = stock.lastTradePrice * Double(quantity)
    }
    
    func getEarnings() -> Double {
        return (sellAmount ?? buyAmount) - buyAmount
    }
}
