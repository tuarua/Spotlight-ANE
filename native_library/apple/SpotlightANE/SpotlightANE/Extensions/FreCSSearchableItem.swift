/* Copyright 2018 Tua Rua Ltd.
 
 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at
 
 http://www.apache.org/licenses/LICENSE-2.0
 
 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 */

import Foundation
import FreSwift
import CoreSpotlight
#if canImport(MobileCoreServices)
import MobileCoreServices
#else
#endif

public extension CSSearchableItem {
    convenience init?(_ freObject: FREObject?) {
        guard let rv = freObject,
            let attributeSet = CSSearchableItemAttributeSet(rv["attributeSet"]) else {
            return nil
        }
        let fre = FreObjectSwift(rv)
        self.init(uniqueIdentifier: fre.uniqueIdentifier,
                  domainIdentifier: fre.domainIdentifier,
                  attributeSet: attributeSet)
        if let expirationDate: Date = fre.expirationDate {
            self.expirationDate = expirationDate
        }
    }
    
    func toFREObject() -> FREObject? {
        var ret = FREObject(className: "com.tuarua.spotlight.SearchableItem",
                            args: uniqueIdentifier,
                            domainIdentifier,
                            attributeSet.toFREObject(itemId: uniqueIdentifier))
        ret?["expirationDate"] = expirationDate.toFREObject()
        return ret
    }
}

public extension Array where Element == CSSearchableItem {
    init?(_ freObject: FREObject?) {
        guard let rv = freObject else { return nil }
        self = FREArray(rv).compactMap { CSSearchableItem($0) }
    }
    func toFREObject() -> FREObject? {
        return FREArray(className: "com.tuarua.spotlight.SearchableItem",
                        length: self.count, fixed: true,
                        items: self.compactMap { $0.toFREObject() })?.rawValue
    }
}
