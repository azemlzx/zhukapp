//
//  APIManeger.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 07.05.18.
//  Copyright © 2018 Alexander Zemlyansky. All rights reserved.
//

import Foundation
import UIKit


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

