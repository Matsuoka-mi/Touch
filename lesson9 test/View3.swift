//
//  View3.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/01.
//

import UIKit

class View3: UIViewController {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard

    
    var kido3: Int = 0
    var view3gazo: Int = 0
    
    
    @IBOutlet weak var image3View: UIImageView!
    
    @IBAction func Tap3(_ sender: Any) {

  
        //輝度//////////////////////////////////////////////輝度////////////////
        if kido3 == 1 {
        UIScreen.main.brightness = 1    //輝度１。明るい。
            kido3 = 0
        
        }
        
        else{
        
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.integer(forKey: "LED3") == 1{
          //輝度//////////////////////////////////////////////輝度////////////////
          UIScreen.main.brightness = 0.1 //0.1の輝度（暗い）
            kido3 = 1
            
        }
        else{
            UIScreen.main.brightness = 1
            kido3 = 0
        }
        
        switch self.view3gazo{
        case 1 :
            image3View.image = UIImage(named: "black")
     
            
        case 2 :
            image3View.image = UIImage(named: "white")
     
            
            
        default:
            image3View.image = UIImage(named: "red")
        
       
        }
        
        
        
        
        
        
        
        
        let manager = Manager.shared
        print(manager.memory1)
        print(manager.memory2)
        print(manager.memory3)
    
        
   //     image3View.image = UIImage(named: "green")
        
        // ピンチを定義
               //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
               let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(redViewController.pinchView(sender:)))  //Swift3
               // viewにピンチを登録
               self.view.addGestureRecognizer(pinchGesture)
               
           }
           
           /// ピンチイン・ピンチアウト時に実行される
    @objc func pinchView(sender: UIPinchGestureRecognizer) {
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         
                // ③画面遷移
        // 遷移方法にフルスクリーンを指定
        let vc = nextView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
       
             
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


