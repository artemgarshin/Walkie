//
//  LoginViewController.swift
//  Walkie
//
//  Created by Артем Гаршин on 14.11.2022.
//

import UIKit


class LoginViewController: UIViewController{
    
    
    let welcomeBackLablel = UILabel(text: "Welcome back!!", font: .avenir26())
    let loginLablel = UILabel(text: "Login with")
    let orLable = UILabel(text: "or")
    let emailLabel = UILabel(text: "Email")
    let passwordLabel = UILabel(text: "password")
    let needLabel = UILabel(text: "Need an account?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    
    let emailTextField = OneLineTextField(font: .avenir20())
    let passwordTextField = OneLineTextField(font: .avenir20())
    
    let loginButton = UIButton(title: "Login", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign up", for: .normal)
        button.setTitleColor(.mainBlue(), for: .normal)
        button.titleLabel?.font = .avenir20()
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        googleButton.customizeGoogleButton()
        setupConstraints()
        
    }
    
}

// setup constraints
extension LoginViewController{
    
    private func setupConstraints(){
        
        let loginWithView = ButtonFormView(label: loginLablel, button: googleButton)
        let emailStackView = UIStackView(arrangedSubviews: [
            emailLabel,
            emailTextField
            ],
                                    axis: .vertical,
                                    spacing: 0 )
        let passwordStackView = UIStackView(arrangedSubviews: [
            passwordLabel,
            passwordTextField
            ],
                                    axis: .vertical,
                                    spacing: 0 )
        
        loginButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [
            loginWithView,
            orLable,
            emailStackView,
            passwordStackView,
            loginButton
            ],
                                    axis: .vertical,
                                    spacing: 40)
        
        signUpButton.contentHorizontalAlignment = .leading
        let bottomStackView = UIStackView(arrangedSubviews: [
            needLabel,
            signUpButton
            ],
                                    axis: .horizontal,
                                    spacing: 8)
        bottomStackView.alignment = .firstBaseline
        
        welcomeBackLablel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        bottomStackView.translatesAutoresizingMaskIntoConstraints = false

        
        view.addSubview(welcomeBackLablel)
        view.addSubview(stackView)
        view.addSubview(bottomStackView )
        
        NSLayoutConstraint.activate([
            welcomeBackLablel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            welcomeBackLablel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
        
            stackView.topAnchor.constraint(equalTo: welcomeBackLablel.bottomAnchor,constant: 65),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        NSLayoutConstraint.activate([
            bottomStackView.topAnchor.constraint(equalTo: stackView.bottomAnchor,constant: 41),
            bottomStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 40),
            bottomStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40)
        ])
        
        
    }
    
    
    
}





// SwiftUI for canvas //
import SwiftUI

struct LoginVCProvider: PreviewProvider{
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable{
        
        let viewController = LoginViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) -> LoginViewController{
            return viewController
        }
        func updateUIViewController(_ uiViewController: LoginVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<LoginVCProvider.ContainerView>) {
            
        }
    }
}
