//
//  TrantorBooksAPITests.swift
//  TrantorBooksAPITests
//
//  Created by Aitor Salgado on 6/3/23.
//

import XCTest
@testable import TrantorBooksAPI

final class TrantorBooksAPITests: XCTestCase {
    let network = NetworkPersistance.shared
    let booksVMTest = BooksViewModel()
    let bookDetailVM = BooksDetailViewModel(book: .bookTest)
    

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }
    
    func testGetLatestBooks() async throws {
        let latestBooks = try await network.getLatestBooks()
        XCTAssertTrue(latestBooks.count == 20)
    }
    
    func testGetAllBooks() async throws {
        let allBooks = try await network.getAllBooks()
        XCTAssertTrue(allBooks.first(where: {$0.id == 3})?.title == "A Princess of Mars" )
    }
    
    func testGetAllAuthors() async throws {
        let authors = try await network.getAllAuthors()
        XCTAssertTrue(authors.count == 293)
    }
    
    func testGetBooksByTitle() async throws {
        let booksByTitle = try await network.getBooksByTitle(titleToSearch: "Tales of Space and Time")
        XCTAssertTrue(booksByTitle.count == 1)
    }

//    func testGetAuthorNameById() async throws {
//        let authorDetailTest = AuthorDetail(id: UUID(uuidString: "A9A0A540-E881-4BCE-A105-E27E8AC508AA")!, name: "Stanley R. Lee")
//        let authorTestName = booksVMTest.getAuthorNameById(id: authorDetailTest.id)
//        XCTAssertEqual(authorTestName, authorDetailTest.name)
//    }
    
    func testGetAuthorDetailNameByID() async throws {
        let authorDetailTest = AuthorDetail(id: UUID(uuidString: "A9A0A540-E881-4BCE-A105-E27E8AC508AA")!, name: "Stanley R. Lee")
        await bookDetailVM.getAuthorDetailNameByID(id: authorDetailTest.id)
        XCTAssertEqual(bookDetailVM.authorName, authorDetailTest.name)
    }
    
    func testGetUserDetail() async throws {
        let testUserEmail = "barril_establecer0o@icloud.com"
        let testUserSend = UserDetail(email:testUserEmail)
            let testUserDetail = try await network.getUserInfo(userDetail: testUserSend)
            XCTAssertTrue(testUserDetail.email == testUserEmail)
            XCTAssertTrue(testUserDetail.role == "admin")
            XCTAssertTrue(testUserDetail.name == "Aitor Salgado")
            XCTAssertTrue(testUserDetail.location == "Segunda Fundación")
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
