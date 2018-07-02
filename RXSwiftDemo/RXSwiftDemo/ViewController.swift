//
//  ViewController.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/6/26.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func wallet(_ sender: Any) {
        self.presentVC(vc: WalletViewController())
    }
    @IBAction func login(_ sender: Any) {
//        self.presentVC(vc: LoginViewController())
    }
    
    @IBAction func comfirmView(_ sender: Any) {
        self.presentVC(vc: ComfirmViewController())
    }
    
    @IBAction func words(_ sender: Any) {
        self.presentVC(vc: WordViewController())
    }
    
    func presentVC(vc: UIViewController) {
        let vcNav: UINavigationController = UINavigationController(rootViewController: vc)
        self.present(vcNav, animated: true, completion: nil)
    }
}

