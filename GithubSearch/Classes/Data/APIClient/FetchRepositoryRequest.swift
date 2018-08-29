//
//  FetchRepositoryRequest.swift
//  GithubSearch
//
//  Created by ken.phanith on 2018/08/19.
//  Copyright © 2018 Quad. All rights reserved.
//

import Foundation
import Himotoki
import APIKit

extension APIClient.Fetch {
    
    struct GetFetchRepositoryRequest: RequestType {
        
        typealias Response = APIClient.Fetch.ResponseFetchRepositoryDecode
        
        let query: String
        
        var path: String {
            return "/search/repositories"
        }
        
        var method: HTTPMethod {
            return .get
        }
        
        var parameters: Any? {
            return [
                "q": self.query
            ]
        }
    }
    
    struct ResponseFetchRepositoryDecode: Himotoki.Decodable {
        let items: [ResponseFetchRepositoryItems]
        
        static func decode(_ e: Extractor) throws -> APIClient.Fetch.ResponseFetchRepositoryDecode {
            return try ResponseFetchRepositoryDecode(
                items: e <|| "items"
            )
        }
    }
    
    struct ResponseFetchRepositoryItems: Himotoki.Decodable {
        let id: Int
        let name: String
        let fullName: String
        let htmlUrl: String
        
        static func decode(_ e: Extractor) throws -> APIClient.Fetch.ResponseFetchRepositoryItems {
            return try ResponseFetchRepositoryItems(
                id: e <| "id",
                name: e <| "name",
                fullName: e <| "full_name",
                htmlUrl: e <| "html_url"
            )
        }
    }
    
}
