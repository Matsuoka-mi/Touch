//
//  ViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBAction func hazimeru(_ sender: UIButton) {
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
    }
    @IBAction func zyunban(_ sender: UIButton) {
        
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "zyunbanViewController") as! zyunbanViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
    }
    
    @IBAction func tukuru(_ sender: UIButton) {
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "tukuruViewController") as! tukuruViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }

    
    
}

