//
//  FirstViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class FirstViewController: UIViewController {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    var checkButtonArray = [Int] ()
    
    var Firstgazo1: Int = 0
    var Firstgazo2: Int = 0
    var Firstgazo3: Int = 0
    
    var countLoad = 0
    var count = 0
    
    @IBOutlet weak var FirstLabel: UILabel!
    
    /*  */
    var isAllEven = true
    /*  */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        FirstLabel.textAlignment = NSTextAlignment.center
        FirstLabel.text = "タップしてね"
       
        
        
        // ピンチを定義
        //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(redViewController.pinchView(sender:)))  //Swift3
        // viewにピンチを登録
        self.view.addGestureRecognizer(pinchGesture)
        
        
        /*
         // ダブルタップ
         //let doubleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapDouble(_:))) //Swift2.2以前
         let doubleTap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapDouble(sender:)))  //Swift3
         doubleTap.numberOfTapsRequired = 2
         view.addGestureRecognizer(doubleTap)
         
         // シングルタップ
         //let singleTap = UITapGestureRecognizer(target: self, action: #selector(ViewController.tapSingle(_:))) //Swift2.2以前
         let singleTap = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.tapSingle(sender:)))  //Swift3
         singleTap.numberOfTapsRequired = 1
         //singleTap.numberOfTouchesRequired = 2  //こう書くと2本指じゃないとタップに反応しない
         
         //これを書かないとダブルタップ時にもシングルタップのアクションも実行される
         //singleTap.requireGestureRecognizerToFail(doubleTap)  //Swift2.2
         singleTap.require(toFail: doubleTap)  //Swift3
         
         view.addGestureRecognizer(singleTap)
         */
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        
        
            //インストール直後に「はじめに」を押した時、配列内はnilなのでエラーが出るための処理。
            //一度、「じゅんび」画面に入って何も触らず再度「はじめに」を押した時も同様の処理をするためにviewWillDisappearに入れている
            let data = UserDefaults.standard.object(forKey: "checkButtonArray")
            if data != nil {
                checkButtonArray = data as! [Int]
            } else {
                checkButtonArray = [1]
            }
            
        
        
        
        print("読み込み時FirstのcheckButtonArrayは\(checkButtonArray)")
        
        
    }
    
    
    
    
    @IBAction func TapFirst(_ sender: Any) {
        
        let data = UserDefaults.standard.object(forKey: "checkButtonArray")
  //      if data != nil {
            checkButtonArray = data as! [Int]
 //       } else {
 //           checkButtonArray = [1]
 //       }
        print("タップ時　First　今から配列")
        /*          受け取った配列                */
        for checkNumber in checkButtonArray {
            print("タップ時　FirstのcheckButtonArray for文1\(checkNumber)")
           
            
            //出てきた値が０でないなら
            if checkNumber != 0{
                
            
            //それがもし１ならView１へ
                if checkNumber == 1{
                
                //画面遷移////////////////////////////
                let view1 = self.storyboard?.instantiateViewController(withIdentifier: "View1") as! View1
                view1.view1gazo = self.Firstgazo1
                view1.view2gazo = self.Firstgazo2
                view1.view3gazo = self.Firstgazo3
                //              view1.checkButtonArray = self.checkButtonArray
                
                let vc = view1
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                
                //画面遷移////////////////////////////
                
                //breakがないと、次の画面を呼び出した時に、同時にもう一枚先の画面も呼び出された。
                //輝度が違う場合は暗くしたいのに自動的に明るくなったりした。
                break
            }
            
            
                //それがもし２ならView２へ
            else if checkNumber == 2{
                
                //画面遷移////////////////////////////
                let view2 = self.storyboard?.instantiateViewController(withIdentifier: "View2") as! View2
                
                view2.view2gazo = self.Firstgazo2
                view2.view3gazo = self.Firstgazo3
                //               view2.checkButtonArray = self.checkButtonArray
                
                let vc = view2
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                
                //画面遷移////////////////////////////
                break
            }
            
                //それがもし３ならView３へ
            else if checkNumber == 3{
                
                //画面遷移////////////////////////////
                let view3 = self.storyboard?.instantiateViewController(withIdentifier: "View3") as! View3
                
                view3.view3gazo = self.Firstgazo3
                //                view3.checkButtonArray = self.checkButtonArray
                
                let vc = view3
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                
                //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                
                //画面遷移////////////////////////////
                break
            }
            //    それ以外なら「はじめる」画面へ
            
            else {
                // ①storyboardのインスタンス取得
       //                 let storyboard: UIStoryboard = self.storyboard!
                 
                        // ②遷移先ViewControllerのインスタンス取得
                let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                
                
                        // ③画面遷移
                
                // 遷移方法にフルスクリーンを指定
                let vc = ViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
        //                self.present(nextView, animated: true, completion: nil)
            }
            
            }
           
        }
            
    }
    
    /// ダブルタップ時に実行される
    @objc func tapDouble(sender: UITapGestureRecognizer) {
        print("double")
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
