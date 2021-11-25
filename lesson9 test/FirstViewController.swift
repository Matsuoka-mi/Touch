//
//  FirstViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class FirstViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
        
        // ダブルタップ
            //let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDouble(_:))) //Swift2.2以前
            let doubleTap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapDouble(sender:)))  //Swift3
            doubleTap.numberOfTapsRequired = 2
            view.addGestureRecognizer(doubleTap)
            
            // シングルタップ
            //let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapSingle(_:))) //Swift2.2以前
            let singleTap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapSingle(sender:)))  //Swift3
            singleTap.numberOfTapsRequired = 1
            //singleTap.numberOfTouchesRequired = 2  //こう書くと2本指じゃないとタップに反応しない
         
            //これを書かないとダブルタップ時にもシングルタップのアクションも実行される
            //singleTap.requireGestureRecognizerToFail(doubleTap)  //Swift2.2
            singleTap.require(toFail: doubleTap)  //Swift3
         
            view.addGestureRecognizer(singleTap)
        
    }
    
    /// シングルタップ時に実行される
    @objc func tapSingle(sender: UITapGestureRecognizer) {
        print("single")
        
      
        //画面遷移
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "redViewController") as! redViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
        

        
        
    }
     
    /// ダブルタップ時に実行される
    @objc func tapDouble(sender: UITapGestureRecognizer) {
        print("double")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
