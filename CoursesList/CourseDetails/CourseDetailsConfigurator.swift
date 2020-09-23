//
//  CourseDetailsConfigurator.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

protocol CourseDetailsConfiguratorProtocol: class {
    func configure(with view: CourseDetailsViewController, and course: Course)
}

class CourseDetailsConfigurator: CourseDetailsConfiguratorProtocol {
    func configure(with view: CourseDetailsViewController, and course: Course) {
        let presenter = CourseDetailsPresenter(view: view)
        let interactor = CourseDetailsInteractor(presenter: presenter, course: course)
        
        view.presenter = presenter
        presenter.interactor = interactor
    }
    
}
