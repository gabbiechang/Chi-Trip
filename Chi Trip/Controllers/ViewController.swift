//
//  ViewController.swift
//  Chi Trip
//
//  Created by Gabbie on 7/23/18.
//  Copyright © 2018 Gabbie. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import ISPageControl

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var pageControl: ISPageControl!
    var pageControl1: ISPageControl!
    let images: [UIImage] = []//images
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageControl.numberOfPages = images.count
        
        let frame = CGRect(x: 0, y: 500, width: UIScreen.main.bounds.width, height: 100)
        pageControl1 = ISPageControl(frame: frame, numberOfPages: images.count)
        pageControl1.radius = 8
        pageControl1.padding = 10
        pageControl1.inactiveTintColor = UIColor.white.withAlphaComponent(0.4)
        pageControl1.currentPageTintColor = UIColor.black
        pageControl1.borderWidth = 1
        pageControl1.borderColor = UIColor.black.withAlphaComponent(0.4)
        view.addSubview(pageControl1)
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ImageCell
        cell.staImageView.image = images[indexPath.item]
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 240)
    }
}

extension ViewController: UIScrollViewDelegate {
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let pageNumber = round(scrollView.contentOffset.x / scrollView.frame.size.width)
        pageControl.currentPage = Int(pageNumber)
        pageControl1.currentPage = Int(pageNumber)
    }
}

class ImageCell: UICollectionViewCell {
    
    @IBOutlet weak var staImageView: UIImageView!
}






















//uchenna commented this out

//
//class ViewController: UIViewController {
//
////    var attractions = [Attraction](){
////        didSet{
////            DispatchQueue.main.async {
////             //  tableview.reloadData()
////            }
////        }
////    }
////
//    override func viewDidLoad() {
//        super.viewDidLoad()
//    }
//
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//        // Dispose of any resources that can be recreated.
//    }
//
//
//}
//
