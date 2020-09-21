//
//  CourseDetailsViewController.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class CourseDetailsViewController: UIViewController {
    
    var course: Course!
    private var isFavourite = false

    @IBOutlet var courseName: UILabel!
    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var numberOfLessons: UILabel!
    @IBOutlet var numberOfTests: UILabel!
    @IBOutlet var favouriteButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loadFavouriteStatus()
        setupUI()
        
    }

    @IBAction func toggleFavourite(_ sender: UIButton) {
        isFavourite.toggle()
        let image = setImageForFavouriteButton()
        sender.setImage(image, for: .normal)
        DataManager.shared.saveFavouriteStatus(for: course.name ?? "", with: isFavourite)
    }
    
    private func setupUI() {
        title = course.name
        courseName.text = course.name
        numberOfLessons.text = "\(course.numberOfLessons ?? 0)"
        numberOfTests.text = "\(course.numberOfTests ?? 0)"
        
        let image = setImageForFavouriteButton()
        favouriteButton.setImage(image, for: .normal)
        
        DispatchQueue.global().async {
            guard let urlString = self.course.imageUrl else { return }
            guard let url = URL(string: urlString) else { return }
            guard let imageData = try? Data(contentsOf: url) else { return }
            DispatchQueue.main.async {
                self.courseImage.image = UIImage(data: imageData)
            }
        }
    }
    
    private func setImageForFavouriteButton() -> UIImage {
        return isFavourite ? #imageLiteral(resourceName: "like-2") : #imageLiteral(resourceName: "like")
    }
    
    private func loadFavouriteStatus() {
        isFavourite = DataManager.shared.loadFavouriteStatus(for: course.name ?? "")
    }
    
    
    
}
