//
//  SceneDelegate.swift
//  IOSTest
//
//  Created by Adarsh Manoharan on 17/04/2 R.
//  Copyright © 2 Adarsh Manoharan. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    @available(iOS 13.0, *)
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        //initialization
        guard let windowScene = (scene as? UIWindowScene) else { return }
        //windo initialization
        window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
        //Initialization - rootviewController initialization
        let navigationController = UINavigationController(rootViewController: IOSTHomeViewController())
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        //Configure App Delegate
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            appDelegate.window = window
        }
    }
}
