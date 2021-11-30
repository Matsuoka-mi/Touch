//
//  plusminus.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/29.
//

import UIKit

class plusminus: UIButton {

   
    // Images
    let plusImage = UIImage(systemName: "plus.circle.fill")! as UIImage
    let minusImage = UIImage(systemName:  "minus.circle.fill")! as UIImage

    // Bool property
    var plusorminus: Bool = false {
        didSet{
            if plusorminus == true {
                self.setImage(minusImage, for: UIControl.State.normal)
            } else {
                self.setImage(plusImage, for: UIControl.State.normal)
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.plusorminus = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            plusorminus = !plusorminus
        }
    }
    
    
    
    
    
    
    
}







