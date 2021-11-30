//
//  greenViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class greenViewController: UIViewController {

    @IBOutlet weak var imageView3: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView3.image = UIImage(named: "green")
        
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


