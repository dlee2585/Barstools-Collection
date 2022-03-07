//
//  UIViewController+Alert.swift
//  Barstools Collection
//
//  Created by David Lee on 3/7/22.
//

import UIKit

extension UIViewController {
    /// presentError
    ///
    /// Allows UIViewController to present error alert.
    func presentError(_ error: Error) {
        let alert = UIAlertController(title: "ERROR", message: error.localizedDescription, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { _ in
            self.dismiss(animated: true)
        }))
        present(alert, animated: true)
    }
}
