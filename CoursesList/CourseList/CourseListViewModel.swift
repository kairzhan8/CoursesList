//
//  CourseListViewModel.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/22/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

class CourseListViewModel: CourseListViewModelProtocol {
    var courses: [Course] = []
    
    private var indexPath: IndexPath?
    
    func getCourses(completion: @escaping () -> Void) {
        NetworkManager.shared.fetchCourses { courses in
            self.courses = courses
            completion()
        }
    }
    
    func numberOfRows() -> Int? {
        return courses.count
    }
    
    func cellViewModel(for indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol? {
        let course = courses[indexPath.row]
        return CourseTableViewCellViewModel(course: course)
    }
    
    func selectedRow(for indexPath: IndexPath) {
        self.indexPath = indexPath
    }
    
    func viewModelForSelectedRow() -> CourseDetailsViewModelProtocol? {
        guard let indexPath = indexPath else { return nil }
        let course = courses[indexPath.row]
        return CourseDetailsViewModel(course: course)
    }
    
}
