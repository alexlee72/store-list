//
//  APIExecutable.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-24.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import Foundation

protocol APIExecutable
{
    func execute(_ request: APIRequest, success: ((Any?) -> ())?, failure: ((NSError) -> ())?)
}
