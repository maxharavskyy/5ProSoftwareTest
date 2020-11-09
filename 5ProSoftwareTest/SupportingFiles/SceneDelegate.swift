//
//  SceneDelegate.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate, UISplitViewControllerDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        let masterController = SearchController()
        let masterNavigationController = UINavigationController(rootViewController: masterController)

        let detailController = DetailController()
        
        let detailNavigationController = UINavigationController(rootViewController: detailController)

        let splitViewController =  UISplitViewController()
        
        splitViewController.viewControllers = [masterNavigationController, detailNavigationController]
        splitViewController.preferredDisplayMode = .oneBesideSecondary
        splitViewController.delegate = self
        
        if let windowScene = scene as? UIWindowScene {
            window = UIWindow(windowScene: windowScene)
            window?.makeKeyAndVisible()
            window?.rootViewController = splitViewController
        }
    }
    
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
           return true
       }




}

