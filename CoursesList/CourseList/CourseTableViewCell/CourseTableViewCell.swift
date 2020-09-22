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
    
    var viewModel: CourseTableViewCellViewModelProtocol! {
        didSet {
            courseName.text = viewModel.courseName
            guard let imageData = viewModel.courseImage else { return }
            courseImage.image = UIImage(data: imageData)
        }
    }
}
