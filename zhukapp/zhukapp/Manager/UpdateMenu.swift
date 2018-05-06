//
//  GeneralFunctions.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 08.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import Foundation
import UIKit

func casestr(indextab: Int ) -> String{
    var strreturn = ""
    switch (indextab){
    case 0 : strreturn = "Продажи"
    case 1 : strreturn = "Заявки"
    case 2 : strreturn = "Согласования продаж"
    default: strreturn = ""
    }
    return strreturn
}

func caseimg(indextab: Int ) -> UIImage{
   var imgreturn : UIImage
    switch (indextab){
    case 0 : imgreturn = UIImage(named:"Selling")!
    case 1 : imgreturn = UIImage(named:"Order")!
    case 2 : imgreturn = UIImage(named:"Coordination")!
    default: imgreturn = UIImage()
    }
    return imgreturn
}

