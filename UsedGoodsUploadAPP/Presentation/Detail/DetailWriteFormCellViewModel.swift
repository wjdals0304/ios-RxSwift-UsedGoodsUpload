//
//  DetailWriteFormCellViewModel.swift
//  UsedGoodsUploadAPP
//
//  Created by 김정민 on 2022/04/23.
//

import RxSwift
import RxCocoa

struct DetailWriteFormCellViewModel {
    
    // view -> viewModel
    let contentValue = PublishRelay<String?>()
    
}
