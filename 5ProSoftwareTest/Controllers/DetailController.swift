//
//  DetailController.swift
//  5ProSoftwareTest
//
//  Created by Max Haravskyy on 06.11.2020.
//

import UIKit

class DetailController: UITableViewController {
    
    
    var viewModel: DetailViewModelProtocol?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView = UITableView(frame: .zero, style: .insetGrouped)
        navigationController?.navigationBar.prefersLargeTitles = true

        tableView.register(IngredientsCell.self, forCellReuseIdentifier: "ingredient")
        tableView.register(InstructionsCell.self, forCellReuseIdentifier: "instruction")
        tableView.register(DetailHeader.self, forHeaderFooterViewReuseIdentifier: "header")
        
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        fetchDetailData()
        navigationItem.title = viewModel?.setTitle()

    }
    
 
    func fetchDetailData() {
        viewModel?.fetchDetails {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 0 {
            let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as! DetailHeader
            guard let viewModel = viewModel else {return header}
            header.imageView.image = viewModel.setHeaderImage()
            return header
        } else {
            return nil
        }
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let viewModel = viewModel else {return UITableViewCell()}
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ingredient", for: indexPath) as! IngredientsCell
            let cellViewModel = viewModel.populateIngredients(at: indexPath)
            cell.viewModel = cellViewModel
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "instruction", for: indexPath) as! InstructionsCell
            return cell
            
        }
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.section == 1 {
            viewModel?.openInstructions(comletion: { (url) in
                UIApplication.shared.open(url)
            })
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {return 0}
        
        switch section {
        case 0:
            return viewModel.numberOfRows()
        case 1:
            return viewModel.ingredients.isEmpty ? 0 : 1
        default:
            return 0
        }
        
    }
    
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        section == 0 ? view.frame.height / 4 :  10
    }
    
    
        
}



