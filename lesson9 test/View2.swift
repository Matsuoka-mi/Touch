//
//  View2.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/01.
//

import UIKit

class View2: UIViewController {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard

    var checkButtonArray = [Int]()

    var view2gazo: Int = 0
    var view3gazo: Int = 0

    var kido2: Int = 0
    

    @IBOutlet weak var image2View: UIImageView!
    
    //imageViewの上にTapGestureRecognizerを追加。storyboardの一番右の黄色いまるからコントロールを押しながら移動したい画面へドラッグ。できた矢印をクリックした状態で右カラムのIdentifierに好きな名前をつける。
    //TapGestureRecognizerのアイコンとソースコードをコントロールを押しながら接続し「Action」で名前をつけて下記のように記入すると、画像をタップで画面遷移できる。
    
    
    @IBAction func Tap2(_ sender: Any) {
        
       
        //輝度//////////////////////////////////////////////輝度////////////////
        if kido2 == 1 {
        UIScreen.main.brightness = 1    //輝度１。明るい。
            kido2 = 0
        
        }
        
        else{
        
            let data = UserDefaults.standard.object(forKey: "checkButtonArray")
             checkButtonArray = data as! [Int]
            /*          受け取った配列                */
            for checkNumber in checkButtonArray {
                
            if checkNumber == 3{
            
            
                //画面遷移////////////////////////////
                let view3 = self.storyboard?.instantiateViewController(withIdentifier: "View3") as! View3
                       
                view3.view3gazo = self.view3gazo
                         
                         let vc = view3
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: true, completion: nil)
                         
                         //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                         
                         //画面遷移////////////////////////////
                    break
                }
            }
        }
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        if UserDefaults.standard.integer(forKey: "LED2") == 1
        {
          //輝度//////////////////////////////////////////////輝度////////////////
          UIScreen.main.brightness = 0.1 //0.1の輝度（暗い）
            kido2 = 1
            
        }
        else{
            UIScreen.main.brightness = 1
            kido2 = 0
        }
        
        switch self.view2gazo{
        case 1 :
            image2View.image = UIImage(named: "black")
     
            
        case 2 :
            image2View.image = UIImage(named: "white")
     
            
        case 3 :
            image2View.image = UIImage(named: "red")
            
        default:
            image2View.image = UIImage(named: "gazounashi")
        
       
        }
        
        
        
        
        
        // ピンチを定義
               //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
               let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(redViewController.pinchView(sender:)))  //Swift3
               // viewにピンチを登録
               self.view.addGestureRecognizer(pinchGesture)
               
           }
           
    
    
    override func viewWillDisappear(_ animated: Bool) {
        //インストール直後に「はじめに」を押した時、配列内はnilなのでエラーが出るための処理。
        //一度、「じゅんび」画面に入って何も触らず再度「はじめに」を押した時も同様の処理をするためにviewWillDisappearに入れている
        let data = UserDefaults.standard.object(forKey: "checkButtonArray")
        if data != nil {
            checkButtonArray = data as! [Int]
        } else {
            checkButtonArray = UserDefaults.standard.object(forKey: "checkButtonArray") as! [Int]
        }
        
    }
    
    
    
    
    
           /// ピンチイン・ピンチアウト時に実行される
    @objc func pinchView(sender: UIPinchGestureRecognizer) {
               print("pinch")
               // ピンチイン・ピンチアウトの拡大縮小率
               print("scale: \(sender.scale)")
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         
        // ③画面遷移
let vc = nextView
vc.modalPresentationStyle = .fullScreen
        self.present(nextView, animated: true, completion: nil)

       // 1秒あたりのピンチの速度(read-only)
       print("velocity: \(sender.velocity)")
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
