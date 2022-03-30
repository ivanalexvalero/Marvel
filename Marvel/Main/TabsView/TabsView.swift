//
//  TabsView.swift
//  Marvel
//
//  Created by Ivan Valero on 29/03/2022.
//

import Foundation
import UIKit
import SwiftUI

protocol TabsViewProtocol: AnyObject {
    func didSelectOption(index: Int)
}

class TabsView: UIView {
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
        collection.translatesAutoresizingMaskIntoConstraints = false
        
        collection.register(UINib(nibName: "OptionsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "OptionsCollectionViewCell")
        
        return collection
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configCollectionView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    private var options: [String] = []
    weak private var delegate: TabsViewProtocol?
    
    func buildView(delegate: TabsViewProtocol, options: [String]) {
        self.delegate = delegate
        self.options = options
        collectionView.reloadData()
    }
    
    func configCollectionView(){
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
    }
}

extension TabsView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "OptionsCollectionViewCell", for: indexPath) as? OptionsCollectionViewCell else {
            return UICollectionViewCell()
        }
        cell.setupCell(option: options[indexPath.item ])
        return cell
    }
}

extension TabsView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 100, height: frame.height)
    }
}
