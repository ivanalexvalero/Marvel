//
//  Buttons.swift
//  Marvel
//
//  Created by Ivan Valero on 01/07/2022.
//

import Foundation
import UIKit

protocol ButtonsProtocol: AnyObject {
    func didSelectOption(index: Int)
}

struct buttonsModel {
    let name: String
    let image1: UIImage
}

class Buttons: UIView {
    
    private var options: [buttonsModel] = []
    weak private var delegate: ButtonsProtocol?
    var selectedItem: IndexPath = IndexPath(item: 0, section: 0)
    
    lazy var collectionView : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        
        let collection = UICollectionView(frame: frame, collectionViewLayout: layout)
        collection.delegate = self
        collection.dataSource = self
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .clear
        
        
        collection.register(UINib(nibName: ButtonsCell.kIdButtons, bundle: nil), forCellWithReuseIdentifier: ButtonsCell.kIdButtons)
        
        return collection
        
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        configCollectionView()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    
    func buildView(delegate: ButtonsProtocol, options: [buttonsModel]){
        self.delegate = delegate
        self.options = options
        collectionView.reloadData()
    }
    
    private func configCollectionView(){
        addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
        ])
        
//        let currentCell = collectionView.cellForItem(at: selectedItem)!
    }
    
}

extension Buttons : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return options.count
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ButtonsCell.kIdButtons, for: indexPath) as? ButtonsCell else {
            return UICollectionViewCell()
        }
        if indexPath.row == 0{
            cell.highLightText(.black)
            cell.imageColor(.black)
            
        }else{
            cell.isSelected = (selectedItem.item == indexPath.row)
        }
        
        
        cell.configButtonCell(option: options[indexPath.item])
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didSelectOption(index: indexPath.item)
    }
}

extension Buttons: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let ancho = collectionView.frame.width / 2
        
        return CGSize(width: ancho, height: frame.height)

    }
}
