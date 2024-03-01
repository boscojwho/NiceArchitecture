//
//  GetPostsRequest.swift
//  NiceArchitecture: <https://github.com/steamclock/NiceArchitecture>](https://github.com/steamclock/NiceArchitecture)
//
//  Copyright © 2024, Steamclock Software.
//  Some rights reserved: <https://github.com/steamclock/NiceArchitecture/blob/main/LICENSE>](https://github.com/steamclock/NiceArchitecture/blob/main/LICENSE)
//

import Foundation
import Netable

/// Fetch a list of all posts from the placeholder API
struct GetPostsRequest: Request {
    typealias Parameters = Empty
    typealias RawResource = [Post]

    public var method = HTTPMethod.get
    public var path = "posts"
}
