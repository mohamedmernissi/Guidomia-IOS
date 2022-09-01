//
//  ViewController.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - @IBOutlets

    @IBOutlet private weak var tableView: UITableView!

    // MARK: - Properties

    var presenter: ViewToPresenterMainProtocol?

    private var makesIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        presenter?.getCars()
        if #available(iOS 15.0, *) {
            UITableView.appearance().sectionHeaderTopPadding = CGFloat(0)
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.carsCount() ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailsCell.identifier, for: indexPath) as! CarDetailsCell
        cell.buttonToggleViews.tag = indexPath.row
        if let entity = presenter?.getCarModel(by: indexPath.row) {
            cell.setup(with: entity)
            cell.delegate = self
        }
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = MainHeaderView()
        headerView.delegate = self
        if let makes = presenter?.getCarsMakeList() {
            headerView.setupMakes(makes)
        }
        return headerView
    }
}

extension MainViewController: MainHeaderViewDelegate {
    func didSelectMake(make: String?, model: String?, header: MainHeaderView) {
        if let make = make ,let index = presenter?.getCarsMakeList().firstIndex(of: make) {
            if index != makesIndex {
                header.txtModel.text = ""
            }
            presenter?.isFiltering(true)
            makesIndex = index
            if let makes = presenter?.getCarsMakeList() {
                header.setupMakes(makes)
                if let models = presenter?.getCarsModelList(make: makes[makesIndex]) {
                    header.setupModels(models)
                }
            }
            self.presenter?.filter(with: make, model: model)
        }
    }

    func clearFilters(header: MainHeaderView) {
        presenter?.isFiltering(false)
        header.clearFields()
        reloadTableView()
    }
}

extension MainViewController: CarDetailsCellDelegate {
    func showCarDetailsTapped(_ cell: CarDetailsCell, _ sender: UIButton) {
        presenter?.toggleExpandedState(index: sender.tag)
        cell.toggleViews()
        if let indexPath = self.tableView.indexPath(for: cell) {
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }
    }
}

extension MainViewController: PresenterToViewMainProtocol {
    func reloadTableView() {
        tableView.reloadData()
    }

    func failedToGetCars() {
        print("Error getting errors")
    }
}
