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
    @IBOutlet weak var tukuimageView2: UIImageView!
    @IBOutlet weak var tukuimageView3: UIImageView!
    
    @IBOutlet weak var plusminus: UIButton!
    @IBOutlet weak var plusminus2: UIButton!
    @IBOutlet weak var plusminus3: UIButton!
    
    @IBOutlet weak var kido: UIButton!
    @IBOutlet weak var kido2: UIButton!
    @IBOutlet weak var kido3: UIButton!
    
    var gazou:Int = 0
    var gazou2:Int = 0
    var gazou3:Int = 0
    
    var tukuruviewplusminus1:Int = 0
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        label.text = "gazouは\(gazou)"
        print("gazouは\(self.gazou)")
    
        
    }
    
    //forkey
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.gazou = iroNumber
        //iroNumberをキーiro1に
        userDefaults.set(iroNumber , forKey: "iro1")
        if iroNumber == 0{
            //もし、iroNumberが0(「画像はありません」)ならボタンをプラスにする
            self.plusminus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        }
        else{
            //「画像がありません」以外ならボタンをマイナスにする
            self.plusminus.setImage(UIImage(systemName: "minus.circle.fill"), for: .selected)
        }
              print("プラスを押す前のtukuruのiroNumberは\(iroNumber)")
        
        //アプリを再起動してもiro1の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber = userDefaults.integer(forKey: "iro1")
        
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //アプリを再起動してもiro2の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber2 = userDefaults.integer(forKey: "iro2")
        self.gazou2 = iroNumber2
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //アプリを再起動してもiro3の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber3 = userDefaults.integer(forKey: "iro3")
        self.gazou3 = iroNumber3
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        switch iroNumber {
        case 1:
            tukuimageView1.image = UIImage(named: "black")
        case 2:
            tukuimageView1.image = UIImage(named: "white")
        case 3:
            tukuimageView1.image = UIImage(named: "red")
            
        default:
            tukuimageView1.image = UIImage(named: "gazounashi")
        }
        
        
        switch iroNumber2 {
        case 1:
            tukuimageView2.image = UIImage(named: "black")
        case 2:
            tukuimageView2.image = UIImage(named: "white")
            
        default:
            tukuimageView2.image = UIImage(named: "red")
        }
        
        switch iroNumber3 {
        case 1:
            tukuimageView3.image = UIImage(named: "black")
        case 2:
            tukuimageView3.image = UIImage(named: "white")
            
        default:
            tukuimageView3.image = UIImage(named: "red")
        }
        
    }
    
    
    
    
    @IBAction func plusminusTap(_ sender: UIButton) {
        
        //タッチするとプラスボタンがマイナスに、点灯した電球が消えた電球になる。
        if iroNumber == 0 {
            
            self.plusminus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
            
            userDefaults.set(iroNumber , forKey: "iro1")
            
            print("プラスを押した後のtukuruのiroNumberは\(iroNumber)")
            
            //       self.kido.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
            //        self.kido.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
            
            //画面遷移
            // ①storyboardのインスタンス取得
            let storyboard: UIStoryboard = self.storyboard!
            
            // ②遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
            
            // ③画面遷移
            let vc = nextView
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
            sender.isSelected = !sender.isSelected;
            
        }
        //    self.present(nextView, animated: true, completion: nil)
        else{
            
            tukuimageView1.image = UIImage(named: "gazounashi")
            userDefaults.set(iroNumber , forKey: "iro1")
            self.plusminus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        }
        
    }
    
    
    
    
    @IBAction func modoru(_ sender: UIButton) {
        //画面遷移////////////////////////////
        //色の値を渡す
        let View = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        //    View.ViewControllergazo = self.gazou
        
        View.ViewControllergazo = UserDefaults.standard.integer(forKey: "iro1")
        
        
        
        let vc = View
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
        //       self.present(View, animated: true, completion: nil)    //遷移の実行
        
        //画面遷移////////////////////////////
        
        
    }
    
    
    
    
    
    
    
    
    
}
