//
//  CharactersViewModelTests.swift
//  CharacterTests
//
//  Created by MhMuD SalAh on 24/08/2025.
//

import XCTest
import SwiftUI
@testable import Character

final class CharactersViewModelTests: XCTestCase {

    private let charactersUseCase = CharactersUseCase(repository: CharactersRepositoryMock())
    private var sut: CharactersViewModel!
    
    @MainActor
    override func setUp() {
        self.sut = CharactersViewModel(
            useCase: charactersUseCase,
            router: CharactersCoordinator(path: .constant(NavigationPath()))
        )
    }
    
    override func tearDown() {
        self.sut = nil
    }
    
    func test_returns_correct_initial_state() {
        XCTAssertEqual(sut.filteredCharacters.count, 0)
    }
    
    func test_returns_correct_fetched_characters_count() async {
        await sut.viewDidLoad()
        XCTAssertEqual(sut.filteredCharacters.count, 2)
    }
    
    func test_returns_correct_fetched_characters_mapping() async {
        await sut.viewDidLoad()
        XCTAssertEqual(sut.filteredCharacters.first?.name, "Rick Sanchez")
    }
    
    func test_returns_correct_filtered_characters() async {
        await sut.viewDidLoad()
        
        sut.searchQuery = "Ri"
        XCTAssertEqual(sut.filteredCharacters.first?.name, "Rick Sanchez")
        
        sut.searchQuery = "Morty"
        XCTAssertEqual(sut.filteredCharacters.first?.name, "Morty Smith")
    }
    
    func test_returns_correct_unfiltered_characters_after_reset() async {
        await sut.viewDidLoad()
        
        sut.searchQuery = "Ri"
        XCTAssertEqual(sut.filteredCharacters.count, 1)
        
        sut.searchQuery = ""
        XCTAssertEqual(sut.filteredCharacters.count, 2)
    }
}
