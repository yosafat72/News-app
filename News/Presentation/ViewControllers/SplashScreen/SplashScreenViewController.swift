//
//  SplashScreenViewController.swift
//  News
//
//  Created by Yosafat.H.S on 31/10/24.
//

import UIKit

class SplashScreenViewController: UIViewController {
    
    @IBOutlet weak var ivLogo: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logoConfiguration()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0){
            self.navigateToMainScreen()
        }
    }
    
    private func logoConfiguration(){
        
        ivLogo.layer.cornerRadius = 20
        
        ivLogo.layer.shadowColor = UIColor.black.cgColor
        ivLogo.layer.shadowOpacity = 0.3
        ivLogo.layer.shadowOffset = CGSize(width: 0, height: 2)
        ivLogo.layer.shadowRadius = 5
        
    }
    
    private func navigateToMainScreen() {
        let dashboardViewController = DoashboardTabBarController()
    
       
        if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
           let window = windowScene.windows.first {
            window.rootViewController = dashboardViewController
            window.makeKeyAndVisible()
        }
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
