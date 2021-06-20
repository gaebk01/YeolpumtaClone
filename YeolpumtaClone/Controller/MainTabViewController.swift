//
//  MainTabViewController.swift
//  YeolpumtaClone
//
//  Created by 김진태 on 2021/06/13.
//

import UIKit

class MainTabViewController: UITabBarController {
    // MARK: - Lifecycle
    
    // 유저 로그인 여부
    var userLogged = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewControllers()
        setupUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        validateAuth()
    }
    
    // MARK: - Helper

    /** Tab Bar를 통해 화면에 나타나게 할 View Controller 설정
     */
    func setupViewControllers() {
        let insightsViewController = InsightsViewController()
        let homeViewController = HomeViewController()
        let rankingViewController = RankingViewController()
        
        let insightsTabBarIconImage = UIImage(named: Constants.ImageName.insights)
        let homeTabBarIconImage = UIImage(named: Constants.ImageName.home)
        let rankingTabBarIconImage = UIImage(named: Constants.ImageName.star)
        
        insightsViewController.tabBarItem = UITabBarItem(title: "통계", image: insightsTabBarIconImage, tag: 0)
        homeViewController.tabBarItem = UITabBarItem(title: "홈", image: homeTabBarIconImage, tag: 1)
        rankingViewController.tabBarItem = UITabBarItem(title: "랭킹", image: rankingTabBarIconImage, tag: 2)
        
        setViewControllers([insightsViewController, homeViewController, rankingViewController], animated: false)
    }
    
    func setupUI() {
        view.backgroundColor = .systemBackground
        tabBar.tintColor = .darkGray
    }
    
    // 유저 로그인 여부 확인해서 FirstViewController 로그인 화면 보여주기
    func validateAuth() {
        if !userLogged {
            let vc = FirstViewController()
            let nav = UINavigationController(rootViewController: vc)
            nav.modalPresentationStyle = .fullScreen
            present(nav, animated: true)
        } else {
            // 탭바 initial View 두번째꺼로
            self.selectedIndex = 1
        }
    }
   
}
