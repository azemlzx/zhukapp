//
//  ReconciliationOfSales.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 23.07.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class ReconciliationOfSales: NSObject {
    let Nomer: String
    let Data: String
    let Initiator: String
    let Сomment: String
    let Object: SubObjectReconciliationOfSales
    
    init(NomerP: String,DataP: String,InitiatorP: String,СommentP: String,ObjectP : SubObjectReconciliationOfSales) {
        self.Nomer = NomerP
        self.Data = DataP
        self.Initiator = InitiatorP
        self.Сomment = СommentP
        self.Object = ObjectP
    }
}

class SubObjectReconciliationOfSales: NSObject {
    let Name: String
    let Amount: Int
    let Price: Float
    let AmountFull: Float
    let DiscountAmount: Float
    
    init(NameP: String,AmountP: Int,PriceP: Float,AmountFullP: Float,DiscountAmount: Float) {
        self.Name = NameP
        self.Amount = AmountP
        self.Price = PriceP
        self.AmountFull = AmountFullP
        self.DiscountAmount = DiscountAmount
    }
    
}
