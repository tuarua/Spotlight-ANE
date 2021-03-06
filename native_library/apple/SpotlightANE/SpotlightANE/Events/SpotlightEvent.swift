/*
 *  Copyright 2018 Tua Rua Ltd.
 *
 *  Licensed under the Apache License, Version 2.0 (the "License");
 *  you may not use this file except in compliance with the License.
 *  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 *  Unless required by applicable law or agreed to in writing, software
 *  distributed under the License is distributed on an "AS IS" BASIS,
 *  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 *  See the License for the specific language governing permissions and
 *  limitations under the License.
 */

import Foundation
import CoreSpotlight
import SwiftyJSON

class SpotlightEvent: NSObject {
    public static let index = "SpotlightEvent.Index"
    public static let delete = "SpotlightEvent.Delete"
    public static let deleteAll = "SpotlightEvent.DeleteAll"
    public static let launch = "SpotlightEvent.Launch"
    public static let queryComplete = "SpotlightEvent.QueryComplete"
    
    var id: String?
    var callbackId: String?
    var error: CSIndexError?
    var error2: CSSearchQueryError?
    
    convenience init(callbackId: String?, id: String?) {
        self.init()
        self.id = id
        self.callbackId = callbackId
    }
    
    convenience init(callbackId: String?, id: String?, error: CSIndexError) {
        self.init()
        self.callbackId = callbackId
        self.id = id
        self.error = error
    }
    
    convenience init(callbackId: String?, id: String?, error: CSSearchQueryError) {
        self.init()
        self.id = id
        self.callbackId = callbackId
        self.error2 = error
    }
    
    public func toJSONString() -> String {
        var props = [String: Any]()
        props["callbackId"] = callbackId
        props["id"] = id
        if let error = error {
            props["error"] = error.toDictionary()
        } else if let error = error2 {
            props["error"] = error.toDictionary()
        }
        return JSON(props).description
    }
    
}
