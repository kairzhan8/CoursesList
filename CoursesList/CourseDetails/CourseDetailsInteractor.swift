//
//  CourseDetailsInteractor.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseDetailsInteractorProtocol: class {
    var isFavourite: Bool { get set }
    func provideCourseDetails()
    func setFavouriteStatus()
}

protocol CourseDetailsInteractorOutputProtocol: class {
    func receiveCourseDetails(courseDetailsData: CourseDetailsData)
}

class CourseDetailsInteractor {
    
    weak var presentor: CourseDetailsInteractorOutputProtocol!
    
    private var course: Course
    
    init(presenter: CourseDetailsInteractorOutputProtocol, course: Course) {
        self.course = course
        self.presentor = presenter
    }
}

extension CourseDetailsInteractor: CourseDetailsInteractorProtocol {
    var isFavourite: Bool {
        get {
            DataManager.shared.loadFavouriteStatus(for: course.name ?? "")
        }
        set {
            DataManager.shared.saveFavouriteStatus(for: course.name ?? "", with: newValue)
        }
    }
    
    func provideCourseDetails() {
        let courseDetailsData = CourseDetailsData(
            courseName: course.name,
            numberOfLessons: "\(course.numberOfLessons ?? 0)",
            numberOfTests: "\(course.numberOfTests ?? 0)",
            courseImage: ImageManager.shared.getImageData(for: course.imageUrl)
        )
        presentor.receiveCourseDetails(courseDetailsData: courseDetailsData)
    }
    
    func setFavouriteStatus() {
        isFavourite.toggle()
    }
    
}
