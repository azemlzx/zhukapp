//
//  RequstestForMoneySharing.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 29.07.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import UIKit

class RequstestForMoneySharing: NSObject {

    let Nomer: String
    let Data: String
    let Recipient: String
    let PaymentForm: String
    let Currency: String
    let DocumentAmount: Float
    let Description: String
    let Сomment: String
    
    init(NomerP:String,DataP:String,RecipientP:String,PaymentFormP:String,CurrencyP:String,DocumentAmountP:Float,DescriptionP:String,СommentP:String) {
        
        self.Nomer = NomerP
        self.Data = DataP
        self.Recipient = RecipientP
        self.PaymentForm = PaymentFormP
        self.Currency = CurrencyP
        self.DocumentAmount = DocumentAmountP
        self.Description = DescriptionP
        self.Сomment = СommentP

    }
}
