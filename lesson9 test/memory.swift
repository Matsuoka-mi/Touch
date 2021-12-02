//
//  newViewController.swift
//  singleton
//
//  Created by book mac on 2021/12/01.
//

import UIKit

class Manager {
    var memory:String = "iroNumber"

    static let shared = Manager()
    private init() {
    }
}


class newViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

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

