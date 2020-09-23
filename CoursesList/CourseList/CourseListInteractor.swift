//
//  CourseListInteractor.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseListInteractorProtocol: class {
    func fetchCourses()
}

protocol CourseListInteractorOutputProtocol: class {
    func coursesDidReceive(_ courses: [Course])
}

class CourseListInteractor {
    
    weak var presenter: CourseListInteractorOutputProtocol!
    
    required init(presenter: CourseListInteractorOutputProtocol) {
        self.presenter = presenter
    }
}

extension CourseListInteractor: CourseListInteractorProtocol {
    
    func fetchCourses() {
        NetworkManager.shared.fetchCourses { [weak self] courses in
            self?.presenter.coursesDidReceive(courses)
        }
    }
}
