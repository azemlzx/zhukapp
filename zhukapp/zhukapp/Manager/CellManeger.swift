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
    if (indexM == 0 && ConstantsSession.arraySellingData.count > 0 ){
        return cellSales(indexrow: indexrow ,tableView: tableView)
    }else if (indexM == 1 && ConstantsSession.arrayReconciliationOfSales.count > 0 ){
        return cellReconciliationOfSales(indexrow: indexrow,tableView: tableView)
    }else if (indexM == 2){
        return cellCoordination(indexcellrow: indexrow,tableView: tableView)
    }
    return UITableViewCell()
}

func navigatorMenu(indexrow:Int, tableView: UITableView) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellMenu") as? MenuCell else {
        return UITableViewCell()
    }
    cell.imageViewMenu.image = caseimg(indextab: indexrow)
    cell.labelMenu.text = casestr(indextab: indexrow)
    return cell
}

func cellSales(indexrow:Int, tableView: UITableView) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellSales") as? CellSalesView else {
        return UITableViewCell()
    }
    
    let tapeSellingData = ConstantsSession.arraySellingData[indexrow]

    cell.document.text = tapeSellingData.name
    cell.amount.text = tapeSellingData.amount

    return cell
}

func cellReconciliationOfSales(indexrow: Int,tableView: UITableView)-> UITableViewCell{
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellAccept") as? CellAccept else {
        return UITableViewCell()
    }
    
    let tapeReconciliationOfSales = ConstantsSession.arrayReconciliationOfSales[indexrow]

    cell.toplabel.text = " №\(tapeReconciliationOfSales.Nomer) від \(tapeReconciliationOfSales.Data)"
    cell.textlabel.text = "  Сумма - \(tapeReconciliationOfSales.Object.AmountFull) \n \(tapeReconciliationOfSales.Сomment)"

    return cell
    
}

func cellCoordination(indexcellrow: Int,tableView: UITableView)-> UITableViewCell{
    
//    var ItemsCoordination: [Coordination] = []
//
//    let appDelegate = UIApplication.shared.delegate as! AppDelegate
//    let context = appDelegate.persistentContainer.viewContext
//    let fetchRequest: NSFetchRequest<Coordination> = Coordination.fetchRequest()
//    do {
//        ItemsCoordination = try context.fetch(fetchRequest)
//    } catch {
//        print(error.localizedDescription)
//    }
//
//    if(ItemsCoordination[indexcellrow].status == 0){
//
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellAccept") as? CellAccept else {
//            return UITableViewCell()
//        }
//
//        cell.toplabel.text = ItemsCoordination[indexcellrow].title
//        cell.textlabel.text = ItemsCoordination[indexcellrow].textstr! +  "\n" + "\(ItemsCoordination[indexcellrow].sum)"
//
//        cell.handlerActionButtonTapCompletion = { (_ Accept) in
//            updataData (Items : ItemsCoordination, indexitems : indexcellrow , stauscell : Accept , tableViewT : tableView)
//        }
//        return cell
//    }else{
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as? TableViewCell else {
//            return UITableViewCell()
//        }
//
//        cell.toplabel.text = ItemsCoordination[indexcellrow].title
//        cell.textlabel.text = ItemsCoordination[indexcellrow].textstr
//        cell.bottomlabel.text = "\(ItemsCoordination[indexcellrow].sum)"
//        if (ItemsCoordination[indexcellrow].status == 1){
//            cell.bottomlabel.textColor = UIColor.green
//        }else {
//            cell.bottomlabel.textColor = UIColor.red
//        }
//
//        return cell
//    }
//
    return UITableViewCell()
}

func updataData (Items : [Any] , indexitems : Int, stauscell : Int , tableViewT: UITableView){
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let context = appDelegate.persistentContainer.viewContext
    
    let strItmes = Items[indexitems]
    
    (strItmes as AnyObject).setValue(stauscell,forKey: "status")
    do {
        try (context as AnyObject).save()
    } catch {
        print(error.localizedDescription)
    }
    tableViewT.reloadData()
}
