//
//  LoginViewController.swift
//  Login App
//
//  Created by Mary Wynzel Muring on 8/18/25.
//

import Foundation
import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var usernameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var errorLabel: UILabel!
    
    private lazy var loadingView: LoadingView = {
        let loadingView = LoadingView()
        return loadingView
    }()
    
    private let viewModel = LoginViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setup()
    }
    
    @IBAction func loginTapped(_ sender: UIButton) {
        guard let username = usernameTextField.text,
              let password = passwordTextField.text,
              username != "",
              password != ""
        else {
            // Added a validation that the username and password should not be empty
            self.errorLabel.text = LoginError.empty.localizedDescription
            self.errorLabel.isHidden = false
            
            return
        }
        
        let credential = LoginModel(username: username, password: password)
        
        loadingView.show(in: view)
        
        viewModel.login(
            loginCredential: credential
        )
        { [weak self] result in
            
            DispatchQueue.main.async {
                guard let self else { return }
                
                self.loadingView.hide()
                self.resetFields()
                
                switch result {
                    
                case .success(let user): // Added a sample usage of passing a data from the API call
                    self.viewModel.loggedInUser = user
                    self.goToWelcomePage()
                    
                case .failure(let error): // Added an error closure to show a failure instance of an API request
                    self.errorLabel.text = error.localizedDescription
                    self.errorLabel.isHidden = false
                }
            }
        }
    }
    
    func setup() {
        errorLabel.isHidden = true
        usernameTextField.delegate = self
        passwordTextField.delegate = self
        
        // Added tap gesture recognizer to dismiss the keyboard whenever the user taps the screen
        let tap = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tap)
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillShow),
            name: UIResponder.keyboardWillShowNotification,
            object: nil
        )
        
        NotificationCenter.default.addObserver(
            self,
            selector: #selector(keyboardWillHide),
            name: UIResponder.keyboardWillHideNotification,
            object: nil
        )
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardWillShow(_ notification: Notification) {
        errorLabel.isHidden = true
        
        guard let keyboardFrame = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue
        else { return }
        
        let bottomInset = keyboardFrame.height
        scrollView.contentInset.bottom = bottomInset
    }
    
    @objc func keyboardWillHide(_ notification: Notification) {
        scrollView.contentInset = .zero
    }
    
    private func goToWelcomePage() {
        let welcomeVC = storyboard?.instantiateViewController(withIdentifier: "WelcomeViewController") as! WelcomeViewController
        welcomeVC.modalPresentationStyle = .fullScreen
        present(welcomeVC, animated: true)
    }
    
    private func resetFields() {
        usernameTextField.text = ""
        passwordTextField.text = ""
    }
}

extension LoginViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        switch textField {
        case usernameTextField:
            passwordTextField.becomeFirstResponder()
            
        case passwordTextField:
            textField.resignFirstResponder()
            
        default: break
        }
        
        return true
    }
}
