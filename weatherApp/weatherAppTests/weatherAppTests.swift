//
//  weatherAppTests.swift
//  weatherAppTests
//
//  Created by Shady Adel on 28/08/2024.
//

import XCTest
@testable import weatherApp

final class weatherAppTests: XCTestCase {

    override func setUpWithError() throws {
        
    }

    override func tearDownWithError() throws {
       
    }
    
    // Test: Successful Network Call
     func testNetwork_Success() {
         let expectation = self.expectation(description: "Waiting for successful fetch")
         
         NetworkService.fetchData(Constants.ApiUrl) { weather, error in
             XCTAssertNil(error, "Expected no error, but got \(String(describing: error))")
             XCTAssertNotNil(weather, "Expected weather data, but got nil")
             
             XCTAssertEqual(weather?.location.name, "Cairo", "Expected location name to be 'Cairo'")
             
             expectation.fulfill()
         }
         
         wait(for: [expectation], timeout: 1)
     }
     
     // Test: Handle Network Error
     func testNetwork_ErrorHandling() {
         let expectation = self.expectation(description: "Waiting for error handling")
         
         // Temporarily alter the API key to induce an error
         let invalidAPIKey = "invalid_key"
         let api = "https://api.weatherapi.com/v1/forecast.json?key=\(invalidAPIKey)&q=30.0444,31.2357&days=3&aqi=no&alerts=no"
         
         guard URL(string: api) != nil else {
             XCTFail("Failed to create URL with invalid API key")
             return
         }
         
         NetworkService.fetchData(api) { weather, error in
             XCTAssertNotNil(error, "Expected error, but got nil")
             XCTAssertNil(weather, "Expected no weather data, but got \(String(describing: weather))")
             
             expectation.fulfill()
         }
         
         wait(for: [expectation], timeout: 1)
     }

   

}
