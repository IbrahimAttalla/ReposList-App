//
//  ReposListVMTest.swift
//  ReposListAppTests
//
//  Created by Ebrahim Attalla on 1/5/22.
//

import XCTest
@testable import ReposListApp

class ReposListVMTest: XCTestCase {

    var sut :ReposListVM!
    var apiServicesMoke:APIServiceMoke!
    
    
    override func setUpWithError() throws {
        
        super.setUp()
        
        apiServicesMoke = APIServiceMoke()
        
        // Inject Moked Api service into ViewModel
        sut = ReposListVM(dataGateWay: apiServicesMoke)
        
    }

    
    override func tearDownWithError() throws {
        sut = nil
    }
    
    
    
    func testfetchReposList(){
        
        //MARK:-  Given -

        //MARK:-  when -
        sut.fetchReposList()
       // wait(for: [promise], timeout: 8)
        
        //MARK:-  then -
        XCTAssert(apiServicesMoke.fetchingReposListIsCalled)

        // this test case we use a ( moke service )  insted of the real one to test the calling of method fetchReposList().
        
        
    }
    
    
    func testsearch(){
        
        //MARK:-  Given -
        
        var reposList = [Repo]()
        
        var firstRepo = Repo()
        firstRepo.name = "grit1"
        
        var secondRepo = Repo()
        secondRepo.name = "grit2"

        var thirdRepo = Repo()
        thirdRepo.name = "god"

        reposList.append(firstRepo)
        reposList.append(secondRepo)
        reposList.append(thirdRepo)

        sut.baseReposList = reposList
        
        
        
        //MARK:-  when -

        sut.search(with: "grit")
        
        
        
        
        //MARK:-  then -
        XCTAssert(sut.reposList.value?.isEmpty == false)
        
        
        
    }


}
