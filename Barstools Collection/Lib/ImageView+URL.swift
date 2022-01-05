//
//  ImageView+URL.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import Foundation
import UIKit

extension UIImageView {
    func setImage(url: String) {
        guard let url = URL(string: url) else {
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                print(error)
                return
            }
            
            guard let safeData = data, let image = UIImage(data: safeData) else {
                print("Failed to retrieve data while loading image")
                return
            }
            
            DispatchQueue.main.async {
                self.image = image
            }
        }
        
        task.resume()
    }
}
