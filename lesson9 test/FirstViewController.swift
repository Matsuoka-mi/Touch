//
//  FirstViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class FirstViewController: UIViewController, UIGestureRecognizerDelegate {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    var checkButtonArray = [Int] ()
    
    var Firstgazo1: Int = 0
    var Firstgazo2: Int = 0
    var Firstgazo3: Int = 0
    var Firstgazo4: Int = 0
    var Firstgazo5: Int = 0
    var Firstgazo6: Int = 0
    var Firstgazo7: Int = 0
    var Firstgazo8: Int = 0
    var Firstgazo9: Int = 0
    
    
    var countLoad = 0
    var count = 0
    
    ////////////////////////////////////
    ///誤作動防止のため、２点タップしたら戻るようにする　
    ///classにUIGestureRecognizerDelegateを記入してから。
    var modoruButton1: Bool = false
    var modoruButton2: Bool = false
    let modorutap = UserDefaults.standard.bool(forKey: "modoruTapkey")
    
    
    
    @IBOutlet weak var FirstLabel: UILabel!
    
    /*  */
    var isAllEven = true
    /*  */
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FirstLabel.textAlignment = NSTextAlignment.center
        FirstLabel.text = "タップしてね"
        
        
        let uiswitchONOFF = UserDefaults.standard.bool(forKey: "uiswitchkey")
        print("uiswitchONOFF\(uiswitchONOFF)")
        
        
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
    
    
    //もどる方法がピンチかタップか決める
    
    @IBAction func modoruButton1(_ sender: Any) {
    
        print(modorutap)
        if modorutap == true {
            modoruButton1 = true
            print("1が押された後のmodoruButton1\(modoruButton1)")
            print("1が押された後のmodoruButton2\(modoruButton2)")
        }
        
    }
    
    
    
    @IBAction func modoruButton2(_ sender: Any) {
    
        
        if modoruButton1 == true{
            modoruButton2 = true
            print("2が押された後のmodoruButton1\(modoruButton1)")
            print("２が押された後のmodoruButton2\(modoruButton2)")
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
    
    /////////////////////////////////////
    ///↑ここまでをコピーして他の画面にも貼り付ける
    /////////////////////////////////////
    
    
    
    
    
    @IBAction func TapFirst(_ sender: Any) {
        
        //誤作動防止　
        modoruButton1 = false
        modoruButton2 = false
        
        
        print("Firstgazo 2\(Firstgazo2)")
        print("Firstgazo 3\(Firstgazo3)")
        print("Firstgazo 4\(Firstgazo4)")
        print("Firstgazo 5\(Firstgazo5)")
        print("Firstgazo 6\(Firstgazo6)")
        print("Firstgazo 7\(Firstgazo7)")
        print("Firstgazo 8\(Firstgazo8)")
        print("Firstgazo 9\(Firstgazo9)")
        
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
                    view1.view4gazo = self.Firstgazo4
                    view1.view5gazo = self.Firstgazo5
                    view1.view6gazo = self.Firstgazo6
                    view1.view7gazo = self.Firstgazo7
                    view1.view8gazo = self.Firstgazo8
                    view1.view9gazo = self.Firstgazo9
                    
                    
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
                    view2.view4gazo = self.Firstgazo4
                    view2.view5gazo = self.Firstgazo5
                    view2.view6gazo = self.Firstgazo6
                    view2.view7gazo = self.Firstgazo7
                    view2.view8gazo = self.Firstgazo8
                    view2.view9gazo = self.Firstgazo9
                    
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
                    view3.view4gazo = self.Firstgazo4
                    view3.view5gazo = self.Firstgazo5
                    view3.view6gazo = self.Firstgazo6
                    view3.view7gazo = self.Firstgazo7
                    view3.view8gazo = self.Firstgazo8
                    view3.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view3
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                    
                    //画面遷移////////////////////////////
                    break
                }
                
                //それがもし4ならView4へ
                else if checkNumber == 4{
                    
                    //画面遷移////////////////////////////
                    let view4 = self.storyboard?.instantiateViewController(withIdentifier: "View4") as! View4
                    
                    
                    view4.view4gazo = self.Firstgazo4
                    view4.view5gazo = self.Firstgazo5
                    view4.view6gazo = self.Firstgazo6
                    view4.view7gazo = self.Firstgazo7
                    view4.view8gazo = self.Firstgazo8
                    view4.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view4
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                    
                    //画面遷移////////////////////////////
                    break
                }
                
                //それがもし5ならView5へ
                else if checkNumber == 5{
                    
                    //画面遷移////////////////////////////
                    let view5 = self.storyboard?.instantiateViewController(withIdentifier: "View5") as! View5
                    
                    
                    view5.view5gazo = self.Firstgazo5
                    view5.view6gazo = self.Firstgazo6
                    view5.view7gazo = self.Firstgazo7
                    view5.view8gazo = self.Firstgazo8
                    view5.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view5
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                    
                    //画面遷移////////////////////////////
                    break
                }
                
                //それがもし6ならView6へ
                else if checkNumber == 6{
                    
                    //画面遷移////////////////////////////
                    let view6 = self.storyboard?.instantiateViewController(withIdentifier: "View6") as! View6
                    
                    
                    view6.view6gazo = self.Firstgazo6
                    view6.view7gazo = self.Firstgazo7
                    view6.view8gazo = self.Firstgazo8
                    view6.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view6
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                    
                    //画面遷移////////////////////////////
                    break
                }
                
                //それがもし7ならView7へ
                else if checkNumber == 7{
                    
                    //画面遷移////////////////////////////
                    let view7 = self.storyboard?.instantiateViewController(withIdentifier: "View7") as! View7
                    
                    
                    view7.view7gazo = self.Firstgazo7
                    view7.view8gazo = self.Firstgazo8
                    view7.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view7
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                    
                    //画面遷移////////////////////////////
                    break
                }
                
                //それがもし8ならView8へ
                else if checkNumber == 8{
                    
                    //画面遷移////////////////////////////
                    let view8 = self.storyboard?.instantiateViewController(withIdentifier: "View8") as! View8
                    
                    
                    view8.view8gazo = self.Firstgazo8
                    view8.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view8
                    vc.modalPresentationStyle = .fullScreen
                    self.present(vc, animated: true, completion: nil)
                    
                    //           self.present(redView, animated: true, completion: nil)    //遷移の実行
                    
                    //画面遷移////////////////////////////
                    break
                }
                
                
                //それがもし9ならView9へ
                else if checkNumber == 9{
                    
                    //画面遷移////////////////////////////
                    let view9 = self.storyboard?.instantiateViewController(withIdentifier: "View9") as! View9
                    
                    
                    view9.view9gazo = self.Firstgazo9
                    
                    //                view3.checkButtonArray = self.checkButtonArray
                    
                    let vc = view9
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
        if modorutap == false {
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
