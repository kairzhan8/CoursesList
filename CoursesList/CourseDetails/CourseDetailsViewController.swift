//
//  CourseDetailsViewController.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

protocol CourseDetailsViewProtocol: class {
    func setCourseName(with title: String?)
    func setNumberOfLessons(with title: String?)
    func setNumberOfTests(wiht title: String?)
    func setCourseImage(with imageData: Data)
    func setImageForFavouriteButtton()
}

class CourseDetailsViewController: UIViewController {
    
    var presenter: CourseDetailsPresenterProtocol!
    
    private var isFavourite = false
    private let configurator: CourseDetailsConfiguratorProtocol = CourseDetailsConfigurator()

    @IBOutlet var courseName: UILabel!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    @IBOutlet var favouriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.showDetails()
    }

    @IBAction func toggleFavourite(_ sender: UIButton) {
        presenter.isFavouriteButtonPressed()
    }
}

// MARK: - CourseDetailsViewProtocol
extension CourseDetailsViewController: CourseDetailsViewProtocol {
    
    func setCourseName(with title: String?) {
        courseName.text = title
    }
    
    func setNumberOfLessons(with title: String?) {
        numberOfLessons.text = title
    }
    
    func setNumberOfTests(wiht title: String?) {
        numberOfTests.text = title
    }
    
    func setCourseImage(with imageData: Data) {
        courseImage.image = UIImage(data: imageData)
    }
    
    func setImageForFavouriteButtton() {
        let image = presenter.isFavourite ? #imageLiteral(resourceName: "like-2") : #imageLiteral(resourceName: "like")
        favouriteButton.setImage(image, for: .normal)
    }
}
