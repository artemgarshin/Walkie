//constrains for button with label 

import Foundation
import UIKit


class ButtonFormView: UIView{
    
    init(label: UILabel, button: UIButton){
        super.init(frame: .zero)
        
        self.translatesAutoresizingMaskIntoConstraints = false // посмтортеь что за функция
        label.translatesAutoresizingMaskIntoConstraints = false
        button.translatesAutoresizingMaskIntoConstraints = false
        
        
        self.addSubview(label)
        self.addSubview(button)
        
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor)])
        
        
        NSLayoutConstraint.activate([
            button.topAnchor.constraint(equalTo: label.bottomAnchor, constant: 20),
            button.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            button.heightAnchor.constraint(equalToConstant: 60)

            
        ])
        
        bottomAnchor.constraint(equalTo: button.bottomAnchor).isActive = true
        
        }
        
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
