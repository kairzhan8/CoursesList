//
//  CourseListConfigurator.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseListConfiguratorProtocol: class {
    func configure(with viewController: CoursesListTableViewController)
}

class CourseListConfigurator: CourseListConfiguratorProtocol {
    func configure(with viewController: CoursesListTableViewController) {
        let presenter = CourseListPresenter(view: viewController)
        let interactor = CourseListInteractor(presenter: presenter)
        let router = CourseListRouter(viewController: viewController)
        
        viewController.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router
    }
    
    
}
