//
//  AddPhotoView.swift
//  Walkie

import Foundation
import UIKit


class AddPhotoView: UIView{
    
    var circleImageView : UIImageView = {
         let imageView = UIImageView()
         imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.image = #imageLiteral(resourceName: "image")
         imageView.contentMode = .scaleAspectFill
         imageView.clipsToBounds = true
         imageView.layer.borderColor = UIColor.black.cgColor
         imageView.layer.borderWidth = 1
         return imageView
    }()
    
    let plusButton: UIButton = {
         let button = UIButton(type: .system)
         button.translatesAutoresizingMaskIntoConstraints = false
         let myImage = #imageLiteral(resourceName: "Combined Shape")
         button.setImage(myImage, for: .normal)
         button.tintColor = .buttonDark()
         return button
        
    }()
    
    override init(frame: CGRect){
        super.init(frame: frame)
        
        addSubview(circleImageView)
        addSubview(plusButton)
        setupConstraints()
        
    }
    
    private func setupConstraints(){
        NSLayoutConstraint.activate([
            circleImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 0),
            circleImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            //circleImageView.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            circleImageView.widthAnchor.constraint(equalToConstant: 100),
            circleImageView.heightAnchor.constraint(equalToConstant: 100)
        ])
        NSLayoutConstraint.activate([
            plusButton.leadingAnchor.constraint(equalTo: circleImageView.trailingAnchor, constant: 11),
            plusButton.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            plusButton.widthAnchor.constraint(equalToConstant: 30),
            plusButton.heightAnchor.constraint(equalToConstant: 30)
        
        ])
        
        self.bottomAnchor.constraint(equalTo: circleImageView.bottomAnchor).isActive = true
        self.trailingAnchor.constraint(equalTo: plusButton.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        circleImageView.layer.masksToBounds = true
        circleImageView.layer.cornerRadius = circleImageView.frame.width/2
    }
    
}
