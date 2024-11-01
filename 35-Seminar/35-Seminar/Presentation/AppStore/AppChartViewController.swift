//
//  AppChartViewController.swift
//  35-Seminar
//
//  Created by 조호근 on 11/1/24.
//

import UIKit

final class AppChartViewController: UIViewController {
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(AppChartTableViewCell.self, forCellReuseIdentifier: AppChartTableViewCell.identifier)
        return tableView
    }()
    
    private var items: [AppItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
        configureTableView()
    }
    
    private func setUI() {
        view.addSubview(tableView)
    }
    
    private func setLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    private func configureTableView() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func configure(with items: [AppItem]) {
        self.items = items
        tableView.reloadData()
    }
    
}

extension AppChartViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AppChartTableViewCell.identifier, for: indexPath) as? AppChartTableViewCell else {
            return UITableViewCell()
        }
        
        let item = items[indexPath.row]
        cell.configure(with: item, isRankVisible: true)
        
        return cell
    }
    
}

extension AppChartViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let item = items[indexPath.row]
        if item.id == "com.toss.free" {
            let tossDetailVC = AppMainViewController()
            tossDetailVC.title = item.title
            navigationController?.pushViewController(tossDetailVC, animated: true)
        }
    }
    
}
