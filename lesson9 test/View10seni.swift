//
//  View10seni.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/19.
//

import UIKit

class View10seni: UIButton {

    //画面遷移////////////////////////////
    let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View10") as! View10
           
 
             
             let vc = nextView
             vc.modalPresentationStyle = .fullScreen
             self.present(vc, animated: true, completion: nil)
             
             //           self.present(redView, animated: true, completion: nil)    //遷移の実行
             
             //画面遷移////////////////////////////

}
