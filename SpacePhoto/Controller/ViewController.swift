//
//  ViewController.swift
//  SpacePhoto
//
//  Created by Руслан Акберов on 28.03.2018.
//  Copyright © 2018 Ruslan Akberov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var photoImage: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var copyrightLabel: UILabel!
    let photoInfoController = PhotoInfoController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        descriptionLabel.text = ""
        copyrightLabel.text = ""
        
        photoInfoController.fetchPhotoInfo { (photoInfo) in
            if let photoInfo = photoInfo {
                self.updateUI(with: photoInfo)
            }
        }
    }
    
    func updateUI(with photoInfo: PhotoInfo) {
        let task = URLSession.shared.dataTask(with: photoInfo.url) { (data, response, error) in
            if let data = data, let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    self.photoImage.image = image
                    self.title = photoInfo.title
                    self.descriptionLabel.text = photoInfo.description
                    if let copyright = photoInfo.copyright {
                        self.copyrightLabel.text = "Copyright \(copyright)"
                    } else {
                        self.copyrightLabel.isHidden = true
                    }
                }
            }
        }
        task.resume()
    }

}








