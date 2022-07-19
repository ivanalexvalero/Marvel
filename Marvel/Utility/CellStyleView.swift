//
//  CellStyleView.swift
//  Marvel
//
//  Created by Ivan Valero on 13/07/2022.
//

import Foundation
import UIKit

class CellStyleView: UIView  {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
//        fatalError("init(coder:) has not been implemented")
        setupView()
    }

    private func setupView() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 4
        layer.shadowOpacity = 0.1

    }

    
}
