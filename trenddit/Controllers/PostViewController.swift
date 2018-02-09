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
    let categories = ["Tech", "Sports", "Music", "Animals", "Food", "Fashion", "Art", "Other"]
    var selectedCategory = Set<String>()
    
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
        print(selectedCategory)
        DBService.manager.addPost(title: title, category: selectedCategory, image: image)
    }
    
    func setButtonActions() {
        postView.addImgButton.addTarget(self, action: #selector(openImagePicker), for: .touchUpInside)
        postView.postButton.addTarget(self, action: #selector(postPressed), for: .touchUpInside)
    }
    
//    func getSelectedCategory() -> [String] {
//        var categoriesTemp = [String]()
//        for index in 0..<categories.count {
//            let indexpath = IndexPath(item: index, section: 0)
//            let cell = postView.collectionView.cellForItem(at: indexpath) as! CategoryCollectionViewCell
//            if cell.categoryImageView.backgroundColor == Stylesheet.Colors.Blue {
//                selectedCategory.insert(<#T##newMember: String##String#>)
//            }
//
//        }
//        return categoriesTemp
//    }
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
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = postView.collectionView.dequeueReusableCell(withReuseIdentifier: "category cell", for: indexPath) as! CategoryCollectionViewCell
        let category = categories[indexPath.item]
        cell.categoryLabel.text = category
        return cell
    }

}

extension PostViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! CategoryCollectionViewCell
        let category = cell.categoryLabel.text!
        cell.toggleColor()
        
        if !selectedCategory.contains(category) {
            selectedCategory.insert(category)
        } else {
            selectedCategory.remove(category)
        }
        
    }
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
        postView.addImgButton.alpha = 1.0
        dismiss(animated: true)
    }
}
