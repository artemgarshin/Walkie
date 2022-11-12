//
//  SignUpViewController.swift
//  Walkie
//
//  Created by Артем Гаршин on 11.11.2022.
//

import UIKit


class SignUpViewController: UIViewController {
    
    
    let welcomeLabel = UILabel(text: "Hello", font: .avenir26()) // остановился на 5 минуте 7 урок 
    
    
    
    override func viewDidLoad(){
        super.viewDidLoad() // разобраться для чего все нужно
        
        view.backgroundColor = .blue
        
        
    }
    
}



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
