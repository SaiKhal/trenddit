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
import Kingfisher

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
        
        addUserDetails()
    }
    
    private func addUserDetails() {
        guard let user = AuthClient.currentUser else { return }
        postView.userNameButton.setTitle(user.displayName, for: .normal)
        postView.profileImageView.kf.setImage(with: user.photoURL)
    }
    
    // MARK: - User Actions
    @objc func openImagePicker() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    @objc func postPressed() {
        let image = postView.addImgButton.imageView?.image ?? #imageLiteral(resourceName: "postplaceholderimage")
        let title = postView.createPostTF.text ?? "Empty text field"
            DBService.manager.addPost(title: title, category: "test", image: image)
    }
    
    func setButtonActions() {
        postView.addImgButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        postView.postButton.addTarget(self, action: #selector(postPressed), for: .touchUpInside)
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

// MARK: - UIImagePickerControllerDelegate
extension PostViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        var newImage: UIImage
        
        if let possibleImage = info["UIImagePickerControllerEditedImage"] as? UIImage {
            newImage = possibleImage
        } else if let possibleImage = info["UIImagePickerControllerOriginalImage"] as? UIImage {
            newImage = possibleImage
        } else {
            return
        }
        
        postView.addImgButton.setImage(newImage, for: .normal)
        dismiss(animated: true)
    }
}
