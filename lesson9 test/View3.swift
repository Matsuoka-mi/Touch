//
//  View3.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/01.
//

import UIKit

class View3: UIViewController, UIGestureRecognizerDelegate {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard

    var checkButtonArray = [Int]()
    
    var kido3: Int = 0
    var view3gazo: Int = 0
    var view4gazo: Int = 0
    var view5gazo: Int = 0
    var view6gazo: Int = 0
    var view7gazo: Int = 0
    var view8gazo: Int = 0
    var view9gazo: Int = 0
    
    ////////////////////////////////////
    ///誤作動防止のため、２点タップしたら戻るようにする　次は48 49行目
    ///classにUIGestureRecognizerDelegateを記入してから。
    let modorutap = UserDefaults.standard.bool(forKey: "modoruTapkey")
    var modoruButton1: Bool = false
    var modoruButton2: Bool = false
    
    
    @IBOutlet weak var image3View: UIImageView!
    
    
    @IBAction func modoruButton1(_ sender: Any) {
    
        if modorutap == true {
            modoruButton1 = true
            print("1が押された後のmodoruButton1\(modoruButton1)")
            print("1が押された後のmodoruButton2\(modoruButton2)")
        }
    }
    
    @IBAction func modoruButton2(_ sender: Any) {
    
        if modoruButton1 == true{
            modoruButton2 = true
            print(modoruButton1)
            print(modoruButton2)
            // ①storyboardのインスタンス取得
                    let storyboard: UIStoryboard = self.storyboard!
             
                    // ②遷移先ViewControllerのインスタンス取得
                    let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
             
                    // ③画面遷移
            let vc = nextView
            vc.modalPresentationStyle = .fullScreen
                    self.present(nextView, animated: true, completion: nil)
        }
    }
    
    
    @IBAction func Tap3(_ sender: Any) {

        modoruButton1 = false
        modoruButton2 = false
        //輝度//////////////////////////////////////////////輝度////////////////
        if kido3 == 1 {
        UIScreen.main.brightness = 1    //輝度１。明るい。
            kido3 = 0
        
        }
        
        else{
            
            let data = UserDefaults.standard.object(forKey: "checkButtonArray")
             checkButtonArray = data as! [Int]
            /*          受け取った配列                */
            for checkNumber in checkButtonArray {
                
            if checkNumber == 4{
            
            
                //画面遷移////////////////////////////
                let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View4") as! View4
                       
             
                nextView.view4gazo = self.view4gazo
                nextView.view5gazo = self.view5gazo
                nextView.view6gazo = self.view6gazo
                nextView.view7gazo = self.view7gazo
                nextView.view8gazo = self.view8gazo
                nextView.view9gazo = self.view9gazo
                         
                         let vc = nextView
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: true, completion: nil)
                         
                         //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                         
                         //画面遷移////////////////////////////
                    break
                }
                
                else if checkNumber == 5{
                      
                //画面遷移////////////////////////////
                let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View5") as! View5
                       
                    nextView.view5gazo = self.view5gazo
                    nextView.view6gazo = self.view6gazo
                    nextView.view7gazo = self.view7gazo
                    nextView.view8gazo = self.view8gazo
                    nextView.view9gazo = self.view9gazo
                         
                         let vc = nextView
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: true, completion: nil)
                         
                         //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                         
                         //画面遷移////////////////////////////
                    break
                     }
                
                else if checkNumber == 6{
                      
                //画面遷移////////////////////////////
                let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View6") as! View6
                       
                    nextView.view6gazo = self.view6gazo
                    nextView.view7gazo = self.view7gazo
                    nextView.view8gazo = self.view8gazo
                    nextView.view9gazo = self.view9gazo
                         
                         let vc = nextView
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: true, completion: nil)
                         
                         //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                         
                         //画面遷移////////////////////////////
                    break
                     }

                else if checkNumber == 7{
                      
                //画面遷移////////////////////////////
                let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View7") as! View7
                       
                   
                    nextView.view7gazo = self.view7gazo
                    nextView.view8gazo = self.view8gazo
                    nextView.view9gazo = self.view9gazo
                         
                         let vc = nextView
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: true, completion: nil)
                         
