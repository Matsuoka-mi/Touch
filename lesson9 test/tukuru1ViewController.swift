//
//  tukuru1ViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/25.
//

import UIKit

//forkey
var iroNumber: Int = 0

class tukuru1ViewController: UIViewController {
    
    var gazo: Int = 0
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    
    //  let defaults = NSUserDefaults.resetStandardUserDefaults()
    
    
    
    @IBOutlet weak var imageViewtukuru1: UIImageView!
    @IBAction func blackAction(_ sender: UIButton) {
        
        self.gazo = 1
        iroNumber = self.gazo                                       //iroNumberが１
        userDefaults.set(iroNumber , forKey: "iro1")                //iro1というキー
        
        imageViewtukuru1.image = UIImage(named: "black")            //画像を黒くする
        print(self.gazo)
    }
    
    @IBAction func whiteAction(_ sender: UIButton) {
        self.gazo = 2
        iroNumber = self.gazo                                       //iroNumberが2
        print("iroNumber\(iroNumber)")
        userDefaults.set(iroNumber , forKey: "iro1")
        
        imageViewtukuru1.image = UIImage(named: "white")
        print(self.gazo)
        
        
        
    }
    @IBAction func redAction(_ sender: UIButton) {
        self.gazo = 3
        iroNumber = self.gazo                                       //iroNumberが3
        userDefaults.set(iroNumber , forKey: "iro1")
        
        imageViewtukuru1.image = UIImage(named: "red")
        
        print(self.gazo)
    }
    
    @IBAction func modoru(_ sender: UIButton) {
        
        //画面遷移////////////////////////////
        
        let tukuruView = self.storyboard?.instantiateViewController(withIdentifier: "tukuruViewController") as! tukuruViewController
                
        //        色の値をtukuruViewControllerに渡す
        tukuruView.gazou = UserDefaults.standard.integer(forKey: "iro1")
        
        
        self.present(tukuruView, animated: true, completion: nil)    //遷移の実行
        sender.isSelected = !sender.isSelected;
        //画面遷移////////////////////////////
        
        print("tukuruの\(tukuruView.gazou)")
        print("tukuru1の\(self.gazo)")
        
        
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //色
        self.imageViewtukuru1.layer.borderColor = UIColor.blue.cgColor
        //線の太さ(太さ)
        self.imageViewtukuru1.layer.borderWidth = 3
    }
    
    
    //forkey
    //画面遷移して戻ってきても呼び出す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        print("iroNumber\(iroNumber)")
        iroNumber = userDefaults.integer(forKey: "iro1")    //iroNumber に　"iro1" を代入
        userDefaults.synchronize()  //synchronize(即座に反映させるためのメソッド）
        
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        //iroNumberの数字によって表示する色が違う
        switch iroNumber {
        case 1:
            imageViewtukuru1.image = UIImage(named: "black")
        case 2:
            imageViewtukuru1.image = UIImage(named: "white")
            
            
        default:
            imageViewtukuru1.image = UIImage(named: "red")
        }
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
