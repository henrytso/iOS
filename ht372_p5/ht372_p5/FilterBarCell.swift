//
//  FilterBarCell.swift
//  ht372_p5
//
//  Created by Mann Public IMac on 3/29/18.
//  Copyright © 2018 Henry Tso. All rights reserved.
//

import UIKit

enum FilterCategory {
    case type
    case time
}

class FilterBarCell: UICollectionViewCell {
    var filterLabel: UILabel!
    var category: FilterCategory!
    
    init(frame: CGRect, category: FilterCategory) {
        super.init(frame: frame)
        
        self.category = category
        
        filterLabel = UILabel()
        filterLabel.font = UIFont.systemFont(ofSize: 14)
        filterLabel.textColor = .white
        
        filterLabel.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(filterLabel)
    }
    
    override func updateConstraints() {
        NSLayoutConstraint.activate([
            filterLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
            filterLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
            ])
        super.updateConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