                         //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                         
                         //画面遷移////////////////////////////
                    break
                     }
                
                else if checkNumber == 8{
                      
                //画面遷移////////////////////////////
                let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View8") as! View8
                       
                    
                    nextView.view8gazo = self.view8gazo
                    nextView.view9gazo = self.view9gazo
                         
                         let vc = nextView
                         vc.modalPresentationStyle = .fullScreen
                         self.present(vc, animated: true, completion: nil)
                         
                         //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                         
                         //画面遷移////////////////////////////
                    break
                     }
                
                else if checkNumber == 9{
                      
                //画面遷移////////////////////////////
                let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View9") as! View9
                       
                   
                    nextView.view9gazo = self.view9gazo
                         
                         let vc = nextView
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
        
        print("view3gazo\(view3gazo)")
        print("view4gazo\(view4gazo)")
        print("view5gazo\(view5gazo)")
        print("view6gazo\(view6gazo)")
        print("view7gazo\(view7gazo)")
        print("view8gazo\(view8gazo)")
        print("view9gazo\(view9gazo)")
        
        
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
     
            
        case 3 :
            image3View.image = UIImage(named: "red")
            
        case 4:
            image3View.image = UIImage(named: "blue")
        case 5:
            image3View.image = UIImage(named: "green")
        case 6:
            image3View.image = UIImage(named: "yellow")
            
        case 7:
            image3View.image = UIImage(named: "pink")
        case 8:
            image3View.image = UIImage(named: "orange")
        case 9:
            image3View.image = UIImage(named: "purple")
            
            
            
        default:
            image3View.image = UIImage(named: "gazounashi")
       
        }
        
        
        
        
        
        
        
        
   //     image3View.image = UIImage(named: "green")
        
        // ピンチを定義
               //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
               let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(redViewController.pinchView(sender:)))  //Swift3
               // viewにピンチを登録
               self.view.addGestureRecognizer(pinchGesture)
        
        
        ////////////////////////////////////
        ///////////////////////////////////////
        ///////////////////////////////////////
        //ここから、誤作動防止のためのコード
        
        //長押しインスタンスを生成する
        let longPressGesture: UILongPressGestureRecognizer = UILongPressGestureRecognizer(
            target: self,
            action: #selector(self.longPressAction(_:))
        )
        //デリゲートをセット
        longPressGesture.delegate = self
        //viewにlongPressGestureを追加
        self.view.addGestureRecognizer(longPressGesture)
        //長押しここまで
        
        
        // ダブルタップジェスチャーの設定
        // タップジェスチャーを作成します。
        let doubleTapGesture = UITapGestureRecognizer(target: self, action: #selector(doubleTap(_:)))
        
        // ダブルタップで反応するように設定します。
        doubleTapGesture.numberOfTapsRequired = 2
        
        // ビューにジェスチャーを設定します。
        self.view.addGestureRecognizer(doubleTapGesture)
        
        ////////////////////////////////////
        //ここまで、誤作動防止のためのコード
               
           }
           
    
    
    ////////////////////////////////////
    //ここから、誤作動防止のためのコード
    
    //左上をタップした後に長押しをしたら、無効になり、右下をタップしても画面は戻らない
    
    @objc func longPressAction(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            //ここに、長押し終了時に実行したい処理を記載する
            print("長押し")
            modoruButton1 = false
            modoruButton2 = false
        }
    }
    
    //左上をタップした後にダブルタップをしたら、無効になり、右下をタップしても画面は戻らない
    @objc func doubleTap(_ gesture: UITapGestureRecognizer) {
        // ダブルタップされた時の処理を記述してください。
        print("ダブルタップ")
        modoruButton1 = false
        modoruButton2 = false
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
        
    }
    
    
    
    
    
           /// ピンチイン・ピンチアウト時に実行される
    @objc func pinchView(sender: UIPinchGestureRecognizer) {
       
        
        if modorutap == false {
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


