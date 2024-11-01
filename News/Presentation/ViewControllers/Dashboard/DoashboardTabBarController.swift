//
//  DoashboardTabBarController.swift
//  News
//
//  Created by Yosafat.H.S on 31/10/24.
//

import UIKit

class DoashboardTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configTabs()
        
    }
    
    private func configTabs(){
        
        let newsDataSource = NewsDataSourceImpl()
        let newsRepository = NewsRepositoryImpl(newsDataSource: newsDataSource)
        let fetchHeadlineNewsUseCase = FetchHeadlineNewsUseCase(repository: newsRepository)
        let homeScreenViewModel = HomeScreenViewModel(fetchHeadlineUsecase: fetchHeadlineNewsUseCase)
        
        let homeVC = HomeScreenViewController(viewModel: homeScreenViewModel)
        let profileVC = ProfileScreenViewController()
        
        homeVC.title = "Home"
        profileVC.title = "Profile"
        
        let homeNav = UINavigationController(rootViewController: homeVC)
        let profileNav = UINavigationController(rootViewController: profileVC)
        
        homeNav.navigationBar.backgroundColor = .systemGray6
        homeNav.navigationBar.tintColor = .label
        
        homeNav.tabBarItem = UITabBarItem(title: "Home", image: UIImage(systemName: "house"), tag: 0)
        profileNav.tabBarItem = UITabBarItem(title: "Profile", image: UIImage(systemName: "person"), tag: 1)
        
        self.viewControllers = [homeNav, profileNav]
        
        self.tabBar.backgroundColor = .systemGray6
        
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
