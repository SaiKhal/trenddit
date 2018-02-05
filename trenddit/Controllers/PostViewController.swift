//
//  PostViewController.swift
//  trenddit
//
//  Created by C4Q on 2/1/18.
//  Copyright © 2018 C4Q. All rights reserved.
//

//Kaniz
import UIKit
import FirebaseDatabase

class PostViewController: UIViewController {
    let cellSpacing: CGFloat = 5.0
    
    let postView = PostView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .magenta //for testing
        view.addSubview(postView)  // add view on top of view controller
        postView.collectionView.register(CategoryCollectionViewCell.self, forCellWithReuseIdentifier: "category cell")
        postView.collectionView.delegate = self
        postView.collectionView.dataSource = self
        setButtonActions()
    }
    
    // MARK: - User Actions
    @objc func addImagePressed() {
        //present(SignUpVC(), animated: true, completion: nil)
    }
    
    @objc func postPressed() {
//        if let (email, password) = validSignUpText(view: loginView) {
//            authClient.signIn(withEmail: email, password: password)
//        }
    }
    
    func setButtonActions() {
        postView.addImgButton.addTarget(self, action: #selector(addImagePressed), for: .touchUpInside)
//        loginView.callToActionView.callToActionButton.addTarget(self, action: #selector(signUpPressed), for: .touchUpInside)
    }
}


// MARK: - CollectionView Flow
extension PostViewController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let numCells: CGFloat = 3
        let numSpaces: CGFloat = numCells + 1
        
        let screenWidth = UIScreen.main.bounds.width
        let screenHeight = UIScreen.main.bounds.height
        
        return CGSize(width: (screenWidth - (cellSpacing * numSpaces)) / numCells, height: screenHeight * 0.25)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: cellSpacing, left: cellSpacing, bottom: 0, right: cellSpacing)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return cellSpacing
    }
    
    
}

//MARK: - Collection View Data Source
extension PostViewController: UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postView.collectionView.dequeueReusableCell(withReuseIdentifier: "category cell", for: indexPath) as! CategoryCollectionViewCell
        
        return cell
    }

    
    //MARK: - Navigation
}
