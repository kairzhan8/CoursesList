//
//  CourseTableViewCell.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/21/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import UIKit

class CourseTableViewCell: UITableViewCell {

    @IBOutlet var courseImage: UIImageView!
    @IBOutlet var courseName: UILabel!
    
    func configure(course: Course) {
        courseName.text = course.name
        
        DispatchQueue.global().async {
            guard let url = course.imageUrl else { return }
            guard let imageUrl = URL(string: url) else { return }
            guard let imageData = try? Data(contentsOf: imageUrl) else { return }
            guard let image = UIImage(data: imageData) else { return }
            
            DispatchQueue.main.async {
                self.courseImage.image = image
            }
        }
    }
}
