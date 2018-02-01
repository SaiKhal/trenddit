//
//  PostView.swift
//  trenddit
//
//  Created by C4Q on 1/31/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

import UIKit

class PostView: UIView {

    //set up the objects
    
    lazy var userName: UILabel = {
        let label = UILabel()
        label.backgroundColor = .orange
        return label
    }()
    
    lazy var collectionView: UICollectionView = {
        let constant = UICollectionViewFlowLayout()
        constant.scrollDirection = .horizontal
        let cv = UICollectionView(frame: CGRect.zero , collectionViewLayout: constant)
        cv.backgroundColor = .yellow
        return cv
    }()
    
    lazy var textField: UITextField = {
        let tf = UITextField()
        //TODO: add place holder text
        return tf
    }()
    
    lazy var addImgButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    //MUST HAVE THE REQUIRED INIT IN EVERY VIEW!
    //Its used when its story board
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
    
    //MUST ALWAYS HAVE THIS FUNC TOO!This function runs at the start of the view when it being initialized. Basically like view did load but for views
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        setViews()
        backgroundColor = .white
        
    }
    
    
    func setViews(){
        //setKanizImage()
    }
    
}

