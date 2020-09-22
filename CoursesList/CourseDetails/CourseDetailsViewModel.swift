//
//  CourseDetailsViewModel.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/22/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

class CourseDetailsViewModel: CourseDetailsViewModelProtocol {
    
    var courseName: String? {
        return course.name
    }
    
    var numberOfLessons: String? {
        return "\(course.numberOfLessons ?? 0)"
    }
    
    var numberOfTests: String? {
        return "\(course.numberOfTests ?? 0)"
    }
    
    var courseImage: Data? {
        return ImageManager.shared.getImageData(imageUrl: course.imageUrl)
    }
    
    var isFavourite: Bool {
        get {
            return DataManager.shared.loadFavouriteStatus(for: course.name ?? "")
        }
        set {
            DataManager.shared.saveFavouriteStatus(for: course.name ?? "", with: newValue)
        }
    }
    
    private var course: Course!
    
    required init(course: Course) {
        self.course = course
    }
    
}
