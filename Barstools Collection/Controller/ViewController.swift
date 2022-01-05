//
//  ViewController.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import UIKit

class ViewController: UIViewController {
    
    let postManager = PostManager()
    
    @IBOutlet weak var collectionView: UICollectionView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("Hello!")
        
        collectionView.delegate = self
        collectionView.dataSource = self
        postManager.delegate = self
        
    
       postManager.fetchInfo()
    }

}


extension ViewController: PostManagerDelegate {
    func didUpdatePost(_ postManager: PostManager, posts: [Post]) {
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func didFailWithError(_ postManager: PostManager, error: Error) {
        print(error)
    }
    
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postManager.post.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let post = postManager.post[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        cell.setPost(post)
        
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width/2-5, height: 200)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = postManager.post[indexPath.row]
        
        postManager.fetchPost(post) { detailedPost in
            DispatchQueue.main.async {
                let vc = PostViewController(post: detailedPost)
                self.present(vc, animated: true, completion: nil)
            }
        } onError: { error in
            print(error)
        }

    }
    
    
}
