//
//  cellFille.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 11.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import Foundation
import UIKit
import CoreData

func navigator(indexM: Int,tableView: UITableView) -> UITableViewCell {
    if (indexM == 0){
       return cellSelling(indexM: indexM ,tableView: tableView)
    }else if (indexM == 1){
        
    }else if (indexM == 2){
        
    }
    return UITableViewCell()
}

func cellSelling(indexM: Int,tableView: UITableView)-> UITableViewCell{
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {
                  return UITableViewCell()
    }
    var ItemsSelling: [Selling] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest: NSFetchRequest<Selling> = Selling.fetchRequest()
    
    do {
        ItemsSelling = try context.fetch(fetchRequest)
    } catch {
        print(error.localizedDescription)
    }
    cell.toplabel.text = ItemsSelling[indexM].title
    cell.textlabel.text = ItemsSelling[indexM].textstr
    cell.bottomlabel.text = "\(ItemsSelling[indexM].sum)"
    
    return cell
    
}
