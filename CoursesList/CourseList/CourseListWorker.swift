//
//  CourseListWorker.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/24/20.
//  Copyright (c) 2020 Kairzhan Kural. All rights reserved.
//
//  This file was generated by the Clean Swift Xcode Templates so
//  you can apply clean architecture to your iOS and Mac projects,
//  see http://clean-swift.com
//

import UIKit

class CourseListWorker {
    func getDisplayerCourses(from courses: [Course]) -> [CourseList.FetchCourses.ViewModel.DisplayedCourse] {
        
        var displayedCourses: [CourseList.FetchCourses.ViewModel.DisplayedCourse] = []
        courses.forEach { (course) in
            let courseName = course.name
            let imageData = fetchImage(from: course.imageUrl)
            
            let displayedCourse = CourseList.FetchCourses.ViewModel.DisplayedCourse(
                courseName: courseName, imageData: imageData)
            displayedCourses.append(displayedCourse)
        }
        return displayedCourses
    }
    
    private func fetchImage(from imageUrl: String?) -> Data? {
        ImageManager.shared.fetchImageData(from: imageUrl)
    }
    
}
