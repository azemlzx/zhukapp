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

func navigator(indexM: Int, indexrow:Int, tableView: UITableView) -> UITableViewCell {
    if (indexM == 0){
        return cellSelling(indexcellrow: indexrow ,tableView: tableView)
    }else if (indexM == 1){
        return cellOrder(indexcellrow: indexrow,tableView: tableView)
    }else if (indexM == 2){
        return cellCoordination(indexcellrow: indexrow,tableView: tableView)
    }
    return UITableViewCell()
}

func cellSelling(indexcellrow: Int,tableView: UITableView)-> UITableViewCell{
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
    cell.toplabel.text = ItemsSelling[indexcellrow].title
    cell.textlabel.text = ItemsSelling[indexcellrow].textstr
    cell.bottomlabel.text = "\(ItemsSelling[indexcellrow].sum)"
    
    return cell
    
}

func cellOrder(indexcellrow: Int,tableView: UITableView)-> UITableViewCell{
    
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {
        return UITableViewCell()
    }
    var ItemsOrder: [Order] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest: NSFetchRequest<Order> = Order.fetchRequest()
    
    do {
        ItemsOrder = try context.fetch(fetchRequest)
    } catch {
        print(error.localizedDescription)
    }
    cell.toplabel.text = ItemsOrder[indexcellrow].title
    cell.textlabel.text = ItemsOrder[indexcellrow].textstr
    cell.bottomlabel.text = "\(ItemsOrder[indexcellrow].sum)"
    
    return cell
    
}

func cellCoordination(indexcellrow: Int,tableView: UITableView)-> UITableViewCell{
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {
        return UITableViewCell()
    }
    var ItemsCoordination: [Coordination] = []
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let fetchRequest: NSFetchRequest<Coordination> = Coordination.fetchRequest()
    
    do {
        ItemsCoordination = try context.fetch(fetchRequest)
    } catch {
        print(error.localizedDescription)
    }
    cell.toplabel.text = ItemsCoordination[indexcellrow].title
    cell.textlabel.text = ItemsCoordination[indexcellrow].textstr
    cell.bottomlabel.text = "\(ItemsCoordination[indexcellrow].sum)"
    
    return cell
    
}

