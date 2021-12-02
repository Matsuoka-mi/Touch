//
//  kido.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/28.
//

import UIKit

class kido: UIButton {

    // Images
    let kidoImage = UIImage(named: "kidoON")! as UIImage
    let unkidoImage = UIImage(named: "kidoOFF")! as UIImage

    // Bool property
    var kidoUMU: Bool = false {
        didSet{
            if kidoUMU == true {
                self.setImage(unkidoImage, for: UIControl.State.normal)
            } else {
                self.setImage(kidoImage, for: UIControl.State.normal)
            }
        }
    }

    override func awakeFromNib() {
        self.addTarget(self, action:#selector(buttonClicked(sender:)), for: UIControl.Event.touchUpInside)
        self.kidoUMU = false
    }

    @objc func buttonClicked(sender: UIButton) {
        if sender == self {
            kidoUMU = !kidoUMU
        }
    }
    
    
    
    
    
    
    
}







