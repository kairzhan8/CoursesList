//
//  CourseDetailsViewController.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
//    private var isFavourite = false
    var viewModel: CourseDetailsViewModelProtocol! 

    @IBOutlet var courseName: UILabel!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    @IBOutlet var favouriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        
    }

    @IBAction func toggleFavourite(_ sender: UIButton) {
        viewModel.isFavourite.toggle()
        let image = setImageForFavouriteButton()
        sender.setImage(image, for: .normal)
    }
    
    private func setupUI() {
        title = viewModel.courseName
        
        courseName.text = viewModel.courseName
        numberOfLessons.text = viewModel.numberOfLessons
        numberOfTests.text = viewModel.numberOfTests
        guard let imageData = viewModel.courseImage else { return }
        courseImage.image = UIImage(data: imageData)
        
        let image = setImageForFavouriteButton()
        favouriteButton.setImage(image, for: .normal)
    }
    
    private func setImageForFavouriteButton() -> UIImage {
        return viewModel.isFavourite ? #imageLiteral(resourceName: "like-2") : #imageLiteral(resourceName: "like")
    }
    
    
    
}
