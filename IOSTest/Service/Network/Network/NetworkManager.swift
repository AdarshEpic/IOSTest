//
//  NetworkManager.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import Foundation

class NetworkManager<T: Decodable>: NSObject, NetworkManagerProtocol {
    typealias RequestCompletion = (_ error: APIResultStatus?, _ data: Any?) -> Void
    var completionBlock: RequestCompletion!
    var requestMethod: HTTPMethod!
    var requestUrl: String!
    
    // MARK: Setup Root
    func setupRoot() -> URL {
        let finalRequestString = Environment.rootURL + Environment.apiKey + requestUrl
        return URL(string: finalRequestString)!
        
    }
    // MARK: Request
    func perform<M: Encodable>(params: M?, completion: @escaping RequestCompletion) {
        let url = setupRoot()
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = requestMethod.rawValue
        
        NetworkReachabilityManager.isReachable { (status) in
            if status {
                
            }
        }
        //geting post body
        do {
            let jsonBody = try JSONEncoder().encode(params)
            request.httpBody = jsonBody
        } catch let error {
            print("httpBodyError: ", error.localizedDescription)
        }
        //create data task
        let dataTask = URLSession.shared.dataTask(with: request) { data, _, err  in
            
            guard err == nil else {
                completion(.failure, nil)
                print("reqeust error: ", err?.localizedDescription ?? "")
                return
            }
            
            guard data != nil else {
                print("Error in getting data")
                return
            }
            do {
                let decodedResult = try JSONDecoder().decode(T.self, from: data!)
                print("responseFromServer:", decodedResult)
                //invoke the completion handler on the main thread
                DispatchQueue.main.async {
                    
                }
            } catch let error as NSError {
                print(error.localizedDescription)
            }
            
        }
        dataTask.resume()
    }
}

//SERVICE STATUS
enum APIResultStatus {
    case success
    case failure
    case tokenIssue
    case networkIssue
}
//REST Methods
enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
