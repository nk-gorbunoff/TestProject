//
//  APIEndpoints.swift
//  UIKitTestApp
//
//  Created by Александр Коробицын on 06.06.2024.
//

import Foundation

struct URLConfiguration {
    let scheme: String
    let host: String
    let path: String
}

enum URLConfigurations {
    case products
    case product(id: Int)
    case categories
    case category(id: Int)
    
    var configuration: URLConfiguration {
        switch self {
            
        case .products:
            return URLConfiguration(scheme: "https",
                                    host: "fakestoreapi.com",
                                    path: "/products")
        case .product(id: let id):
            return URLConfiguration(scheme: "https",
                                    host: "fakestoreapi.com",
                                    path: "/products/\(id)")
        case .categories:
            return URLConfiguration(scheme: "https",
                                    host: "fakestoreapi.com",
                                    path: "/categories")
        case .category(id: let id):
            return URLConfiguration(scheme: "https",
                                    host: "fakestoreapi.com",
                                    path: "/categories/\(id)")
        }
    }
}





































