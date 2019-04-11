//
//  RequestController.swift
//  MeliTest
//
//  Created by Fernando Menendez on 06/04/2019.
//  Copyright © 2019 Fernando Menendez. All rights reserved.
//

import Foundation

class RequestController {
    
    let baseURL = "https://api.mercadolibre.com"
    let searchUrl = "/sites/MLA/search"
    let itemDetailURL = "/items/"
    let itemDescriptionsURL = "/description"
    let mainItemsURL = "https://api.mercadolibre.com/sites/MLA/search?limit=10&category=MLA57506"
    
    func searchRequest(keyWord : String, completionHandler : @escaping (RootSearchRequest) -> Void) {
        
        var url = URLComponents(string: baseURL+searchUrl)!
        url.queryItems = [URLQueryItem(name: "q", value: keyWord)]
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url.url!) {data, response, error in
            guard let searchResponse = response as? HTTPURLResponse,
                searchResponse.statusCode == 200,
                let resultData = data else {
                    return
            }
            let decoder = JSONDecoder()
            do {
                let searchResults = try decoder.decode(RootSearchRequest.self,
                                                       from: resultData)
                completionHandler(searchResults)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func searchItem(withID id : String, completionHandler : @escaping (ProductDetail) -> Void ) {
        let url = URL(string: baseURL+itemDetailURL+id)!
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, sessionError in
            guard let searchResponse = response as? HTTPURLResponse,
                searchResponse.statusCode == 200,
                let resultData = data else {
                    return
            }
            let decoder = JSONDecoder()
            do {
                let productDetail = try decoder.decode(ProductDetail.self,
                                                       from: resultData)
                completionHandler(productDetail)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func searchItemDescription(withID id : String, completionHandler :
        @escaping (ProductDescription?) -> Void ) {
        let url = URL(string: baseURL+itemDetailURL+id+itemDescriptionsURL)!
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, sessionError in
            guard let searchResponse = response as? HTTPURLResponse,
                searchResponse.statusCode == 200,
                let resultData = data else {
                    return
            }
            let decoder = JSONDecoder()
            do {
                let productDescription = try decoder.decode(ProductDescription.self,
                                                       from: resultData)
                completionHandler(productDescription)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    func searchCategories(completionHandler : @escaping (MainProducts) -> Void ) {
        let url = URL(string: mainItemsURL)!
        let urlSession = URLSession(configuration: .default)
        let task = urlSession.dataTask(with: url) { data, response, sessionError in
            guard let searchResponse = response as? HTTPURLResponse,
                searchResponse.statusCode == 200,
                let resultData = data else {
                    return
            }
            let decoder = JSONDecoder()
            do {
                let mainProducts = try decoder.decode(MainProducts.self,
                                                            from: resultData)
                completionHandler(mainProducts)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
}
