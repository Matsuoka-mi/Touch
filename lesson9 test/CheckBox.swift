//
//  CheckBox.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/24.
//

import UIKit

class CheckBox: UIButton {
    
    
    
    
    // Images
       let checkedImage = UIImage(named: "checkON")! as UIImage
       let uncheckedImage = UIImage(named: "checkOFF")! as UIImage
       
       // Bool property
       var isChecked: Bool = false {
           didSet{
               if isChecked == true {
                   self.setImage(checkedImage, for: UIControl.State.normal)
               } else {
                   self.setImage(uncheckedImage, for: UIControl.State.normal)
               }
           }
       }
       
       override func awakeFromNib() {
           self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
           self.isChecked = false
       }
       
       @objc func buttonClicked(sender: UIButton) {

       }
       
       func setChecked(_ check : Bool){
           isChecked = check
       }
    
    
    
    
    
    

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
