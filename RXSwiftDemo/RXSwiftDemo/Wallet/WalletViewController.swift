//
//  WalletViewController.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/6/26.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

class WalletViewController: UIViewController,ComfirmViewProtocol {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        
        // Do any additional setup after loading the view.
    }

    @objc func dismissVC() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}




