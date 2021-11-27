//
//  DiaryCell.swift
//  Diary
//
//  Created by SeongHoon Kim on 2021/11/24.
//

import UIKit

class DiaryCell: UICollectionViewCell {
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.contentView.layer.cornerRadius = 6.0
        self.contentView.layer.borderWidth = 0.5
        self.contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
