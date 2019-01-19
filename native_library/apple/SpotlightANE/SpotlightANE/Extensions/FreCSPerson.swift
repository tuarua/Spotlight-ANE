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

public extension CSPerson {
    convenience init?(_ freObject: FREObject?) {
        guard let rv = freObject,
            let handleIdentifier = String(rv["handleIdentifier"]),
            let handles = [String](rv["handles"]) else { return nil }
        let fre = FreObjectSwift(rv)
        let displayName: String? = fre.displayName
        self.init(displayName: displayName, handles: handles, handleIdentifier: handleIdentifier)
        self.contactIdentifier = fre.contactIdentifier
    }
    func toFREObject() -> FREObject? {
        var ret = FREObject(className: "com.tuarua.spotlight.Person",
                            args: self.displayName,
                            self.handles.toFREObject(),
                            self.handleIdentifier)
        ret?["contactIdentifier"] = contactIdentifier?.toFREObject()
        return ret
    }
}

public extension Array where Element == CSPerson {
    init?(_ freObject: FREObject?) {
        self.init()
        guard let rv = freObject else {
            return
        }
        var ret = [CSPerson]()
        let array = FREArray(rv)
        for item in array {
            if let v = CSPerson(item) {
                ret.append(v)
            }
        }
        self = ret
    }
    func toFREObject() -> FREObject? {
        guard let ret = FREArray(className: "com.tuarua.spotlight.Person",
                                 length: self.count, fixed: true) else { return nil }
        var cnt: UInt = 0
        for item in self {
            ret[cnt] = item.toFREObject()
            cnt += 1
        }
        return ret.rawValue
    }
}

public extension FreObjectSwift {
    public subscript(dynamicMember name: String) -> [CSPerson]? {
        get { return [CSPerson](rawValue?[name]) }
        set { rawValue?[name] = newValue?.toFREObject() }
    }
}
