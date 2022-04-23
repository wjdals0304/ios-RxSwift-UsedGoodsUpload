//
//  TitleTextFieldCell.swift
//  UsedGoodsUploadAPP
//
//  Created by 김정민 on 2022/04/23.
//

import UIKit
import SnapKit
import RxSwift
import RxCocoa

final class TitleTextFieldCell: UITableViewCell {
    
    let titleInputField = UITextField()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        attribute()
        layout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func attribute() {
        
        titleInputField.font = .systemFont(ofSize: 17)
        
    }
    
    private func layout() {
        
        contentView.addSubview(titleInputField)
        
        titleInputField.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(20)
        }
         
    }
}
