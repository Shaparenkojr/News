//
//  NewInfoViewModel.swift
//
//  Created by Тарас Шапаренко on 13.11.2024.
//

import Combine

class NewInfoViewModel {
    @Published private(set) var selectedCellData: Response?
    
    private let newInfoData = CurrentValueSubject<Response?, Never>(nil)
    private var subscriptions: Set<AnyCancellable> = []
    
    init() {
        setupBind()
    }
    
    func getNewInfo(_ info: Response) {
        newInfoData.send(info)
    }
}

private extension NewInfoViewModel {
    
    func setupBind() {
        newInfoData
            .sink { [weak self] data in
                self?.selectedCellData = data
            }
            .store(in: &subscriptions)
    }
}

