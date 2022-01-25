//
//  SceneDelegate.swift
//  Table
//
//  Created by Сергей Яковлев on 21.01.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    var viewController: ViewController?
    var tableViewConrtoller: TableViewController?
    var collectionViewController: CollectionViewController?
    var textViewController: TextViewController?
    
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        self.viewController = ViewController()
        self.tableViewConrtoller = TableViewController()
        self.collectionViewController = CollectionViewController()
        self.textViewController = TextViewController()
        
        let tabBarController = UITabBarController()
        
        tabBarController.viewControllers = [viewController!, tableViewConrtoller!, collectionViewController!, textViewController!]
        
        let item1 = UITabBarItem(title: "Фон", image: UIImage(named: "rtr"), tag: 0)
        let item2 = UITabBarItem(title: "Таблица", image: UIImage(named: "knb"), tag: 1)
        let item3 = UITabBarItem(title: "Коллекция", image: UIImage(named: "jkj"), tag: 2)
        let item4 = UITabBarItem(title: "Текст", image: UIImage(named: "qwe"), tag: 3)
        
        
        UITabBar.appearance().tintColor = UIColor.white.withAlphaComponent(0.5)
        //UITabBar.appearance().barTintColor = UIColor.red.withAlphaComponent(0.5)
        UITabBar.appearance().backgroundColor = UIColor.darkGray.withAlphaComponent(0.5)
        UITabBar.appearance().unselectedItemTintColor = UIColor.white
        
        viewController?.tabBarItem = item1
        tableViewConrtoller?.tabBarItem = item2
        collectionViewController?.tabBarItem = item3
        textViewController?.tabBarItem = item4
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        guard let _ = (scene as? UIWindowScene) else { return }
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()

    }
    
    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }
    
    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }
    
    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }
    
    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }
    
    
}

