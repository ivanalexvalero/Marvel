//
//  CharactersViewController.swift
//  Marvel
//
//  Created by Ivan Valero on 25/03/2022.
//

import UIKit

class CharactersViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return modelResult.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CharactersCollectionViewCell", for: indexPath) as? CharactersCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setup(model: modelResult[indexPath.item])
        
        return cell
    }
    

    @IBOutlet weak var chCollectionView: UICollectionView!
    
    var modelResult: [Result] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        chCollectionView.dataSource = self
        chCollectionView.delegate = self
        
        chCollectionView.register(UINib(nibName: "CharactersCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CharactersCollectionViewCell")
    }



}
