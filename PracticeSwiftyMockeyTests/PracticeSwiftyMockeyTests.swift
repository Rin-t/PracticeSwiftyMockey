//
//  PracticeSwiftyMockeyTests.swift
//  PracticeSwiftyMockeyTests
//
//  Created by Rin on 2023/06/09.
//

import XCTest
@testable import PracticeSwiftyMockey



final class PracticeSwiftyMockyTests: XCTestCase {

    func test_ユーザーの取得処理がViewDidLoadで一度呼ばれること() {
        let useCaseMock = UseCaseInputMock()
        let viewMock = PresenterOutputMock()

        let targetPresenter = Presenter(
            useCase: useCaseMock,
            view: viewMock
        )

        targetPresenter.viewDidLoad()

        let result: (Result<String, Error>) -> Void = { _ in }
        
        useCaseMock.verify(
            .fetchUser(completion: .value(result)),
            count: .once
        )

    }

}
