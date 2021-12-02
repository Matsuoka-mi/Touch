//
//  plusminusButton.swift
//  lesson9 test
//
//  Created by book mac on 2021/12/01.
//

import UIKit

class plusminusButton: UIButton {

    //タッチするとプラスボタンがマイナスに、点灯した電球が消えた電球になる。
    if iroNumber == 0 {
        
        //iroNumber が０（画像がない表示）なら、ボタンはプラスからマイナスに変更
        self.plusminus.setImage(UIImage(systemName: "minus.circle.fill"), for: .normal);
        
        userDefaults.set(iroNumber , forKey: "iro1")
        
        print("プラスを押した後のtukuruのiroNumberは\(iroNumber)")
        
        //       self.kido.setImage(UIImage(systemName: "lightbulb.slash"), for: .normal);
        //        self.kido.setImage(UIImage(systemName: "lightbulb.fill"), for: .selected)
        
        //画面遷移
        // ①storyboardのインスタンス取得
        let storyboard: UIStoryboard = self.storyboard!
        
        // ②遷移先ViewControllerのインスタンス取得
        let nextView = storyboard.instantiateViewController(withIdentifier: "tukuru1ViewController") as! tukuru1ViewController
        
        // ③画面遷移
        let vc = nextView
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
        
        sender.isSelected = !sender.isSelected;
        
    }
    //    self.present(nextView, animated: true, completion: nil)
    else{
        //画像があるなら、「画像がない」画像に変更し、ボタンはマイナスからプラスに変更
        iroNumber = 0
        tukuimageView1.image = UIImage(named: "gazounashi")
        self.plusminus.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal);
        userDefaults.set(iroNumber , forKey: "iro1")
        
    }

}
