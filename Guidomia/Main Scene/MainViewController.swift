//
//  ViewController.swift
//  Guidomia
//
//  Created by mohamed mernissi on 30/8/2022.
//

import UIKit

class MainViewController: UIViewController {

    // MARK: - @IBOutlets

    @IBOutlet weak var tableView: UITableView!

    private var cellsState:[CellState] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        for _ in 0...5 {
            self.cellsState.append(CellState())
        }
    }

}

extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellsState.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CarDetailsCell.identifier, for: indexPath) as! CarDetailsCell
        cell.buttonToggleViews.tag = indexPath.row
        cell.isExpanded = self.cellsState[indexPath.row].isExpanded
        cell.toggleViews()
        cell.delegate = self
        return cell
    }
}

extension MainViewController: CarDetailsCellDelegate {
    func showCarDetailsTapped(_ cell: CarDetailsCell, _ sender: UIButton) {
        self.cellsState[sender.tag].isExpanded.toggle()
        cell.toggleViews()
        if let indexPath = self.tableView.indexPath(for: cell) {
            self.tableView.reloadRows(at: [indexPath], with: .none)
        }

    }
}
