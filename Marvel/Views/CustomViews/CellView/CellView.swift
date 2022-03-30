//
//  CellView.swift
//  Marvel
//
//  Created by Ivan Valero on 29/03/2022.
//

import Foundation
import UIKit
import Accelerate



final class CellView: UIView {

    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialSetup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initialSetup()
    }
    
    private func initialSetup() {
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = .zero
        layer.cornerRadius = 10
        layer.shadowOpacity = 0.1
        layer.shadowRadius = 10
    }
    
}

