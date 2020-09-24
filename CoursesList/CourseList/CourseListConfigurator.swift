//
//  CourseListConfigurator.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/24/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

class CourseListConfigurator {
    
    static let shared = CourseListConfigurator()
    
    func configure(with view: CourseListViewController) {
        let viewController = view
        let interactor = CourseListInteractor()
        let presenter = CourseListPresenter()
        let router = CourseListRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        router.dataStore = interactor
    }
}
