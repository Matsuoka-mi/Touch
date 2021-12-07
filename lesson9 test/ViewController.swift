//
//  ViewController.swift
//  lesson9 test/Users/bookmac/Desktop/Tech/iphone/lesson9/lesson9 test11_24/lesson9 test/ViewController.swift
//
//  Created by book mac on 2021/11/23.
//

import UIKit

class ViewController: UIViewController {
    
    //forkey
    let userDefaults:UserDefaults = UserDefaults.standard
 
    
    var ViewControllergazo1: Int = 0
    var ViewControllergazo2: Int = 0
    var ViewControllergazo3: Int = 0
    
    var checkButtonArray = [Int]()
    
    /////あとで消す
    ///
    @IBOutlet weak var imagetest: UIImageView!
    /////あとで消す
    
    
    @IBAction func hazimeru(_ sender: UIButton) {
        
        //画面遷移////////////////////////////
        let FirstView = self.storyboard?.instantiateViewController(withIdentifier: "FirstViewController") as! FirstViewController
        //    FirstView.Firstgazo = self.ViewControllergazo1
        FirstView.Firstgazo1 = UserDefaults.standard.integer(forKey: "iro1")
        FirstView.Firstgazo2 = UserDefaults.standard.integer(forKey: "iro2")
        FirstView.Firstgazo3 = UserDefaults.standard.integer(forKey: "iro3")
        
       //インストール後すぐに「はじめる」を押した時
        let data = UserDefaults.standard.object(forKey: "checkButtonArray")
        
        // チェックボックスの配列がnilではないときの処理
        if data != nil {
       
    //        checkButtonArray = data as! [Int]
            checkButtonArray = UserDefaults.standard.object(forKey: "checkButtonArray") as! [Int]
           
            //       let values = [0, 0, 0, 0, 6]
            //配列の要素が全部０かどうか
                   let isAllEvenNumber = checkButtonArray.allSatisfy { $0 == 0 } // isAllEvenNumber == true

            print("全部ゼロかどうか\(isAllEvenNumber)")
            
            if isAllEvenNumber {
                // ①storyboardのインスタンス取得
                let storyboard: UIStoryboard = self.storyboard!
                
                // ②遷移先ViewControllerのインスタンス取得
                let nextView = storyboard.instantiateViewController(withIdentifier: "viewLast") as! LastViewController
                
                // ③画面遷移
                
                // 遷移方法にフルスクリーンを指定
                let vc = nextView
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                //self.present(nextView, animated: true, completion: nil)
               
             // checkButtonArray = [1]
            }
            
            else {
                
                // ③画面遷移
                
                // 遷移方法にフルスクリーンを指定
                let vc = FirstView
                vc.modalPresentationStyle = .fullScreen
                self.present(vc, animated: true, completion: nil)
                //self.present(nextView, animated: true, completion: nil)
               
             // checkButtonArray = [1]
            }
        }
        else{
            // ①storyboardのインスタンス取得
            let storyboard: UIStoryboard = self.storyboard!
            
            // ②遷移先ViewControllerのインスタンス取得
            let nextView = storyboard.instantiateViewController(withIdentifier: "viewLast") as! LastViewController
            
            // ③画面遷移
            
            // 遷移方法にフルスクリーンを指定
            let vc = nextView
            vc.modalPresentationStyle = .fullScreen
            self.present(vc, animated: true, completion: nil)
        
        }
        
    }
           /*          受け取った配列
            for checkNumber in checkButtonArray {
                print("checkButtonArray for文\(checkNumber)")
                */
       
                /*
                switch checkNumber {
                    
                //０の時
                    case 0:
                        iroNumber1 = self.gazo1
                        userDefaults.set(iroNumber1 , forKey: "iro1")
                        
                    
                //1の時
                case 1:
                    iroNumber1 = self.gazo1
                    userDefaults.set(iroNumber1 , forKey: "iro1")
                    
                //２の時
                case 2:
                    iroNumber2 = self.gazo1
                    userDefaults.set(iroNumber2 , forKey: "iro2")
                
                ////それ以外の時
                default:
                    iroNumber3 = self.gazo1
                    userDefaults.set(iroNumber3 , forKey: "iro3")
                }
                
               */
                
       
    
    @IBAction func zyunban(_ sender: UIButton) {
        
        
        /*          受け取った配列                */
        for checkNumber in checkButtonArray {
            
            if checkNumber == 3{
                print("Viewの3です")
            }
        }
        
        
        
        //「じゅんび」に色の値を渡す
        let zyunView = self.storyboard?.instantiateViewController(withIdentifier: "zyunbanViewController") as! zyunbanViewController
        zyunView.gazouzyun1 = self.ViewControllergazo1
        zyunView.gazouzyun2 = self.ViewControllergazo2
        zyunView.gazouzyun3 = self.ViewControllergazo3
        
        // 遷移方法にフルスクリーンを指定
        let vc = zyunView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
        
        //   self.present(zyunView, animated: true, completion: nil)    //遷移の実行
        sender.isSelected = !sender.isSelected;
        
    }
    
    @IBAction func tukuru(_ sender: UIButton) {
        
        
        
        /* あとで消すここから*/
        for checkNumber in checkButtonArray {
            print("checkButtonArray for文\(checkNumber)")
           
        }
        
        
        
        
        // 全ての値が偶数が判定する
    //    let values = [2, 4, 6, 8, 11]
        
        /* あとで消す 全ての要素が０か確認*/
        let values = [0, 0, 0, 0, 6]
        let isAllEvenNumber = values.allSatisfy { $0 == 0 } // isAllEvenNumber == true

        print(isAllEvenNumber)
        
        /* あとで消す　全ての要素が０か確認　ここまで*/
        
        // 全ての値が５文字以上か判定する
        let names = ["Sofia", "Camilla", "Martina", "Mateo", "Nicolás"]
        let allHaveAtLeastFive = names.allSatisfy({ $0.count >= 5 }) // allHaveAtLeastFive == true
        print(allHaveAtLeastFive)
        /* あとで消すここまで*/
        
        
        
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "tukuruViewController") as! tukuruViewController
        
        // ③画面遷移
        // 遷移方法にフルスクリーンを指定
        let vc = nextView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
        
        
        //     self.present(nextView, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        UIScreen.main.brightness = 1    //輝度１。明るい。
        
        print("はじめにの画面のtag1の明るさはLED1\(UserDefaults.standard.integer(forKey: "LED1"))")
        print("はじめにの画面のtag1の明るさはLED2\(UserDefaults.standard.integer(forKey: "LED2"))")
        print("はじめにの画面のtag1の明るさはLED3\(UserDefaults.standard.integer(forKey: "LED3"))")
        
        
        imagetest.image = UIImage(named: "whiteButton")
        
        //インストール直後に「はじめに」を押した時、配列内はnilなのでエラーが出るための処理。
        //一度、「じゅんび」画面に入って何も触らず再度「はじめに」を押した時も同様の処理をするためにviewWillDisappearに入れている
    
       
        let data = UserDefaults.standard.object(forKey: "checkButtonArray")
        if data != nil {
       
            checkButtonArray = data as! [Int]
        } else {
            
            
           
          checkButtonArray = [1]
            
            
        }
        
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    @IBAction func unwind(_ segue: UIStoryboardSegue){
        
    }
    
    
    
}

