//
//  TaskTests.swift
//  ToDoAppTests
//
//  Created by Лера Тарасенко on 17.12.2020.
//

import XCTest
@testable import ToDoApp

class TaskTests: XCTestCase {

    func testInitTaskWithTitle() {
        let task = Task(title: "Foo") // Foo Bar Baz
        
        XCTAssertNotNil(task)
    }
    
    func testInitTaskWithTitleAndDescription() {
        let task = Task(title: "Foo", description: "Bar") // Foo Bar Baz
        
        XCTAssertNotNil(task)
    }

    func testWhenGivenTitleSetsTitle() {
        let task = Task(title: "Foo")
        
        XCTAssertEqual(task.title, "Foo")
    }
    
    func testWhenGivenTitleSetsDescription() {
        let task = Task(title: "Foo", description: "Bar")
        
        XCTAssertEqual(task.description, "Bar")
        //or XCTAssertTrue(task.description == "Bar")
    }
    
    func testTaskInitsWithDate(){
        let task = Task(title: "Foo")
        
        XCTAssertNotNil(task.date)
        
    }
}
