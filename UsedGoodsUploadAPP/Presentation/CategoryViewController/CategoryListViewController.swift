//
//  CategoryListViewController.swift
//  UsedGoodsUploadAPP
//
//  Created by 김정민 on 2022/04/23.
//

import UIKit
import RxSwift
import RxCocoa
import SnapKit


final class CategoryListViewController : UIViewController {
    
    let disposeBag = DisposeBag()

    let tableView = UITableView()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
        attribute()
        layout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(_ viewModel: CategoryViewModel) {
        
        viewModel.cellData
            .drive(tableView.rx.items) { tv, row, data in
                
                let cell = tv.dequeueReusableCell(withIdentifier: "CategoryListCell", for: IndexPath(row: row, section: 0))
                
                cell.textLabel?.text = data.name
                
                return cell
            }
        
        viewModel.pop
            .emit(onNext: { [weak self]  in
                self?.navigationController?.popViewController(animated: true)
            })
            .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .map { $0.row }
            .bind(to: viewModel.itemSelected)
            .disposed(by: disposeBag)
        
    }
    
    private func attribute() {
        
        view.backgroundColor = .systemBackground
        tableView.backgroundColor = .white
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "CategoryListCell")
        tableView.separatorStyle = .singleLine
        tableView.tableFooterView = UIView()
        
    }
    
    private func layout() {
        
        view.addSubview(tableView)
        
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        
    }
}
