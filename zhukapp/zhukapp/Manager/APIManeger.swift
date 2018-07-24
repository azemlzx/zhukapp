//
//  APIManeger.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import Foundation
import UIKit
import SwiftyJSON


func authorization(User:String,Password:String,completion: @escaping (_ Authorization: Bool,_ UserKod: String?,_ idSession: String?)->())
{
    let dictionary = ["User": User,"Password":Password]
    let jsonData = try? JSONSerialization.data(withJSONObject: dictionary, options: [])
    let jsonString = String(data: jsonData!, encoding: .utf8)
    
    
    let urlString = Constants.ApiUrl
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url as URL)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.httpMethod = "POST"
    request.httpBody = jsonString?.data(using: .utf8)
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let datajson = data, error == nil else {
            print("error=\(String(describing: error))")
            completion(false, nil,nil)
            return
        }
        
        var json = String(data: datajson, encoding: String.Encoding.utf8)!
        json = encodingJSONServer(aString:json)

        do
        {
            let responseStruct = try JSONDecoder().decode(AuthorizationResponse.self, from: Data(json.utf8))
            if (responseStruct.Authorization){
                completion(true, responseStruct.UserKod,responseStruct.Token)
            }else{
                completion(false, nil,nil)
            }
        }
        catch{
            completion(false, nil,nil)
        }
    }
    task.resume()
}

func getUserData(userKod:String,completion: @escaping (_ Authorization: Bool,_ Position: String?)->())
{
    
    
    let urlString = Constants.ApiUrl + "?nameMetod=GetUserData"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url as URL)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(userKod, forHTTPHeaderField: "userKod")
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let datajson = data, error == nil else {
            print("error=\(String(describing: error))")
            return
        }
        
        var json = String(data: datajson, encoding: String.Encoding.utf8)!
        json = encodingJSONServer(aString:json)
        
        do
        {
            let userDataresponseStruct = try JSONDecoder().decode(UserDataResponse.self, from: Data(json.utf8))
            completion(true,userDataresponseStruct.Position)
        }
        catch{
            completion(false,nil)
        }
    }
    task.resume()
}


func getSales(userKod:String,completion: @escaping (_ completionUpdate: Bool)->())
{
//    let lastWeekDate = Date()
//    let dateFormatter = DateFormatter()
//    dateFormatter.dateFormat = "YYYYMMddHHMMSS"
//    let data1 = dateFormatter.string(from: lastWeekDate)
    
    let data1 = "20180601000000"
    
    let urlString = Constants.ApiUrl + "?nameMetod=GetSales"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url as URL)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(userKod, forHTTPHeaderField: "userKod")
    request.setValue(data1, forHTTPHeaderField: "data1")
    request.setValue(data1, forHTTPHeaderField: "data2")
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let datajson = data, error == nil else {
            print("error=\(String(describing: error))")
            return
        }
        
        var jsonGetSales = String(data: datajson, encoding: String.Encoding.utf8)!
        jsonGetSales = encodingJSONServer(aString:jsonGetSales)
        
        do
        {
            let userSalesData = try JSONDecoder().decode(SalesResponse.self, from: Data(jsonGetSales.utf8))
            ConstantsSession.arraySellingData.removeAll()
            
            let SellingDataReport = Sales(nameInit: "Звіти", amountInit: userSalesData.documentReport)
            let SellingDataCheck = Sales(nameInit: "Чеки", amountInit: userSalesData.documentCheck)
            ConstantsSession.arraySellingData.append(SellingDataReport)
            ConstantsSession.arraySellingData.append(SellingDataCheck)
           
            completion(true)
        }
        catch{
            completion(false)
        }
    }
    task.resume()
}

func getReconciliationOfSales(userKod:String,completion: @escaping (_ completionUpdate: Bool)->())
{
    
    let urlString = Constants.ApiUrl + "?nameMetod=ReconciliationOfSales"
    let url = URL(string: urlString)!
    
    var request = URLRequest(url: url as URL)
    request.setValue("application/json", forHTTPHeaderField: "Content-Type")
    request.setValue(userKod, forHTTPHeaderField: "userKod")
    request.httpMethod = "GET"
    let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
        guard let datajson = data, error == nil else {
            print("error=\(String(describing: error))")
            return
        }
        
        var jsonReconciliationOfSales = String(data: datajson, encoding: String.Encoding.utf8)!
        jsonReconciliationOfSales = encodingJSONServer(aString:jsonReconciliationOfSales)
        
        do
        {
            let userSalesData = try JSONDecoder().decode(ObjectsArray.self, from: Data(jsonReconciliationOfSales.utf8))
            ConstantsSession.arrayReconciliationOfSales.removeAll()
            for item in userSalesData.data {
                
                let subObject = SubObjectReconciliationOfSales(NameP: item.Object.Name, AmountP: item.Object.Amount, PriceP: item.Object.Price, AmountFullP: item.Object.AmountFull, DiscountAmount: item.Object.AmountFull)
                let objectData = ReconciliationOfSales(NomerP: item.Nomer, DataP: item.Data, InitiatorP: item.Initiator, СommentP: item.Сomment, ObjectP: subObject)
                ConstantsSession.arrayReconciliationOfSales.append(objectData)
                
            }
            completion(true)
        }
        catch{
            completion(false)
        }
    }
    task.resume()
}

func relodeArray(indexmenu:Int,completion: @escaping (_ Authorization: Bool)->()) {
    
    if (indexmenu == 0){
        getSales(userKod: ConstantsSession.idUserSession) { (completionUpdate) in
            completion(true)
        }
    }else if (indexmenu == 1){
        getReconciliationOfSales(userKod: ConstantsSession.idUserSession) { (completionUpdate) in
            completion(true)
        }
    }else if (indexmenu == 2){
        
    }
}
