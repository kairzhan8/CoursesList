//
//  NetworkManager.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    
    private let url = "https://swiftbook.ru//wp-content/uploads/api/api_courses"
    
    func fetchCourses(completion: @escaping ([Course]) -> ()) {
        guard let url = URL(string: url) else { return}
        AF.request(url).validate().responseJSON { responseData in
            switch responseData.result {
            case .success( _):
                guard let data = responseData.data else { return }
                let decodedData = try? JSONDecoder().decode([Course].self, from: data)
                let courses = decodedData
                
                DispatchQueue.main.async {
                    completion(courses ?? [])
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
