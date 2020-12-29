//
//  TaskListViewControllerTests.swift
//  ToDoAppTests
//
//  Created by Лера Тарасенко on 18.12.2020.
//

import XCTest
@testable import ToDoApp

class TaskListViewControllerTests: XCTestCase {
    
    var sut: TaskListViewController!
    
    override func setUpWithError() throws {
        //если через код
        //        let sut = TaskListViewController()
        //
        //        _ = sut.view //sut.loadViewIfNeeded()
        
        //если через storyboard
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: String(describing: TaskListViewController.self) )
        sut = vc as? TaskListViewController
        
        sut.loadViewIfNeeded()
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testWhenViewIsLoadedTableViewNotNil() {
        XCTAssertNotNil(sut.tableView)
    }
    
    func testWhenViewIsLoadedDataProviderIsNotNil() {
        XCTAssertNotNil(sut.dataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateIsSet() {
        XCTAssertTrue(sut.tableView.delegate is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDataSourceIsSet() {
        XCTAssertTrue(sut.tableView.dataSource is DataProvider)
    }
    
    func testWhenViewIsLoadedTableViewDelegateEqualsTableViewDataSource() {
        XCTAssertEqual(
            sut.tableView.delegate as? DataProvider,
            sut.tableView.dataSource as? DataProvider
        )
    }
    
    func testTaskListVCHasAddBarButtonWithSelfAsTarget() {
        let target = sut.navigationItem.rightBarButtonItem?.target
        XCTAssertEqual(target as? TaskListViewController, sut)
    }
    
    func testAddNewTaskPresentsNewTaskViewController() {
        XCTAssertNil(sut.presentedViewController)
        
        guard
            let newTaskButton = sut.navigationItem.rightBarButtonItem,
            let action = newTaskButton.action else {
                XCTFail()
                return
        }
        
        UIApplication.shared.keyWindow?.rootViewController = sut
        sut.performSelector(onMainThread: action, with: newTaskButton, waitUntilDone: true)
        XCTAssertNotNil(sut.presentedViewController) 
        XCTAssertTrue(sut.presentedViewController is NewTaskViewController)
        
        let newTaskViewController = sut.presentedViewController as! NewTaskViewController
        XCTAssertNotNil(newTaskViewController.titleTextField)
    }
    
    
}
