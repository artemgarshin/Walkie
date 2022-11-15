//Img cons
import Foundation
import UIKit



extension UIImageView{
    
    
    convenience init(image:UIImage?, contentMode: UIView.ContentMode){
        self.init()
        
        self.image = image
        self.contentMode = contentMode
    }
    
}
