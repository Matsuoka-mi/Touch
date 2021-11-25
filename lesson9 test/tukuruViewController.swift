//
//  zyunbanViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class tukuruViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    

    @IBOutlet weak var tukuimageView1: UIImageView!
    
  
    
    @IBOutlet weak var plusminus: UIButton!

    @IBOutlet weak var kido: UIButton!
    
    var gazou:Int = 0
    
    override func viewDidLoad() {
           
        super.viewDidLoad()
        label.text = "gazouは\(gazou)"
        print(self.gazou)
        //gazo の変数の中にcase ごとに１や２などの時の処理とそれ以外の時の処理を書いている
        
        switch self.gazou{
        case 1 :
            tukuimageView1.image = UIImage(named: "black")
     
            
        case 2 :
            tukuimageView1.image = UIImage(named: "white")
     
            
            
        default:
            tukuimageView1.image = UIImage(named: "red")
     
            
        }
        
        
        
            self.plusminus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
            self.plusminus.setImage(UIImage(systemName: "minus.circle.fill"), for: .selected)
        
            self.kido.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
        
            self.kido.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
        
        }

    
    @IBAction func plusminusTap(_ sender: UIButton) {
        //画面遷移
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
        sender.isSelected = !sender.isSelected;
        }
   
    
    @IBAction func modoru(_ sender: UIButton) {
        //画面遷移
        // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
         
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
         
                // ③画面遷移
                self.present(nextView, animated: true, completion: nil)
    }
    
    
    @IBAction func kidoTap(_ sender: UIButton) {
        sender.isSelected = !sender.isSelected;
    }
    
  
       
    
    
    
    

}
