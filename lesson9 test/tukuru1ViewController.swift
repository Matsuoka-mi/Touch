//
//  tukuru1ViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/25.
//

import UIKit

//forkey
var iroNumber1: Int = 0
var iroNumber2: Int = 0
var iroNumber3: Int = 0



class tukuru1ViewController: UIViewController {
    
    var gazo1: Int = 0
    
    var plusminustag:Int = 0
   
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    
    //  let defaults = NSUserDefaults.resetStandardUserDefaults()
    
    @IBOutlet weak var imageViewtukuru1: UIImageView!
    @IBAction func blackAction(_ sender: UIButton) {
        self.gazo1 = 1
        imageViewtukuru1.image = UIImage(named: "black")            //画像を黒くする
        
        //tukuruViewControllerのプラスマイナスボタンのタグの番号をplusminustagに入れている。
        switch plusminustag {
        //1番の画像のプラスマイナスボタンが押されて遷移してきた時
        case 1:
            iroNumber1 = self.gazo1
            userDefaults.set(iroNumber1 , forKey: "iro1")
            
        //２番の画像のプラスマイナスボタンが押されて遷移してきた時
        case 2:
            iroNumber2 = self.gazo1
            userDefaults.set(iroNumber2 , forKey: "iro2")
        
        ////それ以外の画像のプラスマイナスボタンが押されて遷移してきた時
        default:
            iroNumber3 = self.gazo1
            userDefaults.set(iroNumber3 , forKey: "iro3")
        }
        
        print("plusminusのたぐ\(plusminustag)")
        print("黒を押したときのtukuru1のiroNumber\(iroNumber1)")
    }
    
    @IBAction func whiteAction(_ sender: UIButton) {
        
        self.gazo1 = 2
        imageViewtukuru1.image = UIImage(named: "white")
        
        //tukuruViewControllerのプラスマイナスボタンのタグの番号をplusminustagに入れている。
        switch plusminustag {
        //1番の画像のプラスマイナスボタンが押されて遷移してきた時
        case 1:
            iroNumber1 = self.gazo1
            userDefaults.set(iroNumber1 , forKey: "iro1")
            
        //２番の画像のプラスマイナスボタンが押されて遷移してきた時
        case 2:
            iroNumber2 = self.gazo1
            userDefaults.set(iroNumber2 , forKey: "iro2")
        
        ////それ以外の画像のプラスマイナスボタンが押されて遷移してきた時
        default:
            iroNumber3 = self.gazo1
            userDefaults.set(iroNumber3 , forKey: "iro3")
        }
        
        print("iroNumber\(iroNumber1)")
        print("白を押したときのtukuru1のiroNumber\(iroNumber1)")
    }
    
    @IBAction func redAction(_ sender: UIButton) {
        
        self.gazo1 = 3
        imageViewtukuru1.image = UIImage(named: "red")
        
        //tukuruViewControllerのプラスマイナスボタンのタグの番号をplusminustagに入れている。
        switch plusminustag {
        //1番の画像のプラスマイナスボタンが押されて遷移してきた時
        case 1:
            iroNumber1 = self.gazo1
            userDefaults.set(iroNumber1 , forKey: "iro1")
            
        //２番の画像のプラスマイナスボタンが押されて遷移してきた時
        case 2:
            iroNumber2 = self.gazo1
            userDefaults.set(iroNumber2 , forKey: "iro2")
        
        ////それ以外の画像のプラスマイナスボタンが押されて遷移してきた時
        default:
            iroNumber3 = self.gazo1
            userDefaults.set(iroNumber3 , forKey: "iro3")
        }

        print("赤を押したときのtukuru1のiroNumber\(iroNumber1)")
    }
    
    @IBAction func modoru(_ sender: UIButton) {
        
       userDefaults.set(iroNumber1 , forKey: "iro1")
        //画面遷移////////////////////////////
        
        let tukuruView = self.storyboard?.instantiateViewController(withIdentifier: "tukuruViewController") as! tukuruViewController
                
        //色の値（iroNumber)をtukuruViewControllerに渡す
  //      tukuruView.gazou1 = iroNumber1
  //      tukuruView.gazou2 = iroNumber2
  //      tukuruView.gazou3 = iroNumber3
        
//        tukuruView.gazou = UserDefaults.standard.integer(forKey: "iro1")
        
        //フルスクリーン
        let vc = tukuruView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
            sender.isSelected = !sender.isSelected;
        
//        self.present(tukuruView, animated: true, completion: nil)    //遷移の実行
     
        //画面遷移////////////////////////////
        
       
        print("戻るを押したときのtukuru1のiroNumber\(iroNumber1)")
        
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //色
        self.imageViewtukuru1.layer.borderColor = UIColor.blue.cgColor
        //線の太さ(太さ)
        self.imageViewtukuru1.layer.borderWidth = 3
       
        
    }
    
    //画面遷移して戻ってきても呼び出す
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        print("plusminusのたぐ\(plusminustag)")
   
     //新規作成の画面は常に画像なし
        imageViewtukuru1.image = UIImage(named: "gazounashi")
        
        self.gazo1 = 0
        //iroNumberが0
//        userDefaults.set(iroNumber , forKey: "iro1")                //iro1というキー
        print("tukuru1のiroNumber\(iroNumber1)")
        
     
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

//singleton・・・一度入れた数値が、カラーが変わってもそのままなので変えたい。

class Manager {
    
    var memory1:Int = UserDefaults.standard.integer(forKey: "iro1")
    var memory2:Int = UserDefaults.standard.integer(forKey: "iro2")
    var memory3:Int = UserDefaults.standard.integer(forKey: "iro3")
    static let shared = Manager()
    private init() {
    }

   
    
    
}
