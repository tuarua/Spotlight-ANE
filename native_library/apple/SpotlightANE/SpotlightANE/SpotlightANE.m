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

#import <Foundation/Foundation.h>
#import "FreMacros.h"
#import "SpotlightANE_oc.h"
#ifdef OSX
#import <SpotlightANE/SpotlightANE-Swift.h>
#else
#import <SpotlightANE_FW/SpotlightANE_FW.h>
#define FRE_OBJC_BRIDGE TRCSL_FlashRuntimeExtensionsBridge
@interface FRE_OBJC_BRIDGE : NSObject<FreSwiftBridgeProtocol>
@end
@implementation FRE_OBJC_BRIDGE {
}
FRE_OBJC_BRIDGE_FUNCS
@end
#endif
@implementation SpotlightANE_LIB
SWIFT_DECL(TRCSL)

CONTEXT_INIT(TRCSL) {
    SWIFT_INITS(TRCSL)
    
    static FRENamedFunction extensionFunctions[] =
    {
         MAP_FUNCTION(TRCSL, initIndex)
        ,MAP_FUNCTION(TRCSL, initQuery)
        ,MAP_FUNCTION(TRCSL, createGUID)
        ,MAP_FUNCTION(TRCSL, isIndexingAvailable)
        ,MAP_FUNCTION(TRCSL, indexSearchableItems)
        ,MAP_FUNCTION(TRCSL, deleteSearchableItems)
        ,MAP_FUNCTION(TRCSL, deleteAllSearchableItems)
        ,MAP_FUNCTION(TRCSL, getSpotlightId)
        ,MAP_FUNCTION(TRCSL, startQuery)
        ,MAP_FUNCTION(TRCSL, getQueryResults)
        ,MAP_FUNCTION(TRCSL, cancelQuery)
        ,MAP_FUNCTION(TRCSL, disposeQuery)
        ,MAP_FUNCTION(TRCSL, disposeIndex)
    };
    
    SET_FUNCTIONS
}

CONTEXT_FIN(TRCSL) {
    [TRCSL_swft dispose];
    TRCSL_swft = nil;
#ifdef OSX
#else
    TRCSL_freBridge = nil;
    TRCSL_swftBridge = nil;
#endif
    TRCSL_funcArray = nil;
}
EXTENSION_INIT(TRCSL)
EXTENSION_FIN(TRCSL)
@end
