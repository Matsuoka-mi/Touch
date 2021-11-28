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
    
    @IBOutlet weak var zyunimageViwe1: UIImageView!
    
    @IBOutlet weak var checkView: CheckBox!
  
    @IBAction func zyunmodoru(_ sender: UIButton) {
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
        
    }
    
    
    
    ///////////////////ここから////////////////
    @IBAction func checkView(_ sender: CheckBox) {
        print(sender.isChecked)
        
    }
  
    var gazouzyun:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
      
       
    }
        
        
    
    //forkey
    override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            
            
            //アプリを再起動してもiro1の色を表示する
            ////////////////////////////////////////////////////////////////////////////////////////////////////////
            iroNumber = userDefaults.integer(forKey: "iro1")
            self.gazouzyun = iroNumber
            print("zyunbanのiroNumberは\(iroNumber)")
            
            
            //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
            
            
            
        //gazouzyun の変数の中にcase ごとに１や２などの時の処理とそれ以外の時の処理を書いている
        
        switch iroNumber{
        case 1 :
            zyunimageViwe1.image = UIImage(named: "black")
     
            
        case 2 :
            zyunimageViwe1.image = UIImage(named: "white")
     
            
            
        default:
            zyunimageViwe1.image = UIImage(named: "red")
     
            
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

}
