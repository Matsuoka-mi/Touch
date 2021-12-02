//
//  zyunbanViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit



class zyunbanViewController: UIViewController {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    //forkey
    var LED1: Int = 0
    var LED2: Int = 0
    var LED3: Int = 0
    
    
    let picture0ON = UIImage(named: "kidoON")
    let picture1OFF = UIImage(named: "kidoOFF")
    
    var kidotag:Int = 0
    
    @IBOutlet weak var zyunimageViwe1: UIImageView!
    @IBOutlet weak var zyunimageViwe2: UIImageView!
    @IBOutlet weak var zyunimageViwe3: UIImageView!
    
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    private var zyunimageViwe: [UIImage] = []
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    
    @IBOutlet weak var checkView: CheckBox!
    
    @IBOutlet weak var kidoView1: UIButton!
    @IBOutlet weak var kidoView2: UIButton!
    @IBOutlet weak var kidoView3: UIButton!
    
    
    @IBAction func zyunmodoru(_ sender: UIButton) {
       
//        userDefaults.set(LED1 , forKey: "LED1")
//        userDefaults.set(LED2 , forKey: "LED2")
//        userDefaults.set(LED3 , forKey: "LED3")
        
        print("戻るを押したLED1は \(userDefaults.integer(forKey: "LED1"))")
        print("戻るを押したLED2は \(userDefaults.integer(forKey: "LED2"))")
        print("戻るを押したLED3は \(userDefaults.integer(forKey: "LED3"))")
        
        
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
        
        
        // ③画面遷移
        let vc = nextView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
        
//        nextView.LED1 = UserDefaults.standard.integer(forKey: "LED1")
//        nextView.LED2 = UserDefaults.standard.integer(forKey: "LED2")
//        nextView.LED3 = UserDefaults.standard.integer(forKey: "LED3")
        
        //self.present(nextView, animated: true, completion: nil)
        
    }
    
    
    ///////////////////ここから////////////////
    @IBAction func checkView(_ sender: CheckBox) {
        print(sender.isChecked)
      //        if sender.tag == 0{
      //
      //        }
        
    }
    
    
    @IBAction func kidoView(_ sender: UIButton) {

        switch sender.tag {
        
        //1番の画像のLEDボタンが押された時 Tag1
        case 1:
            //LED1 == 0 は点灯しているので、消灯させる（輝度調整ありにする）
            if self.LED1 == 0{
                self.LED1 = 1
                self.kidoView1.setImage(picture1OFF, for: .normal)
                userDefaults.set(self.LED1 , forKey: "LED1")
            }
            else{
               //else は消灯している状態なので、０で点灯させ、　輝度調整しない状態へ変更
                self.LED1 = 0
                self.kidoView1.setImage(picture0ON, for: .normal)
               //点灯にする
                userDefaults.set(self.LED1 , forKey: "LED1")
            }
            
            print("tag1を押したLED1は\(self.LED1)")
       
        case 2:
 //            //LED2 == 0 は点灯しているので、消灯させる（輝度調整ありにする）
            if self.LED2 == 0{
                self.LED2 = 1
                self.kidoView2.setImage(picture1OFF, for: .normal)
                userDefaults.set(self.LED2 , forKey: "LED2")
            }
            else{
               //else は消灯している状態なので、０で点灯させ、　輝度調整しない状態へ変更
                self.LED2 = 0
                self.kidoView2.setImage(picture0ON, for: .normal)
                userDefaults.set(self.LED2 , forKey: "LED2")
               //点灯にする
            }
            
            print("tag1を押したLED2は\(self.LED2)")
            
        default :
            //LED3 == 0 は点灯しているので、消灯させる（輝度調整ありにする）
            if self.LED3 == 0{
                self.LED3 = 1
                self.kidoView3.setImage(picture1OFF, for: .normal)
                userDefaults.set(self.LED3 , forKey: "LED3")
            }
            else{
               //else は消灯している状態なので、０で点灯させ、　輝度調整しない状態へ変更
                self.LED3 = 0
                self.kidoView3.setImage(picture0ON, for: .normal)
                userDefaults.set(self.LED3 , forKey: "LED3")
               //点灯にする
            }
            print("tag1を押したLED3は\(self.LED3)")
                
        }
        
    }
    
            
        
        
    
    
    var gazouzyun1:Int = 0
    var gazouzyun2:Int = 0
    var gazouzyun3:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userDefaults.integer(forKey: "LED1") == 0
        {
            self.kidoView1.setImage(picture0ON, for: .normal)
        }
        else{
            self.kidoView1.setImage(picture1OFF, for: .normal)
        }
        
