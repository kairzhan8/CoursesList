//
//  CourseListPresenter.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseListPresenterProtocol: class {
    var courses: [Course] { get }
    func coursesCount() -> Int?
    func viewDidLoad()
    func course(at indexPath: IndexPath) -> Course?
    func showCourseDetails(for indexPath: IndexPath)
}

class CourseListPresenter {
    
    weak var view: CourseListViewProtocol!
    var interactor: CourseListInteractorProtocol!
    var router: CourseListRouterProtocol!
    
    var courses: [Course] = []
    
    required init(view: CourseListViewProtocol) {
        self.view = view
    }
}
// MARK: - CourseListPresenterProtocol
extension CourseListPresenter: CourseListPresenterProtocol {
    
    func coursesCount() -> Int? {
        return courses.count
    }
    
    func viewDidLoad() {
        interactor.fetchCourses()
    }
    
    func course(at indexPath: IndexPath) -> Course? {
        if courses.indices.contains(indexPath.row) {
            return courses[indexPath.row]
        } else {
            return nil
        }
    }
    
    func showCourseDetails(for indexPath: IndexPath) {
        if courses.indices.contains(indexPath.row) {
            let course = courses[indexPath.row]
            router.openCourseDetailsViewController(with: course)
        }
    }
}

//MARK: - CourseListInteractorOutputProtocol
extension CourseListPresenter: CourseListInteractorOutputProtocol {
    func coursesDidReceive(_ courses: [Course]) {
        self.courses = courses
        view.reloadData()
    }
    
    
}
