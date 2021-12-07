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
    

    var LED1: Int = 0
    var LED2: Int = 0
    var LED3: Int = 0
    
    
    let picture0ON = UIImage(named: "kidoON")
    let picture1OFF = UIImage(named: "kidoOFF")
    
    let picturecheckON = UIImage(named: "checkON")
    let picturecheckOFF = UIImage(named: "checkOFF")
    let picturecheckmukou = UIImage(named: "checkmukou")
    
    var kidotag:Int = 0
    
    var checkButtonArray = [Int]()

    var tagNumber1:Int = 0
    var tagNumber2:Int = 0
    var tagNumber3:Int = 0
    
    var gazouzyun1:Int = 0
    var gazouzyun2:Int = 0
    var gazouzyun3:Int = 0
    
    var total:Int = 0
    
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
    
    
    @IBOutlet weak var checkView1: UIButton!
    @IBOutlet weak var checkView2: UIButton!
    @IBOutlet weak var checkView3: UIButton!
    
    
    @IBAction func zyunmodoru(_ sender: UIButton) {
    
        print("zyunbanのもどるボタン処理の最初のtagNumber1\(tagNumber1)")
        /*  　　　　配列         */
        //checkButtonArrayにtrue だった　tagNumber を入れる
        
        checkButtonArray = [Int]()
        
        if userDefaults.integer(forKey: "tagNumber1") == 1{
            checkButtonArray += [userDefaults.integer(forKey: "tagNumber1")]
        }
        
        else {
            checkButtonArray += [0]
        }
      
        
       if userDefaults.integer(forKey: "tagNumber2") == 2{
            checkButtonArray += [userDefaults.integer(forKey: "tagNumber2")]
        }
        
        else {
            checkButtonArray += [0]
        }
        
        if userDefaults.integer(forKey: "tagNumber3") == 3{
            checkButtonArray += [userDefaults.integer(forKey: "tagNumber3")]
        }

        else {
            checkButtonArray += [0]
        }
        
        //戻るを押した時に配列を記憶させる
        userDefaults.set(checkButtonArray , forKey: "checkButtonArray")
        
        //昇順にソート
        checkButtonArray.sort { $0 < $1 }
        print("戻るを押した時のチェックボックス配列\(checkButtonArray)")
        
        
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
     
        // ③画面遷移
        let vc = nextView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
    
        
    }
    
    
    ///////////////////ここから////////////////
    @IBAction func checkView(_ sender: CheckBox) {
        print(sender.isChecked)
        
        print("zyunbanのcheckViewボタン処理の最初のtagNumber1\(tagNumber1)")
        
        //checkが入ればtrue 、その時 tagNumberに　tag と同じ数字を入れる
        switch sender.tag {
        case 1:
            if sender.isChecked == true{
                tagNumber1 = 1
                userDefaults.set(sender.isChecked , forKey: "tagBool1")
                userDefaults.set(tagNumber1 , forKey: "tagNumber1")
            }
            else
            {
                tagNumber1 = 0
                userDefaults.set(sender.isChecked , forKey: "tagBool1")
                userDefaults.set(tagNumber1 , forKey: "tagNumber1")
            }
            print("tagNumber1は\(tagNumber1)")
            print("tagNumber1のtagBool1は\(userDefaults.bool(forKey: "tagBool1"))")
            
            
        case 2:
            if sender.isChecked == true{
                tagNumber2 = 2
                userDefaults.set(sender.isChecked , forKey: "tagBool2")
                userDefaults.set(tagNumber2 , forKey: "tagNumber2")
            }
            else
            {
                tagNumber2 = 0
                userDefaults.set(sender.isChecked , forKey: "tagBool2")
                userDefaults.set(tagNumber2 , forKey: "tagNumber2")
            }
            print("tagNumber2は\(tagNumber2)")
            print("tagNumber1のtagBool2は\(userDefaults.bool(forKey: "tagBool2"))")
            
        default :
            if sender.isChecked == true{
                tagNumber3 = 3
                userDefaults.set(sender.isChecked , forKey: "tagBool3")
                userDefaults.set(tagNumber3 , forKey: "tagNumber3")
                
            }
            else
            {
                tagNumber3 = 0
                userDefaults.set(sender.isChecked , forKey: "tagBool3")
                userDefaults.set(tagNumber3 , forKey: "tagNumber3")
            }
            
            print("tagNumber3のtagBool3は\(userDefaults.bool(forKey: "tagBool3"))")
            
        }
        
        
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
            
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        userDefaults.set(checkButtonArray , forKey: "checkButtonArray")
        
        //  ボタンの画像サイズ変更
        checkView1.imageView?.contentMode = .scaleAspectFill
        checkView1.contentHorizontalAlignment = .fill
        checkView1.contentVerticalAlignment = .fill
        
        
        
        if userDefaults.integer(forKey: "LED1") == 0
        {
            self.kidoView1.setImage(picture0ON, for: .normal)
        }
        else
        {
            self.kidoView1.setImage(picture1OFF, for: .normal)
        }
        
        if userDefaults.integer(forKey: "LED2") == 0
        {
            self.kidoView2.setImage(picture0ON, for: .normal)
        }
        else
        {
            self.kidoView2.setImage(picture1OFF, for: .normal)
        }
        
        
        if userDefaults.integer(forKey: "LED3") == 0
        {
            self.kidoView3.setImage(picture0ON, for: .normal)
        }
        else
        {
            self.kidoView3.setImage(picture1OFF, for: .normal)
        }
        
        
        
        print("順番を読み込んだ時のtagBool1は\(userDefaults.bool(forKey: "tagBool1"))")
        
        //最初の読み込みの時に　チェックボックスを前にチェックした状態にする
        if userDefaults.bool(forKey: "tagBool1")
        {
            self.checkView1.setImage(picturecheckON, for: .normal)
            self.tagNumber1 = 1
        }
        else
        {
            self.checkView1.setImage(picturecheckOFF, for: .normal)
            self.tagNumber1 = 0
        }
        
        if userDefaults.bool(forKey: "tagBool2")
        {
            self.checkView2.setImage(picturecheckON, for: .normal)
            self.tagNumber2 = 1
        }
        else
        {
            self.checkView2.setImage(picturecheckOFF, for: .normal)
            self.tagNumber2 = 0
        }
        
        
        if userDefaults.bool(forKey: "tagBool3")
        {
            self.checkView3.setImage(picturecheckON, for: .normal)
            self.tagNumber3 = 1
        }
        else
        {
            self.checkView3.setImage(picturecheckOFF, for: .normal)
            self.tagNumber3 = 0
        }
        
            print("if直後のtagNumber3は\(userDefaults.integer(forKey: "tagNumber3"))")
            
         
        
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
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        checkView1.imageView?.contentMode = .scaleAspectFit
        checkView1.contentHorizontalAlignment = .fill
        checkView1.contentVerticalAlignment = .fill
        
        //画面を読み込んだ時に前に保存した配列を読み込む
        checkButtonArray = UserDefaults.standard.object(forKey: "checkButtonArray") as! [Int]
       
        print("zyu読み込んだときのtagNumber1は\(tagNumber1)")
        print("zyu読み込んだときのtagNumber２は\(tagNumber2)")
        print("zyu読み込んだときのtagNumber３は\(tagNumber3)")
        
         
        
        //アプリを再起動してもiro1の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber1 = userDefaults.integer(forKey: "iro1")
        self.gazouzyun1 = iroNumber1
        print("zyunbanのiroNumberは\(tagNumber1)")
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //アプリを再起動してもiro2の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber2 = userDefaults.integer(forKey: "iro2")
        self.gazouzyun2 = iroNumber2
        print("zyunbanのiroNumber2は\(tagNumber2)")
        //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        //アプリを再起動してもiro3の色を表示する
        ////////////////////////////////////////////////////////////////////////////////////////////////////////
        iroNumber3 = userDefaults.integer(forKey: "iro3")
        self.gazouzyun3 = iroNumber3
        print("zyunbanのiroNumber3は\(tagNumber3)")
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
          
            self.checkView1.setImage(picturecheckmukou, for: .normal)
            checkView1.isEnabled = false
           
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            tagNumber1 = 0
            userDefaults.set(tagNumber1 , forKey: "tagNumber1")
            print("zyunbanの最初の画像がなしの時のtagNumber\(tagNumber1)")
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
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
            
            self.checkView2.setImage(picturecheckmukou, for: .normal)
            checkView2.isEnabled = false
            
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            tagNumber2 = 0
            userDefaults.set(tagNumber2 , forKey: "tagNumber2")
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
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
            
            self.checkView3.setImage(picturecheckmukou, for: .normal)
            checkView3.isEnabled = false
            
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            tagNumber3 = 0
            userDefaults.set(tagNumber3 , forKey: "tagNumber3")
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
        }
            
            
        
    }
    
    
}
