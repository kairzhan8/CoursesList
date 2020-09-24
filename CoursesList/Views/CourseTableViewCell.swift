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
    
    func configure(course: CourseList.FetchCourses.ViewModel.DisplayedCourse) {
        courseName.text = course.courseName
        
        DispatchQueue.global().async {
            guard let imageData = course.imageData else { return }
            guard let image = UIImage(data: imageData) else { return }
            
            DispatchQueue.main.async {
                self.courseImage.image = image
            }
        }
    }
}
