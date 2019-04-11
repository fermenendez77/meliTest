//
//  DetailProductViewModel.swift
//  MeliTest
//
//  Created by Fernando Menendez on 08/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import Foundation

class DetailProductViewModel {
    
    var product : ProductDetail
    
    required init(withProduct product : ProductDetail) {
        self.product = product
    }
    
    func configure(view : DetailProductViewController) {
        view.productTitleLabel.text = product.title
        if let symbol = CurrenciesHelper.currenciesSymbols[product.currency_id!]  {
            view.priceLabel.text = "\(symbol) \(product.price!)"
        } else {
            view.priceLabel.text = "$ \(product.price!)"
        }
        if let soldQuantity = product.sold_quantity {
            view.soldQuantityLabel.text = "\(soldQuantity) Vendidos"
        }
        if let waranty = product.warranty {
            view.warrantyLabel.text = waranty
        }
        let requestController = RequestController()
        requestController.searchItemDescription(withID: product.id!) { description in
            if let productDescription = description {
                DispatchQueue.main.async {
                    view.descritpionText.text = productDescription.plain_text
                }
            }
        }
    }
    
    
    func loadPictures(toView view: ImagePagerViewController?) {
        if let pictures = product.pictures {
            if let pagesController = view {
                pagesController.loadPictures(pictures: pictures)
            }
        }
    }
}
