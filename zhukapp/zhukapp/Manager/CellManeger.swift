//
//  cellFille.swift
//  zhukapp
//
//  Created by Alexander Zemlyansky on 11.10.17.
//  Copyright © 2017 Alexander Zemlyansky. All rights reserved.
//

import Foundation
import UIKit

func navigator(indexM: Int, indexrow:Int, tableView: UITableView) -> UITableViewCell {
    if (indexM == 0 && ConstantsSession.arraySellingData.count > 0 ){
        return cellSales(indexrow: indexrow ,tableView: tableView)
    }else if (indexM == 1 && ConstantsSession.arrayRequstestForMoneySharing.count > 0 ){
        return cellCoordination(indexrow: indexrow,tableView: tableView)
    }else if (indexM == 2 && ConstantsSession.arrayReconciliationOfSales.count > 0 ){
        return cellReconciliationOfSales(indexrow: indexrow,tableView: tableView)
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

func cellCoordination(indexrow: Int,tableView: UITableView)-> UITableViewCell{
    

        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CellAccept") as? CellAccept else {
            return UITableViewCell()
        }
    
        let tapeRequstestForMoneySharing = ConstantsSession.arrayRequstestForMoneySharing[indexrow]
    
        cell.toplabel.text = " №\(tapeRequstestForMoneySharing.Nomer) від \(tapeRequstestForMoneySharing.Data)"
        cell.textlabel.text = "  Сумма - \(tapeRequstestForMoneySharing.DocumentAmount) \n \(tapeRequstestForMoneySharing.Сomment)"

        return cell
}
