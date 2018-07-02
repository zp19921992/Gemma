//
//  WordViewController.swift
//  RXSwiftDemo
//
//  Created by peng zhu on 2018/6/28.
//  Copyright © 2018年 Alger. All rights reserved.
//

import UIKit

struct WordUISetting {
    var cellIdentifier: String = "wordCellIdentifier"
}

class WordViewController: UIViewController {

    var wordCollectionView: UICollectionView!
    
    let uiSetting: WordUISetting = WordUISetting()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
        setupUI()
        // Do any additional setup after loading the view.
    }
    
    func setupUI() {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionLayout.estimatedItemSize = CGSize(width: 50, height: 32)
        collectionLayout.minimumLineSpacing = 15
        collectionLayout.minimumInteritemSpacing = 15
        collectionLayout.sectionInset = UIEdgeInsetsMake(20, 15, 20, 15)
        wordCollectionView = UICollectionView.init(frame: view.bounds, collectionViewLayout: collectionLayout)
        wordCollectionView.delegate = self
        wordCollectionView.dataSource = self
        wordCollectionView.backgroundColor = UIColor.white
        view.addSubview(wordCollectionView)
        wordCollectionView.register(UINib(nibName: String(describing: BaseTextCell.self), bundle: Bundle.main), forCellWithReuseIdentifier: uiSetting.cellIdentifier)
    }
    
    @objc func dismissVC() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension WordViewController : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: BaseTextCell = collectionView.dequeueReusableCell(withReuseIdentifier: uiSetting.cellIdentifier, for: indexPath) as! BaseTextCell
        cell.title = String(format: "test:%d", arc4random()%10000)
        cell.layoutIfNeeded()
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize.zero
    }
}
