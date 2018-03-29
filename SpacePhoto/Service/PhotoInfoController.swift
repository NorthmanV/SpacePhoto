//
//  PhotoInfoController.swift
//  SpacePhoto
//
//  Created by Руслан Акберов on 29.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import Foundation

class PhotoInfoController {
    
    func fetchPhotoInfo(completion: @escaping (PhotoInfo?)->()) {
        let baseUrl = URL(string: "https://api.nasa.gov/planetary/apod")!
        let query = ["api_key": "DEMO_KEY"]
        let url = baseUrl.withQueries(query)!
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            let jsonDecoder = JSONDecoder()
            if let data = data, let photoInfo = try? jsonDecoder.decode(PhotoInfo.self, from: data) {
                completion(photoInfo)
            } else {
                print("Either no data was returned or data was not serialized.")
                completion(nil)
            }
        }
        task.resume()
    }
}



