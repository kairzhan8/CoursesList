//
//  CourseTableViewCellViewModelProtocol.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/22/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseTableViewCellViewModelProtocol {
    var courseName: String? { get }
    var courseImage: Data? { get }
    init(course: Course)
}
