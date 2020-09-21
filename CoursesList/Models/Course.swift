//
//  Course.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

struct Course: Codable {
    let name: String?
    let imageUrl: String?
    var numberOfLessons: Int?
    let numberOfTests: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, imageUrl, numberOfLessons = "number_of_lessons", numberOfTests = "number_of_tests"
    }
}
