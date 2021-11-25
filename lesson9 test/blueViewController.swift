//
//  blueViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class blueViewController: UIViewController {

    var kido: Int = 0
    
    @IBOutlet weak var imageView2: UIImageView!

   //imageViewの上にTapGestureRecognizerを追加。storyboardの一番右の黄色いまるからコントロールを押しながら移動したい画面へドラッグ。できた矢印をクリックした状態で右カラムのIdentifierに好きな名前をつける。
    //TapGestureRecognizerのアイコンとソースコードをコントロールを押しながら接続し「Action」で名前をつけて下記のように記入すると、画像をタップで画面遷移できる。
    
 
    @IBAction func Tap2(_ sender: Any) {
        
        //輝度//////////////////////////////////////////////輝度////////////////
        if kido == 1 {
       
        UIScreen.main.brightness = 1    //輝度１。明るい。
            kido = 0
        }
        else{
        
            // ①storyboardのインスタンス取得
                    let storyboard: UIStoryboard = self.storyboard!
             
                    // ②遷移先ViewControllerのインスタンス取得
                    let nextView = storyboard.instantiateViewController(withIdentifier: "greenViewController") as! greenViewController
             
                    // ③画面遷移
                    self.present(nextView, animated: true, completion: nil)
            
            
        }
    
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //輝度//////////////////////////////////////////////輝度////////////////
        UIScreen.main.brightness = 0.1 //0.1の輝度（暗い）
        kido = 1
        
        imageView2.image = UIImage(named: "blue")
        
        
        // ピンチを定義
               //let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(PinchCodeViewController.pinchView(_:)))  //Swift2.2以前
               let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(redViewController.pinchView(sender:)))  //Swift3
               // viewにピンチを登録
               self.view.addGestureRecognizer(pinchGesture)
               
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