        if userDefaults.integer(forKey: "LED2") == 0
        {
            self.kidoView2.setImage(picture0ON, for: .normal)
        }
        else{
            self.kidoView2.setImage(picture1OFF, for: .normal)
        }
        
        if userDefaults.integer(forKey: "LED3") == 0
        {
            self.kidoView3.setImage(picture0ON, for: .normal)
        }
        else{
            self.kidoView3.setImage(picture1OFF, for: .normal)
        }
      
        let manager = Manager.shared
        print(manager.memory1)
        print(manager.memory2)
        print(manager.memory3)
        
        /////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        // imagesの初期設定(特定のファイルもしくはnilで埋める)
        self.zyunimageViwe = [ UIImage(named: "black")!,
                               UIImage(named: "black")!,
                               UIImage(named: "black")!,
        ]
        loadImage()  // imagesの画像を表示
        
        /////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        //画像１の枠線の変更
        //青にする(色)
        self.zyunimageViwe1.layer.borderColor = UIColor.blue.cgColor
        //線の太さ(太さ)
        self.zyunimageViwe1.layer.borderWidth = 2
        
        //画像２の枠線の変更
        //青にする(色)
        self.zyunimageViwe2.layer.borderColor = UIColor.blue.cgColor
        //線の太さ(太さ)
        self.zyunimageViwe2.layer.borderWidth = 2
        
        //画像３の枠線の変更
        //青にする(色)
        self.zyunimageViwe3.layer.borderColor = UIColor.blue.cgColor
        //線の太さ(太さ)
        self.zyunimageViwe3.layer.borderWidth = 2
        
        
        
    }
    
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    private func loadImage() {
        zyunimageViwe1.image = self.zyunimageViwe[0]
        zyunimageViwe2.image = self.zyunimageViwe[1]
        zyunimageViwe3.image = self.zyunimageViwe[2]
    }
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
    
    //forkey
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    
        print("zyunbiを読み込んだ(viewWillAppear)LED1は\(LED1)")
//        self.kidotyousei1 = userDefaults.integer(forKey: "kidokioku1")
        
        //アプリを再起動してもkidoのアイコンをリセットしない
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
     
        
        print("forkey (viewWillAppear)LED1は \(userDefaults.integer(forKey: "LED1"))")
        print("forkey (viewWillAppear)LED2は \(userDefaults.integer(forKey: "LED2"))")
        print("forkey (viewWillAppear)LED3は \(userDefaults.integer(forKey: "LED3"))")
      
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
        //アプリを再起動してもiro1の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber1 = userDefaults.integer(forKey: "iro1")
        self.gazouzyun1 = iroNumber1
        print("zyunbanのiroNumberは\(iroNumber1)")
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //アプリを再起動してもiro2の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber2 = userDefaults.integer(forKey: "iro2")
        self.gazouzyun2 = iroNumber2
        print("zyunbanのiroNumber2は\(iroNumber2)")
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //アプリを再起動してもiro3の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber3 = userDefaults.integer(forKey: "iro3")
        self.gazouzyun3 = iroNumber3
        print("zyunbanのiroNumber3は\(iroNumber3)")
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
       
        
        //zyunimageViewに何を表示させるか、iroNumberによって変わる
        
        switch iroNumber1{
        case 1 :
            zyunimageViwe1.image = UIImage(named: "black")
        case 2 :
            zyunimageViwe1.image = UIImage(named: "white")
        case 3:
            zyunimageViwe1.image = UIImage(named: "red")
        default:
            zyunimageViwe1.image = UIImage(named: "gazounashi")
        }
        
        switch iroNumber2{
        case 1 :
            zyunimageViwe2.image = UIImage(named: "black")
        case 2 :
            zyunimageViwe2.image = UIImage(named: "white")
        case 3:
            zyunimageViwe2.image = UIImage(named: "red")
        default:
            zyunimageViwe2.image = UIImage(named: "gazounashi")
        }
        
        switch iroNumber3{
        case 1 :
            zyunimageViwe3.image = UIImage(named: "black")
        case 2 :
            zyunimageViwe3.image = UIImage(named: "white")
        case 3:
            zyunimageViwe3.image = UIImage(named: "red")
        default:
            zyunimageViwe3.image = UIImage(named: "gazounashi")
        }
        
        // Do any additional setup after loading the view.
        
        
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
