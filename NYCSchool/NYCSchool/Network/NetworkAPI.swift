//
//  NetworkAPI.swift
//  NYCSchool
//
//  Created by Consultant on 7/6/22.
//

import UIKit
import Alamofire

let baseURL = "https://data.cityofnewyork.us/resource/"

class NetworkAPI{
    static func homeSchoolNameList(completion: @escaping(Result<[School], Error>) ->Void) {
        AF.request(baseURL + "s3k6-pzi2.json").responseData { response in
            switch response.result {
            case let .success(data):
                if let schoolName = try? JSONDecoder().decode([School].self, from: data){
                    completion(.success(schoolName))
                }else{
                    let error = NSError(domain: "NetworkAPI", code: 0, userInfo: [NSLocalizedDescriptionKey : "Decode error"])
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }
    
    static func schoolDetail(dbn: String, completion: @escaping (Result<[SAT], Error>) -> Void) ->Void {
        AF.request(baseURL + "f9bf-2cp4.json?dbn=\(dbn)").responseData { response in
            switch response.result {
            case let .success(data):
                if let satInfo = try? JSONDecoder().decode([SAT].self, from: data){
                    completion(.success(satInfo))
                }else{
                    let error = NSError(domain: "NetworkAPI", code: 0, userInfo: [NSLocalizedDescriptionKey : "Decode error"])
                    completion(.failure(error))
                }
                
            case let .failure(error):
                completion(.failure(error))
            }
        }
    }

    

}
