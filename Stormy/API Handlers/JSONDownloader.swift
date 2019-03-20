//
//  JSONDownloader.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/17/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation


class JSONDownloader {
    
    typealias JSON = [String : AnyObject]
    
    
    func callAPI(for session: URLSession, request: URLRequest, handler completion: @escaping (JSON?, APIError?) -> Void) -> URLSessionDataTask {
        let dataTask = session.dataTask(with: request) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse else {
                completion(nil, .requestFailed)
                return
            }
            if httpResponse.statusCode == 200 {
                if let data = data {
                    do {
                        let jsonData = try JSONSerialization.jsonObject(with: data, options: []) as? JSON
                        completion(jsonData, nil)
                    }catch {
                        completion(nil, .invalidJSON)
                    }
                }else {
                    completion(nil, .invalidData)
                }
            }else {
                completion(nil, .responseFailed(statusCode: httpResponse.statusCode))
            }
        }
        
        return dataTask
    }
}
