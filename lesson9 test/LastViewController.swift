//
//  LastViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/04.
//

import UIKit

class LastViewController: UIViewController {

    var checkButtonArray = [Int] ()
        
        
    @IBOutlet weak var viewLastimage: UIImageView!
  
   
    
    @IBAction func TapLast(_ sender: Any) {
        
     print("タップ")
      
 //       ①storyboardのインスタンス取得
  let storyboard: UIStoryboard = self.storyboard!
                 
                        // ②遷移先ViewControllerのインスタンス取得
                let ViewController = self.storyboard?.instantiateViewController(withIdentifier: "ViewController") as! ViewController
                
                
                        // ③画面遷移
                
                // 遷移方法にフルスクリーンを指定
                let vc = ViewController
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
        //                self.present(nextView, animated: true, completion: nil)
                
                
            }
        
            
        
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
     
        
        UIScreen.main.brightness = 1    //輝度１。明るい。
    
        viewLastimage.image = UIImage(named: "gazounodashikata")
        
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
    
    
    
    
    
    
    
    
    
    
        
        }

