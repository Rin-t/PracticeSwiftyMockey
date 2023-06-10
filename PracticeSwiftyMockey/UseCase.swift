//
//  UseCase.swift
//  PracticeSwiftyMockey
//
//  Created by Rin on 2023/06/10.
//

import Foundation

protocol UseCaseInput: AutoMockable {
    func fetchUser(completion: (Result<String, Error>) -> Void)
}


final class UseCase: UseCaseInput {

    func fetchUser(completion: (Result<String, Error>) -> Void) {
        completion(.success("うちゅう人たなかたろう"))
    }
}
