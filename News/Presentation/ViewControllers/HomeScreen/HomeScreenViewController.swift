//
//  HomeScreenViewController.swift
//  News
//
//  Created by Yosafat.H.S on 31/10/24.
//

import UIKit
import RxSwift
import RxCocoa
import SDWebImage

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var tabCollectionView: UICollectionView!
    @IBOutlet weak var headlineCollectionView: UICollectionView!
    
    private let viewModel: HomeScreenViewModel
    private let disposeBag = DisposeBag()
    
    let menuName = ["Headlines", "Everything"]
    
    var isFirstTime = true
    
    private var arrNewArticle: [Article] = []
    
    init(viewModel: HomeScreenViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabCollectionView()
        bindViewModel()
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        if(isFirstTime){
            selectFirstItem()
            isFirstTime = false
        }
    }
    
    
    private func bindViewModel(){
        viewModel.output.data
            .drive(onNext: { [weak self] entity in
                self?.arrNewArticle = entity.articles
                self?.headlineCollectionView.reloadData()
            })
            .disposed(by: disposeBag)
        
        viewModel.output.errorMessage
            .drive(onNext: { [weak self] error in
                print(error)
            })
            .disposed(by: disposeBag)
    }
    
    private func setupTabCollectionView(){
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        headlineCollectionView.delegate = self
        headlineCollectionView.dataSource = self
        
        
        tabCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")
        headlineCollectionView.register(UINib(nibName: "NewsCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "NewsCollectionViewCell")

    }
    
    private func selectFirstItem(){
        let indexPath = IndexPath(item: 0, section: 0)
        tabCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        collectionView(tabCollectionView, didSelectItemAt: indexPath)
    }

}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == tabCollectionView){
            return menuName.count
        }else{
            return arrNewArticle.count
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if(collectionView == tabCollectionView){
            let cell = tabCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
            cell.titleLabel.text = menuName[indexPath.row]
            return cell
        }else{
            let cell = headlineCollectionView.dequeueReusableCell(withReuseIdentifier: "NewsCollectionViewCell", for: indexPath) as! NewsCollectionViewCell
            
            let article = arrNewArticle[indexPath.row]
            
            cell.titleLabel.text = article.title
            cell.subTitleLabel.text = article.description
            
            if let imageUrl = URL(string: article.urlToImage ?? ""){
                cell.imageNews.sd_setImage(with: imageUrl)
            }
            
            cell.dateLabel.text = article.publishedAt.toReadableString() + " " + article.publishedAt.toTimeString()
            
            return cell
        }
        
        
    }
    
}

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if(collectionView == tabCollectionView){
            let width = (collectionView.frame.width - 10) / 2
            return CGSize(width: width, height: 50)
        }else{
            return CGSize(width: collectionView.frame.width, height: 415)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // UICollectionViewDelegate Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == tabCollectionView){
            if let cell = collectionView.cellForItem(at: indexPath) as? HomeTabCollectionViewCell {
                
                cell.titleLabel.textColor = .label
                cell.lineView.backgroundColor = .tintColor
            }
        }
        
        
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if(collectionView == tabCollectionView){
            if let cell = collectionView.cellForItem(at: indexPath) as? HomeTabCollectionViewCell {
                
                cell.titleLabel.textColor = .lightGray
                cell.lineView.backgroundColor = .clear
            }
        }
        
    }

}
