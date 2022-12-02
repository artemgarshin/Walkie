//
//  SetupProfileViewController.swift
//  Walkie
//
//

import Foundation
import UIKit



class SetupProfileViewController: UIViewController{
    
    let setupLablel = UILabel(text: "Set up profile", font: .avenir26())
    let fullNameLabel = UILabel(text: "Full name")
    let aboutMeLabel = UILabel(text: "About me")
    let sexLabel = UILabel(text: "Sex")
    
    let fullNameTextField = OneLineTextField(font: .avenir20())
    let aboutMeTextField = OneLineTextField(font: .avenir20())
    
    let sexSegmentedControl = UISegmentedControl(first: "Male", second: "Female", third: "Other")
    
    let goToChatButton = UIButton(title: "Go to chat!", titleColor: .white, backgroundColor: .buttonDark(), cornerRadius: 4)
    


    
    let avatarView = AddPhotoView()
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupConstraints()
        
    }
    
}


//setup Constraints
extension SetupProfileViewController {
    private func setupConstraints() {
        let fullNameStackView = UIStackView(arrangedSubviews: [fullNameLabel, fullNameTextField],
                                            axis: .vertical,
                                            spacing: 0)
        let aboutMeStackView = UIStackView(arrangedSubviews: [aboutMeLabel, aboutMeTextField],
        axis: .vertical,
        spacing: 0)
        let sexStackView = UIStackView(arrangedSubviews: [sexLabel, sexSegmentedControl],
        axis: .vertical,
        spacing: 12)
        
        goToChatButton.heightAnchor.constraint(equalToConstant: 60).isActive = true
        let stackView = UIStackView(arrangedSubviews: [
            fullNameStackView,
            aboutMeStackView,
            sexStackView,
            goToChatButton
            ], axis: .vertical, spacing: 40)
        
        setupLablel.translatesAutoresizingMaskIntoConstraints = false
        avatarView.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(setupLablel)
        view.addSubview(avatarView)
        view.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            setupLablel.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            setupLablel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            avatarView.topAnchor.constraint(equalTo: setupLablel.bottomAnchor, constant: 40),
            avatarView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: avatarView.bottomAnchor, constant: 40),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
    }
}

    
    










// SwiftUI for canvas //
import SwiftUI

struct SetupProfileVCProvider: PreviewProvider{
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable{
        
        let viewController = SetupProfileViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) -> SetupProfileViewController{
            return viewController
        }
        func updateUIViewController(_ uiViewController: SetupProfileVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<SetupProfileVCProvider.ContainerView>) {
            
        }
    }
}
