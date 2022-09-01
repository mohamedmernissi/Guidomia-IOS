//
//  MainRouter.swift
//  Guidomia
//
//  Created by mohamed mernissi on 31/8/2022.
//  
//

import Foundation
import UIKit

class MainRouter: PresenterToRouterMainProtocol {
    
    // MARK: Static methods
    static func createModule() -> UIViewController {

        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let viewController = storyboard.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        
        let presenter: ViewToPresenterMainProtocol & InteractorToPresenterMainProtocol = MainPresenter()
        
        viewController.presenter = presenter
        viewController.presenter?.router = MainRouter()
        viewController.presenter?.view = viewController
        viewController.presenter?.interactor = MainInteractor()
        viewController.presenter?.interactor?.presenter = presenter
        
        return viewController
    }
    
}
