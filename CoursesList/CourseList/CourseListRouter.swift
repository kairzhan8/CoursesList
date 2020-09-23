//
//  CourseListRouter.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseListRouterProtocol: class {
    func openCourseDetailsViewController(with course: Course)
}

class CourseListRouter {
    
    weak var viewController: CoursesListTableViewController!
    
    init(viewController: CoursesListTableViewController) {
        self.viewController = viewController
    }
}

extension CourseListRouter: CourseListRouterProtocol {
    func openCourseDetailsViewController(with course: Course) {
        viewController.performSegue(withIdentifier: viewController.selfToCourseDetailsSegueName, sender: course)
    }
    
    
    
}
