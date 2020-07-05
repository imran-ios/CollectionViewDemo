//
//  ViewController.swift
//  CollectionViewDemo
//
//  Created by Kann on 16/10/19.
//  Copyright © 2019 Kann. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionViewOutlet: UICollectionView!
    var data = ["One","Two","Three","Four","Five","Six","Seven","Eight","Nine","Ten","Hundred","Thousand","Hundred Thousand","Ten Thousand Hundred Thousand"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        resizeItemWidth()
       
    }
    func resizeItemWidth(){
        if let flowLayout = collectionViewOutlet?.collectionViewLayout as? UICollectionViewFlowLayout {
            DispatchQueue.main.async {
                flowLayout.estimatedItemSize = CGSize(width: 1, height: 1)
            }
            
        }
    }
    
}

extension ViewController:UICollectionViewDelegateFlowLayout {
    
    
    
}

extension ViewController:UICollectionViewDataSource,UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return data.count
    }
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! CollectionViewCell
        cell.labelOutlet.text = data[indexPath.row]
        cell.layer.borderWidth = 1.0
        cell.layer.borderColor = UIColor.darkGray.cgColor
        return cell
    }
    
}

