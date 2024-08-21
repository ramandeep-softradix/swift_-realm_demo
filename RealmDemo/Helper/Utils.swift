//
//  Utils.swift
//  RealmDemo
//
//  Created by Jaskaran softradix on 21/08/24.
//

import Foundation
import UIKit

class Utils {
    
    static func showAlert(
        title: String = "Alert",
        message: String,
        in viewController: UIViewController,
        completion: @escaping () -> Void = {}
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            completion()
        }
        alertController.addAction(okAction)
        viewController.present(alertController, animated: true, completion: nil)
    }
}
