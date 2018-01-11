//
//  ViewController.swift
//  TrainAnimation
//
//  Created by Apple on 11/01/18.
//  Copyright © 2018 Ravindra. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {

    @IBOutlet weak var collectionView: UICollectionView!
     var bubbleTime : Timer?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.size.width/3.3, height: collectionView.frame.size.height)
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCollectionViewCell", for: indexPath) as! CustomCollectionViewCell
        if indexPath.row == 0{
            cell.imageView.image = #imageLiteral(resourceName: "OckyPocky_Favourite_Engine_1010x1010_compressed")
            bubbleTime?.invalidate()
            bubbleTime = Timer.scheduledTimer(timeInterval: TimeInterval(0.5), target: self, selector: #selector(self.AddBubles), userInfo: nil, repeats: true)
        }
        else{
            cell.imageView.image = #imageLiteral(resourceName: "video_placeholder_670x410_compressed")
        }
        return cell
    }
    
    @objc func AddBubles(){
 
        let imageview = UIImageView(image: #imageLiteral(resourceName: "bubble"))
        imageview.frame = CGRect(x: collectionView.frame.origin.x + 100, y: collectionView.frame.height / 2 , width: 20, height: 20)
        
        
        let tap = UITapGestureRecognizer()
        
        tap.addTarget(self, action: #selector(bubbleButtonAction))
        imageview.addGestureRecognizer(tap)
        collectionView.addSubview(imageview)
        collectionView.bringSubview(toFront: imageview)
         UIView.animate(withDuration: 4, delay: 0, options: .allowUserInteraction, animations: {
                imageview.transform = CGAffineTransform(scaleX: 0.07, y: 0.07)
                imageview.transform = CGAffineTransform(translationX: imageview.frame.origin.x + 40, y: imageview.frame.origin.y - 450)
            }) { (Bool) in
                imageview.removeFromSuperview()
                imageview.removeGestureRecognizer(tap)
            }
        
        
    }
    @objc func bubbleButtonAction() {
        print("Button tapped")
    }
    
}

