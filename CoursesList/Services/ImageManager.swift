//
//  ImageManager.swift
//  CoursesList
//
//  Created by Kairzhan Kural on 9/23/20.
//  Copyright © 2020 Kairzhan Kural. All rights reserved.
//

import Foundation

class ImageManager {
    static let shared = ImageManager()
    
    func getImageData(for imageUrl: String?) -> Data? {
        guard let stringUrl = imageUrl else { return nil }
        guard let imageUrl = URL(string: stringUrl) else { return nil }
        guard let imageData = try? Data(contentsOf: imageUrl) else { return nil }
        return imageData
    }
}
