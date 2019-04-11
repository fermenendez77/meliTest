//
//  ResultsViewModel.swift
//  MeliTest
//
//  Created by Fernando Menendez on 07/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import Foundation
import UIKit

class ResultsViewModel {
    
    let product : Results

    static var downloadQueue : OperationQueue = {
        var queue = OperationQueue()
        queue.name = "Download Queue"
        return queue
    }()
    
    required init(product : Results) {
        self.product = product
    }
    
    func configureCell(cell : ResultsTableViewCell) {
        cell.thumbnailImageView.image = UIImage(named: "image-placeholder")
        guard let price = product.price,
            let title = product.title,
            let isFreeShipping = product.shipping?.free_shipping else {
                return
        }
        cell.priceLabel.text = String("$ \(price)")
        cell.titleLabel.text = title
        cell.freeShippingLabel.isHidden = !isFreeShipping
        guard let stringURL = product.thumbnail, let url = URL(string: stringURL) else {
            return
        }
        let imageDownloader = ImageDownloader(withURL : url)
        imageDownloader.completionBlock = {
            DispatchQueue.main.async {
                if let image = imageDownloader.image {
                    cell.thumbnailImageView.image = image
                }
            }
        }
        ResultsViewModel.downloadQueue.addOperation(imageDownloader)
    }
}


class ImageDownloader : Operation {
    
    let thumbnailURL : URL
    var image : UIImage?
    
    init(withURL url : URL) {
        thumbnailURL = url
    }
    
    override func main() {
        if isCancelled {
            return
        }
        
        guard let imageData = try? Data(contentsOf: thumbnailURL) else { return }
        
        if isCancelled {
            return
        }
        
        if (!imageData.isEmpty) {
            self.image = UIImage(data: imageData)
        } else {
            self.image = UIImage(named: "image-placeholder")
        }
    }
}
