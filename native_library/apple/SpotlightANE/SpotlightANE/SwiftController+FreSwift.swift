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

extension SwiftController: FreSwiftMainController {
    @objc public func getFunctions(prefix: String) -> [String] {
        functionsToSet["\(prefix)initIndex"] = initIndex
        functionsToSet["\(prefix)initQuery"] = initQuery
        functionsToSet["\(prefix)createGUID"] = createGUID
        functionsToSet["\(prefix)isIndexingAvailable"] = isIndexingAvailable
        functionsToSet["\(prefix)indexSearchableItems"] = indexSearchableItems
        functionsToSet["\(prefix)deleteSearchableItems"] = deleteSearchableItems
        functionsToSet["\(prefix)deleteAllSearchableItems"] = deleteAllSearchableItems
        functionsToSet["\(prefix)getSpotlightId"] = getSpotlightId
        functionsToSet["\(prefix)startQuery"] = startQuery
        functionsToSet["\(prefix)getQueryResults"] = getQueryResults
        functionsToSet["\(prefix)cancelQuery"] = cancelQuery
        functionsToSet["\(prefix)disposeQuery"] = disposeQuery
        functionsToSet["\(prefix)disposeIndex"] = disposeIndex

        var arr: [String] = []
        for key in functionsToSet.keys {
            arr.append(key)
        }
        
        return arr
    }
    
    func createGUID(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        return UUID().uuidString.toFREObject()
    }
    
    @objc public func dispose() {
         NotificationCenter.default.removeObserver(self)
    }
    
    @objc public func callSwiftFunction(name: String, ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        if let fm = functionsToSet[name] {
            return fm(ctx, argc, argv)
        }
        return nil
    }
    
    @objc public func setFREContext(ctx: FREContext) {
        self.context = FreContextSwift(freContext: ctx)
        // Turn on FreSwift logging
        FreSwiftLogger.shared.context = context
    }
    
    @objc func applicationDidFinishLaunching(_ notification: Notification) {
        self.appDidFinishLaunchingNotification = notification
    }
    
    @objc public func onLoad() {
#if os(iOS)
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidFinishLaunching),
                                               name: UIApplication.didFinishLaunchingNotification, object: nil)
#else
        NotificationCenter.default.addObserver(self, selector: #selector(applicationDidFinishLaunching),
                                               name: NSApplication.didFinishLaunchingNotification, object: nil)
#endif
        
    }
    
}
