//
//  ObservableVM.swift
//  NiceUtilities
//
//  Created by Brendan on 2022-09-13.
//  Copyright © 2023 Steamclock Software. All rights reserved.

import Combine
import Foundation
import NiceComponents
import SwiftUI

open class ObservableVM: ObservableObject {
    @Injected(\.errorService) public var errorService: ErrorService

    public var cancellables: [AnyCancellable] = []

    @Published public var contentLoadState: ContentLoadState = .noData

    private(set) var baseBindCalled = false
    private(set) var baseUnbindCalled = false

    public init() {}

    open func unbindViewModel() {
        cancellables.cancelAll()

        baseUnbindCalled = true
    }

    open func bindViewModel() {
        cancellables.cancelAll()

        bindDisplayableError()

        // We want to make sure that if you override bindViewModel,
        //   you don't forget to call super.bindViewModel(), so set a flag here
        baseBindCalled = true
    }

    // While we want to make sure that by default, view models receive error signals,
    //   different view models may want to handle, or suppress, certain errors.
    func bindDisplayableError() {
        errorService.didReceiveDisplayableError
            .receive(on: RunLoop.main)
            .sink { [weak self] displayError in
                self?.handleDisplayableError(displayError)
            }.store(in: &cancellables)
    }

    func handleDisplayableError(_ error: DisplayableError) {
        contentLoadState = .error(error: error)
    }

    public func triggerError() {
        errorService.error.send(UnknownError(message: "You triggered an error!"))
    }
}
