//
//  NetworkManager.swift
//  Hubba
//
//  Created by Alex Lee on 2017-01-24.
//  Copyright © 2017 AlexCJLee. All rights reserved.
//

import UIKit
import Alamofire

public class NetworkManager: NSObject {
    static let shared = NetworkManager()
    private var baseURL = ""
    private lazy var sessionManager: SessionManager = {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["Accept": "application/json", "Content-Type": "application/json"]
        
        let sessionManager = SessionManager(configuration: configuration)
        return sessionManager
    }()
    
    //MARK: - Public
    func update(baseURL: String)
    {
        self.baseURL = baseURL
    }
    
    func makeRequestWith(path: String, method: HTTPMethod, parameters: Parameters? = nil, headers: [String: String]? = nil) -> DataRequest
    {
        let url = String(format: "%@%@", baseURL, path)
        var encoding: ParameterEncoding?
        
        switch method
        {
        case .get:
            encoding = URLEncoding.default
        case .post, .put, .patch, .delete, .connect, .options, .head, .trace:
            encoding = JSONEncoding.default
        }
        
        let httpMethod = HTTPMethod(rawValue: method.rawValue)!
        return sessionManager.request(url, method: httpMethod, parameters: parameters, encoding: encoding!, headers: headers)
    }
}

extension NetworkManager: APIExecutable
{
    func execute(_ request: APIRequest, success: ((Any?) -> ())?, failure: ((NSError) -> ())?)
    {
        makeRequestWith(path: request.path, method: request.method, parameters: request.parameters()).responseJSON { response in
            switch response.result
            {
            case .success(let value):
                success?(value)
            case .failure(let error):
                failure?(error as NSError)
            }
        }
    }
}
