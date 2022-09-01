//
//  MainContract.swift
//  Guidomia
//
//  Created by mohamed mernissi on 31/8/2022.
//  
//

import Foundation


// MARK: View Output (Presenter -> View)
protocol PresenterToViewMainProtocol {
    func reloadTableView()
    func failedToGetCars()
}

// MARK: View Input (View -> Presenter)
protocol ViewToPresenterMainProtocol {
    
    var view: PresenterToViewMainProtocol? { get set }
    var interactor: PresenterToInteractorMainProtocol? { get set }
    var router: PresenterToRouterMainProtocol? { get set }

    func getCars()
    func carsCount() -> Int
    func getCarModel(by index: Int) -> MainEntity?
    func toggleExpandedState(index: Int)
    func getCarsMakeList() -> [String]
    func getCarsModelList(make: String) -> [String]
    func filter(with make: String?, model: String?)
    func isFiltering(_ isFiltering: Bool)
}

// MARK: Interactor Input (Presenter -> Interactor)
protocol PresenterToInteractorMainProtocol {
    
    var presenter: InteractorToPresenterMainProtocol? { get set }
    func getCarsLists()
}


// MARK: Interactor Output (Interactor -> Presenter)
protocol InteractorToPresenterMainProtocol {
    func didGetCarsList(response: CarsResponse)
    func failedTogetCarsList()
}

// MARK: Router Input (Presenter -> Router)
protocol PresenterToRouterMainProtocol {
    
}
