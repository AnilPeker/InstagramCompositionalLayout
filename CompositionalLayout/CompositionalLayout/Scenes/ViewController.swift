//
//  ViewController.swift
//  CompositionalLayout
//
//  Created by Anıl Peker on 13.09.2021.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var collectionView: UICollectionView!
    
    let layout = InstagramLayout()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureCollectionView()
        
    }
    
    private func configureCollectionView() {
        collectionView.register(CollectionViewCell.nib,
                                forCellWithReuseIdentifier: CollectionViewCell.identifier)
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.collectionViewLayout = layout.generateLayout()
    }
}
extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 5
        default:
            return 30
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CollectionViewCell.identifier, for: indexPath)
        return cell
    }
    
    
}

