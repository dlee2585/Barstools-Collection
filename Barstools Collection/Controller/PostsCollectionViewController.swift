//
//  ViewController.swift
//  Barstools Collection
//
//  Created by David Lee on 1/5/22.
//

import UIKit

class PostsCollectionViewController: UIViewController {
    
    private let postManager = PostManager()
    
    @IBOutlet weak var collectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()
       
        setupCollectionView()
        setupPostManager()
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        title = "Barstool News"
    }
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    private func setupPostManager() {
        postManager.delegate = self
        postManager.fetchPosts()
    }
}

extension PostsCollectionViewController: PostManagerDelegate {
    func didUpdatePosts(_ postManager: PostManager, posts: [Post]) {
        DispatchQueue.main.async {
            // Reload collection view when posts are fetched
            self.collectionView.reloadData()
        }
    }
    
    func didFetchPost(_ postManager: PostManager, post: Post) {
        DispatchQueue.main.async {
            let vc = PostViewController(post: post)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func didFailWithError(_ postManager: PostManager, error: Error) {
        // Present error when failed
        presentError(error)
    }
}

extension PostsCollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        postManager.posts.count
    }
    
    // Dequeue reusable cell based on an identifier and configure based on the indexPath
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let post = postManager.posts[indexPath.row]
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PostCollectionViewCell.identifier, for: indexPath) as! PostCollectionViewCell
        cell.setPost(post)
        
        return cell
    }
}

extension PostsCollectionViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        // Each cell takes up half the collection view width minus 5 pixels (spacing)
        CGSize(width: collectionView.frame.width / 2 - 5, height: 200)
    }
    
    // Determine behavior for selection of a row at a given indexPath
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let post = postManager.posts[indexPath.row]
        
        postManager.fetchPost(post: post)
    }
}
