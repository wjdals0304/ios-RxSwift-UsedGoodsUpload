//
//  PriceTextFieldCellViewModel.swift
//  UsedGoodsUploadAPP
//
//  Created by 김정민 on 2022/04/23.
//

import RxSwift
import RxCocoa

struct PriceTextFieldCellViewModel {
    
    let showFreeShareButton: Signal<Bool>
    let resetPrice: Signal<Void>
    
    let priceValue = PublishSubject<String?>()
    let freeShareButtonTapped = PublishRelay<Void>()

    
    init() {
        self.showFreeShareButton = Observable.merge(
            priceValue.map { $0  == "0" },
            freeShareButtonTapped.map { _ in false }
        ).asSignal(onErrorJustReturn: false )
        
        self.resetPrice = freeShareButtonTapped
            .asSignal(onErrorSignalWith: .empty())
    }
    
}
