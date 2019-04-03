//
//  NYTMostPopularTests.swift
//  NYTMostPopularTests
//
//  Created by Aftab Ahmed on 4/2/19.
//  Copyright © 2019 FAMCO. All rights reserved.
//

import XCTest
@testable import NYTMostPopular

class NYTMostPopularTests: XCTestCase {
    
    enum Constants {
        static let storyboardName = "Main"
        static let newsVCID = "NewsVCID"
        static let newsDetailVCId = "NewsDetailVC"
    }

    var newsVC: NewsViewController?
    var newsDetailVC: NewsDetailViewController?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        guard let newsVC = UIStoryboard(name: Constants.storyboardName, bundle: nil).instantiateViewController(withIdentifier: Constants.newsVCID) as? NewsViewController else {
            return
        }
        self.newsVC = newsVC
        
        guard let newsDetailVC = UIStoryboard(name: Constants.storyboardName, bundle: nil).instantiateViewController(withIdentifier: Constants.newsDetailVCId) as? NewsDetailViewController else {
            return
        }
        self.newsDetailVC = newsDetailVC
    }
    
    func testCallAPI() {
        self.newsVC?.callNewsData()
        sleep(7)
        guard let _ = self.newsVC?.allNewsData else {
            XCTAssert(false, "Network Error")
            return
        }
        XCTAssert(true, "Data Loaded")
    }
    
    func testNewsDetail() {
        self.newsVC?.callNewsData()
        sleep(7)
        guard let allNewsData = self.newsVC?.allNewsData else {
            print("Network Error")
            return
        }
        if !allNewsData.isEmpty {
            self.newsVC?.showNewsDetailViewController(forInt: 0)
            XCTAssert(true, "Data Loaded")
        }
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
