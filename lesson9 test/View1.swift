//
//  View1.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/01.
//

import UIKit

class View1: UIViewController, UIGestureRecognizerDelegate {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
    
    var checkButtonArray = [Int]()
    
    var kido1: Int = 0
    
    var view1gazo: Int = 0
    var view2gazo: Int = 0
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
    var modoruButton1: Bool = false
    var modoruButton2: Bool = false
    let modorutap = UserDefaults.standard.bool(forKey: "modoruTapkey")
    
    //長押しもダブルタップもタップとして拾う
    var Taplongdouble: Int = 0
    
    @IBOutlet weak var view1image: UIImageView!
    //imageViewの上にTapGestureRecognizerを追加。storyboardの一番左の黄色いまるからコントロールを押しながら移動したい画面へドラッグ。できた矢印をクリックした状態で右カラムのIdentifierに好きな名前をつける。
    //TapGestureRecognizerのアイコンとソースコードをコントロールを押しながら接続し「Action」で名前をつけて下記のように記入すると、画像をタップで画面遷移できる。
    
    
    
    
    
    
    @IBAction func Tap1(_ sender: Any) {
           
            //誤作動防止　次は253行目
            modoruButton1 = false
            modoruButton2 = false
            
            //輝度//////////////////////////////////////////////輝度////////////////
            if kido1 == 1 {
                UIScreen.main.brightness = 1    //輝度１。明るい。
                kido1 = 0
                
            }
            else{
                
                let data = UserDefaults.standard.object(forKey: "checkButtonArray")
                checkButtonArray = data as! [Int]
                /*          受け取った配列                */
                for checkNumber in checkButtonArray {
                    print("タップ時のcheckButtonArray for文\(checkNumber)")
                    if checkNumber == 2{
                        
                        // ①storyboardのインスタンス取得
                        let storyboard: UIStoryboard = self.storyboard!
                        
                        // ②遷移先ViewControllerのインスタンス取得
                        let nextView = storyboard.instantiateViewController(withIdentifier: "View2") as! View2
                        
                        nextView.view2gazo = self.view2gazo
                        nextView.view3gazo = self.view3gazo
                        nextView.view4gazo = self.view4gazo
                        nextView.view5gazo = self.view5gazo
                        nextView.view6gazo = self.view6gazo
                        nextView.view7gazo = self.view7gazo
                        nextView.view8gazo = self.view8gazo
                        nextView.view9gazo = self.view9gazo
                        
                        
                        // ③画面遷移
                        
                        // 遷移方法にフルスクリーンを指定
                        let vc = nextView
                        vc.modalPresentationStyle = .fullScreen
                        self.present(vc, animated: true, completion: nil)
                        //self.present(nextView, animated: true, completion: nil)
                        
                        break
                    }
                    
                    else if checkNumber == 3{
                        
                        //画面遷移////////////////////////////
                        let nextView = self.storyboard?.instantiateViewController(withIdentifier: "View3") as! View3
                        
                        
                        nextView.view3gazo = self.view3gazo
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
                    
                    else if checkNumber == 4{
                        
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
        
        
        
        //誤作動防止　次は321行目
        let uiswitchONOFF = UserDefaults.standard.bool(forKey: "uiswitchkey")
        
        print(uiswitchONOFF)
        
        print("view1gazo\(view1gazo)")
        print("view2gazo\(view2gazo)")
        print("view3gazo\(view3gazo)")
        print("view4gazo\(view4gazo)")
        print("view5gazo\(view5gazo)")
        print("view6gazo\(view6gazo)")
        print("view7gazo\(view7gazo)")
        print("view8gazo\(view8gazo)")
        print("view9gazo\(view9gazo)")
        
        
        if UserDefaults.standard.integer(forKey: "LED1") == 1{
            //輝度//////////////////////////////////////////////輝度////////////////
            UIScreen.main.brightness = 0.1 //0.1の輝度（暗い）
            kido1 = 1
            
        }
        else{
            UIScreen.main.brightness = 1
            kido1 = 0
        }
        
        //    imageView.image = UIImage(named: "red")
        //gazo の変数の中にcase ごとに１や２などの時の処理とそれ以外の時の処理を書いている
        
        switch self.view1gazo{
        case 1 :
            view1image.image = UIImage(named: "black")
            
            
        case 2 :
            view1image.image = UIImage(named: "white")
            
        case 3 :
            view1image.image = UIImage(named: "red")
            
            
        case 4:
            view1image.image = UIImage(named: "blue")
        case 5:
            view1image.image = UIImage(named: "green")
        case 6:
            view1image.image = UIImage(named: "yellow")
            
        case 7:
            view1image.image = UIImage(named: "pink")
        case 8:
            view1image.image = UIImage(named: "orange")
        case 9:
            view1image.image = UIImage(named: "purple")
            
            
            
        default:
            view1image.image = UIImage(named: "gazounashi")
            
            
        }
        
        // ピンチを定義
        //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(View1.pinchView(sender:)))  //Swift3
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
    
    ////////////////////////////////////
    //ここから、誤作動防止のためのコード
    
    //左上をタップした後に長押しをしたら、無効になり、右下をタップしても画面は戻らない
    
    @objc func longPressAction(_ sender: UILongPressGestureRecognizer) {
        if sender.state == .ended {
            //ここに、長押し終了時に実行したい処理を記載する
            print("長押し")
            modoruButton1 = false
            modoruButton2 = false
            
            Taplongdouble = 1
            print(Taplongdouble)
        }
    }
    
    //左上をタップした後にダブルタップをしたら、無効になり、右下をタップしても画面は戻らない
    @objc func doubleTap(_ gesture: UITapGestureRecognizer) {
        // ダブルタップされた時の処理を記述してください。
        print("ダブルタップ")
        modoruButton1 = false
        modoruButton2 = false
        
        Taplongdouble = 2
        print(Taplongdouble)
        
        
    }
    
    
    //もどる方法がピンチかタップか決める
    
   
    
    @IBAction func modoruButton1(_ sender: Any) {
        print("modorutap\(modorutap)")
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
    ///↑ここまでをコピーして他の画面にも貼り付ける 最後４３３行のif modorutap == false{ }
    /////////////////////////////////////
    
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

