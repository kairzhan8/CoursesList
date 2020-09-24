//
//  CourseDetailsPresenter.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/24/20.
//  Copyright (c) 2020 Kairzhan Kural. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

protocol CourseDetailsPresentationLogic {
    func presentDetails(response: CourseDetails.ShowDetails.Response)
    func presentFavouriteStatus(response: CourseDetails.SetFavouriteStatus.Response)
}

class CourseDetailsPresenter: CourseDetailsPresentationLogic {
    
    weak var viewController: CourseDetailsDisplayLogic?
    var worker: CourseDetailsWorker?
    // MARK: Do something
    
    func presentDetails(response: CourseDetails.ShowDetails.Response) {
        
        worker = CourseDetailsWorker()
        
        let numberOfLessons = "\(response.course.numberOfLessons ?? 0)"
        let numberOfTests = "\(response.course.numberOfTests ?? 0)"
        let imageData = worker?.fetchImage(from: response.course.imageUrl)
        let displayedDetails = CourseDetails.ShowDetails.ViewModel.DisplayedDetails(
            courseName: response.course.name,
            numberOfLessons: numberOfLessons,
            numberOfTests: numberOfTests,
            imageData: imageData,
            isFavourite: response.isFavourite)
        let viewModel = CourseDetails.ShowDetails.ViewModel(displayedDetails: displayedDetails)
        viewController?.displayDetails(viewModel: viewModel)
    }
    
    func presentFavouriteStatus(response: CourseDetails.SetFavouriteStatus.Response) {
        let viewModel = CourseDetails.SetFavouriteStatus.ViewModel(isFavourite: response.isFavourite)
        viewController?.displayImageForFavouriteButton(viewModel: viewModel)
    }
}
