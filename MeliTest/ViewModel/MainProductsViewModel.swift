//
//  MainProductsViewModel.swift
//  MeliTest
//
//  Created by Fernando Menendez on 09/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import Foundation

class MainProductsViewModel {
    
    let product : Results
    
    static var downloadQueue : OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Download Queue"
        return queue
    }()
    
    required init(withProduct product : Results) {
        self.product = product
    }
    
    
    func configureModel(withView view : MainProductsCollectionViewCell) {
        if let symbol = CurrenciesHelper.currenciesSymbols[product.currency_id!]  {
            view.priceLabel.text = "\(symbol) \(product.price!)"
        } else {
            view.priceLabel.text = "$ \(product.price!)"
        }
        view.titleLabel.text = product.title!
        guard let stringURL = product.thumbnail, let url = URL(string: stringURL) else {
            return
        }
        let imageDownloader = ImageDownloader(withURL : url)
        imageDownloader.completionBlock = {
            DispatchQueue.main.async {
                if let image = imageDownloader.image {
                    view.productThumbnailImageView.image = image
                }
            }
        }
        ResultsViewModel.downloadQueue.addOperation(imageDownloader)
    }
    
    
}
