//
//  ViewController.swift
//  HorizontalCollectionView
//
//  Created by Mohamed on 8/24/19.
//  Copyright © 2019 Mohamed74. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var dataImage:[UIImage] = [UIImage(named: "burger1")! , UIImage(named: "burger2")!, UIImage(named: "burger3")! ,
                               UIImage(named: "burger4")!,
                               UIImage(named: "burger5")!,UIImage(named: "burger6")! , UIImage(named: "burger1")! , UIImage(named: "burger2")! , UIImage(named: "burger3")! ,
                               UIImage(named: "burger4")!,
                               UIImage(named: "burger5")!,UIImage(named: "burger6")!]
    
    let collectionView:UICollectionView = {
       
        let layout = UICollectionViewFlowLayout()
        
        
        layout.scrollDirection = .horizontal
        
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)

        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(CustomCollectionView.self, forCellWithReuseIdentifier: "Cell")
        
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
  
        view.addSubview(collectionView)
        
        collectionView.backgroundColor = .white
        //collectionView.layer.cornerRadius = 25
        //collectionView.layer.borderColor = #colorLiteral(red: 0.1215686277, green: 0.01176470611, blue: 0.4235294163, alpha: 1)
       // collectionView.layer.borderWidth = 2.5
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.widthAnchor , multiplier: 0.5).isActive = true
        
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}


extension ViewController : UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        collectionView.layer.cornerRadius = 24
        
        return CGSize(width: collectionView.frame.width / 2.5 , height: collectionView.frame.width / 2)
    }
    
    
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return dataImage.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell  = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CustomCollectionView
        
        cell.backgroundColor = .blue
        
        cell.imageView.image = dataImage[indexPath.row]
        
        return cell
    }
    
    
    
    
    
}
class CustomCollectionView:UICollectionViewCell{
    
    let imageView:UIImageView = {
        
        let image = UIImageView()
        
        image.translatesAutoresizingMaskIntoConstraints = false
        image.contentMode = .scaleAspectFill
        image.clipsToBounds = true
        image.layer.cornerRadius = 24
        
        
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        contentView.addSubview(imageView)
        imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}

