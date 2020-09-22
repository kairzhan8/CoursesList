//
//  CourseDetailsViewModelProtocol.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/22/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseDetailsViewModelProtocol {
    var courseName: String? { get }
    var numberOfLessons: String? { get }
    var numberOfTests: String? { get }
    var courseImage: Data? { get }
    var isFavourite: Bool { get set }
    init(course: Course) 
}
