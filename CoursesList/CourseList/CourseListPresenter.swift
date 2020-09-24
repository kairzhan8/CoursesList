//
//  CourseListPresenter.swift
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

protocol CourseListPresentationLogic {
    func presentCourses(response: CourseList.FetchCourses.Response)
}

class CourseListPresenter: CourseListPresentationLogic {
    
    weak var viewController: CourseListDisplayLogic?
    var worker: CourseListWorker?
    
    // MARK: Do something
    
    func presentCourses(response: CourseList.FetchCourses.Response) {
        worker = CourseListWorker()
        guard let displayedCourses = worker?.getDisplayerCourses(from: response.courses) else { return }
        let viewModel = CourseList.FetchCourses.ViewModel(displayedCourses: displayedCourses)
        viewController?.displayCourses(viewModel: viewModel)
    }
}
