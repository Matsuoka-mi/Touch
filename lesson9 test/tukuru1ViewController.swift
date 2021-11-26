//
//  tukuru1ViewController.swift
//  lesson9 test
//
//  Created by book mac on 2021/11/25.
//

import UIKit

class tukuru1ViewController: UIViewController {
    
    var gazo: Int = 0
    
    @IBOutlet weak var imageViewtukuru1: UIImageView!
    @IBAction func blackAction(_ sender: UIButton) {
        self.gazo = 1
        imageViewtukuru1.image = UIImage(named: "black")
        print(self.gazo)
    }
    
    @IBAction func whiteAction(_ sender: UIButton) {
        self.gazo = 2
        imageViewtukuru1.image = UIImage(named: "white")
        print(self.gazo)
    }
    @IBAction func redAction(_ sender: UIButton) {
        self.gazo = 3
        imageViewtukuru1.image = UIImage(named: "red")
        print(self.gazo)
    }
    
    @IBAction func modoru(_ sender: UIButton) {
        
        //画面遷移////////////////////////////
        //色の値（gazo)をtukuruに渡す
        let tukuruView = self.storyboard?.instantiateViewController(withIdentifier: "tukuruViewController") as! tukuruViewController
            tukuruView.gazou = self.gazo
        self.present(tukuruView, animated: true, completion: nil)    //遷移の実行
        sender.isSelected = !sender.isSelected;
        //画面遷移////////////////////////////
        
        print("tukuruの\(tukuruView.gazou)")
        print("tukuru1の\(self.gazo)")
        
      
        
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //色
                self.imageViewtukuru1.layer.borderColor = UIColor.blue.cgColor
        //線の太さ(太さ)
                self.imageViewtukuru1.layer.borderWidth = 3
        
        
       

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
