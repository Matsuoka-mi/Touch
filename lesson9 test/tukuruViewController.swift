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
    
    
    @IBOutlet weak var plusminus1: UIButton!
    @IBOutlet weak var plusminus2: UIButton!
    @IBOutlet weak var plusminus3: UIButton!
    
    @IBOutlet weak var kido1: UIButton!
    @IBOutlet weak var kido2: UIButton!
    @IBOutlet weak var kido3: UIButton!
    
    var gazou1:Int = 0
    var gazou2:Int = 0
    var gazou3:Int = 0
    

    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        iroNumber1 = userDefaults.integer(forKey: "iro1")
        //      self.gazou1 = iroNumber1
        label.text = "gazouは\(gazou1)"
        print("gazou1は\(self.gazou1)")
        
        
    }
    
    //forkey
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //アプリを再起動してもiro1の色を表示する
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber1 = userDefaults.integer(forKey: "iro1")
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        if iroNumber1 == 0{
            //もし、iroNumberが0(「画像はありません」)ならボタンをプラスにする
            self.plusminus1.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        }
        else{
            //「画像がありません」以外ならボタンをマイナスにする
            self.plusminus1.setImage(UIImage(systemName: "minus.circle.fill"), for: .selected)
        }
        print("プラスを押す前のtukuruのiroNumberは\(iroNumber1)")
        
        
        
        //アプリを再起動してもiro2の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber2 = userDefaults.integer(forKey: "iro2")
        self.gazou2 = iroNumber2
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        if iroNumber2 == 0{
            //もし、iroNumber2が0(「画像はありません」)ならボタンをプラスにする
            self.plusminus2.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        }
        else{
            //「画像がありません」以外ならボタンをマイナスにする
            self.plusminus2.setImage(UIImage(systemName: "minus.circle.fill"), for: .selected)
        }
        print("プラスを押す前のtukuruのiroNumberは\(iroNumber2)")
        
        
        //アプリを再起動してもiro3の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber3 = userDefaults.integer(forKey: "iro3")
        self.gazou3 = iroNumber3
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        if iroNumber3 == 0{
            //もし、iroNumber2が0(「画像はありません」)ならボタンをプラスにする
            self.plusminus3.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        }
        else{
            //「画像がありません」以外ならボタンをマイナスにする
            self.plusminus3.setImage(UIImage(systemName: "minus.circle.fill"), for: .selected)
        }
        print("プラスを押す前のtukuruのiroNumberは\(iroNumber3)")
        
        
        switch iroNumber1 {
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
        case 3:
            tukuimageView2.image = UIImage(named: "red")
        default:
            tukuimageView2.image = UIImage(named: "gazounashi")
        }
        
        switch iroNumber3 {
        case 1:
            tukuimageView3.image = UIImage(named: "black")
        case 2:
            tukuimageView3.image = UIImage(named: "white")
        case 3:
            tukuimageView3.image = UIImage(named: "red")
        default:
            tukuimageView3.image = UIImage(named: "gazounashi")
        }
        
    }
    
    
    
    @IBAction func plusminusTap(_ sender: UIButton) {
        
        switch sender.tag {
        case 1:
        
        //タッチするとプラスボタンがマイナスに、点灯した電球が消えた電球になる。
        if iroNumber1 == 0 {
            
            //iroNumber が０（画像がない表示）なら、ボタンはプラスからマイナスに変更
            self.plusminus1.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal);
            userDefaults.set(iroNumber1 , forKey: "iro1")
            
            //       self.kido.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
            //        self.kido.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
            
            //画面遷移
            // ①storyboardのインスタンス取得
            let storyboard: UIStoryboard = self.storyboard!
            
            // ②遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
                   
            //tagの値をtukuru1ViewControllerに渡す
            print("タグ\(sender.tag)")
            nextView.plusminustag = sender.tag
           
           
            // ③画面遷移
            let vc = nextView
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
            
            sender.isSelected = !sender.isSelected;
            
        }
        //    self.present(nextView, animated: true, completion: nil)
        else{
            //画像があるなら、「画像がない」画像に変更し、ボタンはマイナスからプラスに変更
            iroNumber1 = 0
            tukuimageView1.image = UIImage(named: "gazounashi")
            self.plusminus1.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
            userDefaults.set(iroNumber1 , forKey: "iro1")
            
        }
        
        case 2:
            //タッチするとプラスボタンがマイナスに、点灯した電球が消えた電球になる。
            if iroNumber2 == 0 {
                
                //iroNumber が０（画像がない表示）なら、ボタンはプラスからマイナスに変更
                self.plusminus2.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal);
                userDefaults.set(iroNumber2 , forKey: "iro2")
                
                //       self.kido.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
                //        self.kido.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
                
                //画面遷移
                // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
                
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
                
                
                //tagの値をtukuru1ViewControllerに渡す
                print("タグ\(sender.tag)")
                nextView.plusminustag = sender.tag
                
                // ③画面遷移
                let vc = nextView
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                sender.isSelected = !sender.isSelected;
                
            }
            //    self.present(nextView, animated: true, completion: nil)
            else{
                //画像があるなら、「画像がない」画像に変更し、ボタンはマイナスからプラスに変更
                iroNumber2 = 0
                tukuimageView2.image = UIImage(named: "gazounashi")
                self.plusminus2.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
                userDefaults.set(iroNumber2 , forKey: "iro2")
                
            }
            
            
            
        default:
            //タッチするとプラスボタンがマイナスに、点灯した電球が消えた電球になる。
            if iroNumber3 == 0 {
                
                //iroNumber が０（画像がない表示）なら、ボタンはプラスからマイナスに変更
                self.plusminus3.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal);
                userDefaults.set(iroNumber3 , forKey: "iro3")
                
                //       self.kido1.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
                //        self.kido1.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
                
                //画面遷移
                // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
                
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
                
                
                //tagの値をtukuru1ViewControllerに渡す
                print("タグ\(sender.tag)")
                nextView.plusminustag = sender.tag
                
                
                // ③画面遷移
                let vc = nextView
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                sender.isSelected = !sender.isSelected;
                
            }
            //    self.present(nextView, animated: true, completion: nil)
            else{
                //画像があるなら、「画像がない」画像に変更し、ボタンはマイナスからプラスに変更
                iroNumber3 = 0
                tukuimageView3.image = UIImage(named: "gazounashi")
                self.plusminus3.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
                userDefaults.set(iroNumber3 , forKey: "iro3")
                
            }
        }
        
    }
    
    
    
    @IBAction func modoru(_ sender: UIButton) {
        //画面遷移////////////////////////////
        //色の値を渡す
        let View = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        //    View.ViewControllergazo = self.gazou
        
        View.ViewControllergazo1 = UserDefaults.standard.integer(forKey: "iro1")
        View.ViewControllergazo2 = UserDefaults.standard.integer(forKey: "iro2")
        View.ViewControllergazo3 = UserDefaults.standard.integer(forKey: "iro3")
        
        let vc = View
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
        //       self.present(View, animated: true, completion: nil)    //遷移の実行
        
        //画面遷移////////////////////////////
        
        
    }
    
}


