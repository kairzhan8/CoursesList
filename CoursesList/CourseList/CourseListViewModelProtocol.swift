//
//  CourseListViewModelProtocol.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/22/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseListViewModelProtocol {
    var courses: [Course] { get }
    func getCourses(completion: @escaping () -> Void)
    func numberOfRows() -> Int?
    func cellViewModel(for indexPath: IndexPath) -> CourseTableViewCellViewModelProtocol?
    func selectedRow(for indexPath: IndexPath)
    func viewModelForSelectedRow() -> CourseDetailsViewModelProtocol?
}
