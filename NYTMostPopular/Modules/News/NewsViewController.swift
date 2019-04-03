//
//  NewsViewController.swift
//  NYTMostPopular
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {

    //**************************************************
    // MARK: - Constants
    //**************************************************
    
    enum Constants {
        static let articleCellId = "NYArticleCell"
        static let storyboardName = "Main"
        static let newsDetailVCId = "NewsDetailVC"
        
        static let apiKey = "EafVnFG3bA3MfHJ3AThGxMrsAyaUzPLV"
        static let oneFarJson = "1.json"
        static let sevenFarJson = "7.json"
        static let thirtyFarJson = "30.json"
        static let nyTimesURLString = "https://api.nytimes.com/svc/mostpopular/v2/mostviewed/all-sections"
    }
    
    //**************************************************
    // MARK: - IBOutlets
    //**************************************************
    
    @IBOutlet weak var newsHeadlinesTableView: UITableView!
    
    //**************************************************
    // MARK: - Variables
    //**************************************************
    
    var allNewsData: [NewsModel]?
    
    //**************************************************
    // MARK: - Methods
    //**************************************************
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewSetup()
        callNewsData()
    }
    
    func viewSetup() {
        self.newsHeadlinesTableView.rowHeight = UITableView.automaticDimension
    }
    
    func callNewsData() {
        showActivityIndicator()
        let urlString = "\(Constants.nyTimesURLString)/\(Constants.oneFarJson)?api-key=\(Constants.apiKey)"
        guard let url = URL(string: urlString) else {
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let task = URLSession.shared.dataTask(with: request) {data, response, error -> Void in
            //Exit if error
            self.hideActivityIndicator()
            guard let resposeData = data,
                error == nil  else {
                    print(error?.localizedDescription ?? "Response Error")
                    return
            }
            //Parsing
            do {
                let jsonResponse = try JSONSerialization.jsonObject(with: resposeData, options: [])
                self.loadNewsData(jsonResponse: jsonResponse)
                
            } catch let parsingError {
                print("Error : \(parsingError)")
            }
        }
        task.resume()
    }
    
    func loadNewsData(jsonResponse: Any) {
        guard let json = jsonResponse as? [String: Any] else {
            print("Model formation Error")
            return
        }
        guard let results = json["results"] as? [[String: Any]] else {
            return
        }
        let newsData = results.compactMap{
            NewsModel($0)
        }
        self.allNewsData = newsData
        DispatchQueue.main.async {
            guard let table = self.newsHeadlinesTableView else {
                return
            }
            table.reloadData()
        }
    }
}

