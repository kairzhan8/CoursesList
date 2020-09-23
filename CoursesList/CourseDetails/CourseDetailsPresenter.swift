//
//  CourseDetailsPresenter.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

struct CourseDetailsData {
    var courseName: String?
    var numberOfLessons: String?
    var numberOfTests: String?
    var courseImage: Data?
}

protocol CourseDetailsPresenterProtocol: class {
    var isFavourite: Bool { get }
    func showDetails()
    func isFavouriteButtonPressed()
}

class CourseDetailsPresenter {
    
    weak var view: CourseDetailsViewProtocol!
    var interactor: CourseDetailsInteractorProtocol!
    
    var isFavourite: Bool {
        return interactor.isFavourite
    }
    
    required init(view: CourseDetailsViewProtocol) {
        self.view = view
    }
}

extension CourseDetailsPresenter: CourseDetailsPresenterProtocol {
    
    func showDetails() {
        interactor.provideCourseDetails()
        
    }
    
    func isFavouriteButtonPressed() {
        interactor.setFavouriteStatus()
        view.setImageForFavouriteButtton()
    }
    
}

extension CourseDetailsPresenter: CourseDetailsInteractorOutputProtocol {
    func receiveCourseDetails(courseDetailsData: CourseDetailsData) {
        view.setCourseName(with: courseDetailsData.courseName)
        view.setNumberOfLessons(with: courseDetailsData.numberOfLessons)
        view.setNumberOfTests(wiht: courseDetailsData.numberOfTests)
        guard let imageData = courseDetailsData.courseImage else { return }
        view.setCourseImage(with: imageData)
        view.setImageForFavouriteButtton()
    }
    
    
}
