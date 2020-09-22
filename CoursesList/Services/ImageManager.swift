//
//  ImageManager.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/22/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    func getImageData(imageUrl: String?) -> Data? {
        guard let stringUrl = imageUrl else { return nil }
        guard let url = URL(string: stringUrl) else { return nil }
        guard let imageData = try? Data(contentsOf: url) else { return nil}
        return imageData
    }
}
