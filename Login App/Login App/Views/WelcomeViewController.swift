//
//  WelcomeViewController.swift
//  Login App
//
//  Created by Mary Wynzel Muring on 8/18/25.
//

import Foundation
import UIKit

class WelcomeViewController: UIViewController {
    @IBOutlet weak var welcomeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissView))
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissView() {
        dismiss(animated: true)
    }
}
