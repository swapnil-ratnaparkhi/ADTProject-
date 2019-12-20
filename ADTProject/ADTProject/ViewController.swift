//
//  ViewController.swift
//  ADTProject
//
//  Created by Swapnil Ratnaparkhi on 12/19/19.
//  Copyright © 2019 Swapnil Ratnaparkhi. All rights reserved.
//

// http://newsapi.org/v1/articles?source=the-next-web&sortBy=latest&apiKey=2f98e8fe05a344a3bdd966f65ca550a2

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    var articles = [Article]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.tableFooterView = UIView()
        ServiceCall.shared.fetchData { [weak self] (result) in
            print(result)
            self?.articles = result.articles
            DispatchQueue.main.async {
                self?.tableView.reloadData()
            }

        }
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! TableViewCell

        cell.author.text = self.articles[indexPath.row].author
        cell.authorDescription.text = self.articles[indexPath.row].description
        
        return cell
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    

}

