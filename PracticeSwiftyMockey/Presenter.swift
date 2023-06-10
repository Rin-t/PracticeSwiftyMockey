//
//  Presenter.swift
//  PracticeSwiftyMockey
//
//  Created by Rin on 2023/06/09.
//

import Foundation
import SwiftyMocky

protocol AutoMockable {}


protocol PresenterInput: AnyObject, AutoMockable {
    func viewDidLoad()
}

protocol PresenterOutput: AnyObject, AutoMockable {
    func showUser(user: String)
}


final class Presenter {

    private let useCase: UseCaseInput
    private unowned let view: PresenterOutput

    init(useCase: UseCaseInput, view: PresenterOutput) {
        self.useCase = useCase
        self.view = view
    }

}

extension Presenter: PresenterInput {

    func viewDidLoad() {
        useCase.fetchUser { [weak self] in
            switch $0 {
            case .success(let user):
                self?.view.showUser(user: user)
            case .failure:
                print("エラー")
            }
        }
    }
}
