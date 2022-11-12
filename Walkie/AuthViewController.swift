import UIKit

class AuthViewController: UIViewController {
    
    
    let logoImageView = UIImageView(image: #imageLiteral(resourceName: "Logo") , contentMode: .scaleAspectFit)
    
    let googleLabel = UILabel(text: "Get started with")
    let emailLabel = UILabel(text: "Or sigh up with")
    let alreadyLabel = UILabel(text: "Already onboard?")
    
    let googleButton = UIButton(title: "Google", titleColor: .black, backgroundColor: .white, isShadow: true)
    let emailButton = UIButton(title: "Email", titleColor: .white, backgroundColor: .buttonDark())
    let loginButton = UIButton(title: "Login", titleColor: .mainBlue(), backgroundColor: .white, isShadow: true)
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .white
        
        setupConstrainst()
        
    }

}


// setup our constrantions //
extension AuthViewController{
    private func setupConstrainst(){
        logoImageView.translatesAutoresizingMaskIntoConstraints = false
        let googleView = ButtonFormView(label: googleLabel, button: googleButton)
        let emailView = ButtonFormView(label: emailLabel, button: emailButton)
        let loginView = ButtonFormView(label: alreadyLabel, button: loginButton)

        
        let StackView = UIStackView(arrangedSubviews: [googleView,emailView,loginView], axis: .vertical, spacing: 40)
        StackView.translatesAutoresizingMaskIntoConstraints = false
        
        
        view.addSubview(logoImageView)
        view.addSubview(StackView)
        
        

        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.topAnchor, constant: 160),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        NSLayoutConstraint.activate([
            StackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160),
            StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40),
            StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)
        ])
        
        StackView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 160)
        StackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 40)
        StackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -40)

        
    }
}


// SwiftUI for canvas //
import SwiftUI

struct AuthVCProvider: PreviewProvider{
    static var previews: some View{
        ContainerView().edgesIgnoringSafeArea(.all)
    }
    
    struct ContainerView: UIViewControllerRepresentable{
        
        let viewController = AuthViewController()
        
        func makeUIViewController(context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) -> AuthViewController{
            return viewController
        }
        func updateUIViewController(_ uiViewController: AuthVCProvider.ContainerView.UIViewControllerType, context: UIViewControllerRepresentableContext<AuthVCProvider.ContainerView>) {
            
        }
    }
}

