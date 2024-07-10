//
//  ANF_Code_TestTests.swift
//  ANF Code TestTests
//


import XCTest
@testable import ANF_Code_Test

class ANFExploreCardTableViewControllerTests: XCTestCase {

    var testInstance: ANFExploreCardTableViewController!
    var viewModel: MainPageViewModel = MainPageViewModel()
    
    override func setUp() {
        testInstance = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController() as? ANFExploreCardTableViewController
        testInstance = ANFExploreCardTableViewController()
        testInstance?.viewModel = MainPageViewModel()
    }

    func test_numberOfSections_ShouldBeOne() {
        let numberOfSections = testInstance.numberOfSections(in: testInstance.tableView)
        XCTAssert(numberOfSections == 1, "table view should have 1 section")
    }
    
    func test_numberOfRows_ShouldBeTen() {
        let numberOfRows = testInstance.tableView(testInstance.tableView, numberOfRowsInSection: 0)
        XCTAssert(numberOfRows == 10, "table view should have 10 cells")
    }
    
    func testMainpageCell_has_mainTitle_has_image() {
        let mockViewModel = MainPageViewModel()
        guard let firstData = mockViewModel.dataExplore?.first else { return }
        
        XCTAssertNotNil(firstData.title)
        XCTAssertNotNil(firstData.backgroundImage)
    }
    
    func testContentCell_has_mainTitle_has_image() {
        let mockViewModel = ContentPageViewModel(contentData: [Content(target: "MockTarget", title: "MockTitle")])
        XCTAssertTrue(mockViewModel.recieveContentCount() == 1)
        
        XCTAssertNotNil(mockViewModel.contentData.first?.title)
        XCTAssertNotNil(mockViewModel.contentData.first?.target)
    }
}
