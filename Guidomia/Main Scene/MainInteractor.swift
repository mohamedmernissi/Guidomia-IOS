//
//  MainInteractor.swift
//  Guidomia
//
//  Created by mohamed mernissi on 31/8/2022.
//  
//

import Foundation

class MainInteractor: PresenterToInteractorMainProtocol {

    // MARK: Properties
    var presenter: InteractorToPresenterMainProtocol?

    func getCarsLists() {
        let decoder = JSONDecoder()
        if  let url = Bundle.main.url(forResource: "car_list", withExtension: "json"),
            let data = try? Data(contentsOf: url),
            let carsResponse = try? decoder.decode(CarsResponse.self, from: data) {
            presenter?.didGetCarsList(response: carsResponse)
        } else {
            presenter?.failedTogetCarsList()
        }
    }
}
