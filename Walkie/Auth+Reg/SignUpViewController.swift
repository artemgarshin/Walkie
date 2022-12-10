//
//  SignUpViewController.swift (Экран входа)
//  Walkie
//
//  Created by Артем Гаршин on 11.11.2022.
//

import UIKit


class SignUpViewController: UIViewController {
    
    let welcomeLablel = UILabel(text: "Hello!", font: .avenir26())
    
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "Password")
    let confirmLabel = UILabel(text: "Confirm your password")
    let alreadyOnboardLabel = UILabel(text: "Already onboard?")
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    let confirmTextField = OneLineTextField(font: .avenir20())
    
    let signUpButton = UIButton(title: "Sign up", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.setTitleColor(.mainBlue(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()
    weak var delegate: AuthNavigatingDelegate?
    
    
    override func viewDidLoad(){
        super.viewDidLoad()
        
        
        view.backgroundColor = .white
        setupConstraints()
        
        signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        
    }
    @objc private func signUpButtonTapped(){
        print(#function)
        AuthService.shared.register(email: emailTextField.text,
                                    password: passwordTextField.text,
                                    confirmPassword: confirmTextField.text) { (result) in
            switch result {
            case .success(let user):
                self.showAlert(with: "Успешно!", and: "Вы зрегестрированы!"){
                    self.present(SetupProfileViewController(), animated: true, completion: nil)
                }
                print(user.email)
            case .failure(let error):
                self.showAlert(with: "Ошибка", and: error.localizedDescription)
            }
            
            
        }
    }
    @objc private func loginButtonTapped(){
        self.dismiss(animated: true){
            self.delegate?.toLoginVC()
        }

    }
}


extension SignUpViewController{
    private func setupConstraints(){
        let emailStackView = UIStackView(arrangedSubviews: [emailLabel,emailTextField], axis: .vertical, spacing: 0)
        let passwardStackView = UIStackView(arrangedSubviews: [passwordLabel,passwordTextField], axis: .vertical, spacing: 0)
        let confirmStackView = UIStackView(arrangedSubviews: [confirmLabel,confirmTextField], axis: .vertical, spacing: 0)
        
        
        signUpButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        
        let stackView = UIStackView(arrangedSubviews: [
            emailStackView,
            passwardStackView,
            confirmStackView,
            signUpButton],
            axis: .vertical,
            spacing: 40)
        
        loginButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews:
            [alreadyOnboardLabel,
            loginButton],
            axis: .horizontal,
            spacing: 8)
        bottomStackView.alignment = .firstBaseline
        
        welcomeLablel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(welcomeLablel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView)
        
        
        NSLayoutConstraint.activate([
            welcomeLablel.topAnchor.constraint(equalTo: view.topAnchor,constant: 160 ),
            welcomeLablel.centerXAnchor.constraint(equalTo: view.centerXAnchor )

        ])
        
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: welcomeLablel.bottomAnchor,constant: 62),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 160),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
    }
}

// Swiftui for Canvas//
import SwiftUI

struct SignUpVCProvider: PreviewProvider{
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable{
        
        let signUpvc = SignUpViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) -> SignUpViewController{
            return signUpvc
        }
        func updateUIViewController(_ uiViewController: SignUpVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SignUpVCProvider.ContainerView>) {
            
        }
    }
}
extension UIViewController{
    
    
    func showAlert(with title: String, and messege: String, completion: @escaping () -> Void = { }){
        let alertController = UIAlertController(title: title, message: messege, preferredStyle: .alert)
        
        
        
        let okAction = UIAlertAction(title: "OK", style: .default) { (_) in
            completion()
        }
        alertController.addAction(okAction)
        present(alertController, animated: true,completion: nil)
    }
    
}
