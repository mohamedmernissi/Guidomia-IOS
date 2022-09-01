//
//  MainPresenter.swift
//  Guidomia
//
//  Created by mohamed mernissi on 31/8/2022.
//  
//

import Foundation

class MainPresenter: ViewToPresenterMainProtocol {

    // MARK: Properties
    var view: PresenterToViewMainProtocol?
    var interactor: PresenterToInteractorMainProtocol?
    var router: PresenterToRouterMainProtocol?
    private var entitiesArray = [MainEntity]()
    private var filteredEntitiesArray = [MainEntity]()
    private var isFiltered = false

    func getCars(){
        interactor?.getCarsLists()
    }

    func carsCount() -> Int{
        return !isFiltered ? entitiesArray.count : filteredEntitiesArray.count
    }

    func getCarModel(by index: Int) -> MainEntity?{
        return !isFiltered ? entitiesArray[index] : filteredEntitiesArray[index]
    }

    func toggleExpandedState(index: Int) {
        return !isFiltered ? entitiesArray[index].cellState.isExpanded.toggle() : filteredEntitiesArray[index].cellState.isExpanded.toggle()
    }

    func isFiltering(_ isFiltering: Bool) {
        isFiltered = isFiltering
    }

    func getCarsMakeList() -> [String] {
        return entitiesArray.map { entity in
            entity.make
        }
    }

    func getCarsModelList(make: String)  -> [String]{
        return entitiesArray.filter { entity in
            return entity.make == make
        }.map { entity in
            entity.model
        }
    }

    func filter(with make: String?, model: String?){
        let sortedMakes = entitiesArray.filter { entity in
            entity.make == make
        }
        if let model = model {
            if model.isEmpty {
                self.filteredEntitiesArray = sortedMakes
            } else {
                self.filteredEntitiesArray = sortedMakes.filter { entity in
                    entity.model == model
                }
            }
        }
        view?.reloadTableView()
    }
}

extension MainPresenter: InteractorToPresenterMainProtocol {
    func didGetCarsList(response: CarsResponse) {
        for item in response {
            var prosViews = [DottedLabelView]()
            var consViews = [DottedLabelView]()
            for pro in item.prosList {
                guard !pro.isEmpty else {
                    continue
                }
                let view = DottedLabelView()
                view.setup(with: pro)
                prosViews.append(view)
            }

            for con in item.consList {
                guard !con.isEmpty else {
                    continue
                }
                let view = DottedLabelView()
                view.setup(with: con)
                consViews.append(view)
            }
            let model = MainEntity(cellState: CellState(), consList: item.consList, customerPrice: item.customerPrice, make: item.make, marketPrice: item.marketPrice, model: item.model, prosList: item.prosList, rating: item.rating, pros: prosViews, cons: consViews)
            entitiesArray.append(model)
        }
        view?.reloadTableView()
    }

    func failedTogetCarsList() {
        view?.failedToGetCars()
    }
}
