//
//  zyunbanViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class tukuruViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    
    
    @IBOutlet weak var tukuimageView1: UIImageView!
    
    
    
    @IBOutlet weak var plusminus: UIButton!
    
    @IBOutlet weak var kido: UIButton!
    
    var gazou:Int = 0
   
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label.text = "gazouは\(gazou)"
        print(self.gazou)
        
        
        
        
        
        self.plusminus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        self.plusminus.setImage(UIImage(systemName: "minus.circle.fill"), for: .selected)
        
        self.kido.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
        
        self.kido.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
        
    }
    
    //forkey
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        //アプリを再起動してもiro1の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber = userDefaults.integer(forKey: "iro1")
        self.gazou = iroNumber
        print("tukuruのiroNumberは\(iroNumber)")
        
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        
        switch iroNumber {
        case 1:
            tukuimageView1.image = UIImage(named: "black")
        case 2:
            tukuimageView1.image = UIImage(named: "white")
            
            
        default:
            tukuimageView1.image = UIImage(named: "red")
        }
    }
    
    
    
    
    
    @IBAction func plusminusTap(_ sender: UIButton) {
        //画面遷移
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
        
        // ③画面遷移
        self.present(nextView, animated: true, completion: nil)
        sender.isSelected = !sender.isSelected;
    }
    
    
    @IBAction func modoru(_ sender: UIButton) {
        //画面遷移////////////////////////////
        //色の値を渡す
        let View = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        //    View.ViewControllergazo = self.gazou
        
        View.ViewControllergazo = UserDefaults.standard.integer(forKey: "iro1")
        
        
        
        
        self.present(View, animated: true, completion: nil)    //遷移の実行
        sender.isSelected = !sender.isSelected;
        //画面遷移////////////////////////////
        
        
    }
    
    
    @IBAction func kidoTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
    }
    
    
    
    
    
    
    
    
}
