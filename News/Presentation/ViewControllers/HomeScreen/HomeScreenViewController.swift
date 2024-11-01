//
//  HomeScreenViewController.swift
//  News
//
//  Created by Yosafat.H.S on 31/10/24.
//

import UIKit

class HomeScreenViewController: UIViewController {
    
    @IBOutlet weak var tabCollectionView: UICollectionView!
    
    let menuName = ["Headlines", "Everything"]
    
    var isFirstTime = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTabCollectionView()
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        if(isFirstTime){
            selectFirstItem()
            isFirstTime = false
        }
    }
    
    
    private func setupTabCollectionView(){
        tabCollectionView.delegate = self
        tabCollectionView.dataSource = self
        
        tabCollectionView.register(UINib(nibName: "HomeTabCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "HomeTabCollectionViewCell")

    }
    
    private func selectFirstItem(){
        let indexPath = IndexPath(item: 0, section: 0)
        tabCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
        collectionView(tabCollectionView, didSelectItemAt: indexPath)
    }

}

extension HomeScreenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return menuName.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = tabCollectionView.dequeueReusableCell(withReuseIdentifier: "HomeTabCollectionViewCell", for: indexPath) as! HomeTabCollectionViewCell
        cell.titleLabel.text = menuName[indexPath.row]
        return cell
    }
    
}

extension HomeScreenViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.frame.width - 10) / 2
        return CGSize(width: width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
    
    // UICollectionViewDelegate Method
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeTabCollectionViewCell {
            
            cell.titleLabel.textColor = .label
            cell.lineView.backgroundColor = .tintColor
        }
    }

    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        
        if let cell = collectionView.cellForItem(at: indexPath) as? HomeTabCollectionViewCell {
            
            cell.titleLabel.textColor = .lightGray
            cell.lineView.backgroundColor = .clear
        }
    }

}
