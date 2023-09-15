//
//  ViewStates.swift
//  NiceArchitectureExample
//
//  Created by Nigel on 2022-04-24.
//  Copyright © 2023 Steamclock Software. All rights reserved.
//

import Foundation

/// A ViewState is a value type read from the ViewModel by a View.
/// It could be a simplification or reorganization of a model type, for example here
/// the PostViewState combines the `Post` and `User` objects into a single type
/// that can be inserted directly into the list.
/// A ViewState may not be necessary if the mapping between model and view is straightforward.
struct PostViewState: Identifiable {
    var id: Int
    var text: String
    var user: String
    var favourite: Bool = false
}
