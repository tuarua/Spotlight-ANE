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
import Contacts
#if canImport(MobileCoreServices)
import MobileCoreServices
#else
#endif

public class SwiftController: NSObject {
    public static var TAG: String = "SwiftController"
    public var context: FreContextSwift!
    public var functionsToSet: FREFunctionMap = [:]
    private var indexes: [String: CSSearchableIndex] = [:]
    private var queries: [String: CSSearchQuery] = [:]
    internal var appDidFinishLaunchingNotification: Notification?
    private var searchResults: [String: [CSSearchableItem]] = [:]
    
    func initIndex(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 1,
            let id = String(argv[0])
            else {
                return FreArgError(message: "initIndex").getError(#file, #line, #column)
        }
        if let name = String(argv[1]) {
            indexes[id] = CSSearchableIndex(name: name)
        } else {
            indexes[id] = CSSearchableIndex.default()
        }
        return nil
    }
    
    func isIndexingAvailable(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        return CSSearchableIndex.isIndexingAvailable().toFREObject()
    }
    
    func indexSearchableItems(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 2,
            let id = String(argv[0]),
            let items = [CSSearchableItem](argv[1]),
            let index = indexes[id]
            else {
                return FreArgError(message: "indexSearchableItems").getError(#file, #line, #column)
        }
        
        let eventId = String(argv[2])
        
        index.indexSearchableItems(items) { error in
            guard let eventId = eventId else { return }
            if let error = error as NSError? {
                self.dispatchEvent(name: SpotlightEvent.index,
                                   value: SpotlightEvent(eventId: eventId,
                                                         id: id,
                                                         error: CSIndexError(_nsError: error)).toJSONString())
            } else {
                self.dispatchEvent(name: SpotlightEvent.index,
                                   value: SpotlightEvent(eventId: eventId, id: id).toJSONString())
            }
        }
        return nil
    }
    
    func deleteSearchableItems(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 3,
            let id = String(argv[0]),
            let index = indexes[id]
            else {
                return FreArgError(message: "deleteSearchableItems").getError(#file, #line, #column)
        }
        let eventId = String(argv[3])
        if let identifiers = [String](argv[1]) {
            index.deleteSearchableItems(withIdentifiers: identifiers) { error in
                guard let eventId = eventId else { return }
                if let error = error as NSError? {
                    self.dispatchEvent(name: SpotlightEvent.delete,
                                       value: SpotlightEvent(eventId: eventId,
                                                             id: id,
                                                             error: CSIndexError(_nsError: error)).toJSONString())
                } else {
                    self.dispatchEvent(name: SpotlightEvent.delete,
                                       value: SpotlightEvent(eventId: eventId, id: id).toJSONString())
                }
            }
        } else if let domainIdentifiers = [String](argv[2]) {
            index.deleteSearchableItems(withDomainIdentifiers: domainIdentifiers) { error in
                guard let eventId = eventId else { return }
                if let error = error as NSError? {
                    self.dispatchEvent(name: SpotlightEvent.delete,
                                       value: SpotlightEvent(eventId: eventId,
                                                             id: id,
                                                             error: CSIndexError(_nsError: error)).toJSONString())
                } else {
                    self.dispatchEvent(name: SpotlightEvent.delete,
                                       value: SpotlightEvent(eventId: eventId, id: id).toJSONString())
                }
            }
        }
        return nil
    }
    
    func deleteAllSearchableItems(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 1,
            let id = String(argv[0]),
            let index = indexes[id]
            else {
                return FreArgError(message: "deleteAllSearchableItems").getError(#file, #line, #column)
        }
        let eventId = String(argv[1])
        index.deleteAllSearchableItems { error in
            guard let eventId = eventId else { return }
            if let error = error as NSError? {
                self.dispatchEvent(name: SpotlightEvent.deleteAll,
                                   value: SpotlightEvent(eventId: eventId,
                                                         id: id,
                                                         error: CSIndexError(_nsError: error)).toJSONString())
            } else {
                self.dispatchEvent(name: SpotlightEvent.deleteAll,
                                   value: SpotlightEvent(eventId: eventId, id: id).toJSONString())
            }
            
        }
        return nil
    }
    
    func getSpotlightId(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
#if os(iOS)
        if let userInfo = appDidFinishLaunchingNotification?.userInfo,
            let userActivityDict = userInfo[UIApplication.LaunchOptionsKey.userActivityDictionary] as? NSDictionary,
            let userActivity = userActivityDict["UIApplicationLaunchOptionsUserActivityKey"] as? NSUserActivity,
            userActivity.activityType == CSSearchableItemActionType,
            let uniqueIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as? String {
            return uniqueIdentifier.toFREObject()
        }
#endif
        return nil
    }
    
    func initQuery(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 2,
            let id = String(argv[0]),
            let queryString = String(argv[1])
            else {
                return FreArgError(message: "initQuery").getError(#file, #line, #column)
        }
        let attributes = [String](argv[2])
        queries[id] = CSSearchQuery(queryString: queryString, attributes: attributes)
        return nil
    }
    
    func startQuery(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 1,
            let id = String(argv[0]),
            let query = queries[id]
            else {
                return FreArgError(message: "startQuery").getError(#file, #line, #column)
        }
        let eventId = String(argv[1])
        searchResults[id] = [CSSearchableItem]()
        query.foundItemsHandler = { items in
            self.searchResults[id]?.append(contentsOf: items)
        }
        
        query.completionHandler = { error in
            if let error = error as NSError? {
                self.dispatchEvent(name: SpotlightEvent.queryComplete,
                                   value: SpotlightEvent(eventId: eventId,
                                                         id: id,
                                                         error: CSSearchQueryError(_nsError: error)).toJSONString())
            } else {
                self.dispatchEvent(name: SpotlightEvent.queryComplete,
                                   value: SpotlightEvent(eventId: eventId, id: id).toJSONString())
            }
        }
        query.start()
        return nil
    }
    
    func cancelQuery(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 0,
            let id = String(argv[0])
            else {
                return FreArgError(message: "cancelQuery").getError(#file, #line, #column)
        }
        queries[id]?.cancel()
        return nil
    }
    
    func disposeQuery(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 0,
            let id = String(argv[0])
            else {
                return FreArgError(message: "disposeQuery").getError(#file, #line, #column)
        }
        queries[id] = nil
        searchResults[id] = nil
        return nil
    }
    
    func disposeIndex(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 0,
            let id = String(argv[0])
            else {
                return FreArgError(message: "disposeIndex").getError(#file, #line, #column)
        }
        indexes[id] = nil
        return nil
    }
    
    func getQueryResults(ctx: FREContext, argc: FREArgc, argv: FREArgv) -> FREObject? {
        guard argc > 0,
            let id = String(argv[0])
            else {
                return FreArgError(message: "getQueryResults").getError(#file, #line, #column)
        }
        return searchResults[id]?.toFREObject()
    }
    
}
