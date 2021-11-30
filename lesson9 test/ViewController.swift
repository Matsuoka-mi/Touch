//
//  ViewController.swift
//  lesson9 test/Users/bookmac/Desktop/Tech/iphone/lesson9/lesson9 test11_24/lesson9 test/ViewController.swift
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    var ViewControllergazo: Int = 0
    
    @IBAction func hazimeru(_ sender: UIButton) {
       
        //画面遷移////////////////////////////
        let FirstView = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        //    FirstView.Firstgazo = self.ViewControllergazo
        FirstView.Firstgazo = UserDefaults.standard.integer(forKey: "iro1")
        
        
        // 遷移方法にフルスクリーンを指定
        let vc = FirstView
        vc.modalPresentationStyle = .fullScreen
   //self.present(FirstView, animated: true, completion: nil)    //遷移の実行
        self.present(vc, animated: true, completion: nil)
        
            sender.isSelected = !sender.isSelected;
        //画面遷移////////////////////////////
        
    }
    @IBAction func zyunban(_ sender: UIButton) {
        
        //色の値を渡す
        let zyunView = self.storyboard?.instantiateViewController(withIdentifier: "zyunbanViewController") as! zyunbanViewController
            zyunView.gazouzyun = self.ViewControllergazo
        
        
        // 遷移方法にフルスクリーンを指定
        let vc = zyunView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
            sender.isSelected = !sender.isSelected;
        
     //   self.present(zyunView, animated: true, completion: nil)    //遷移の実行
        sender.isSelected = !sender.isSelected;
        
    }
    
    @IBAction func tukuru(_ sender: UIButton) {
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "tukuruViewController") as! tukuruViewController
         
                // ③画面遷移
        // 遷移方法にフルスクリーンを指定
        let vc = nextView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
            sender.isSelected = !sender.isSelected;
        
        
           //     self.present(nextView, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }

    
    
}

