//
//  APIError.swift
//  Stormy
//
//  Created by Kristopher Valas on 12/17/18.
//  Copyright © 2018. All rights reserved.
//

import Foundation

enum APIError : Error {
    case requestFailed
    case responseFailed(statusCode: Int)
    case invalidData
    case invalidJSON
    case invalidCoordinates
    case invalidJSONProperty
}
