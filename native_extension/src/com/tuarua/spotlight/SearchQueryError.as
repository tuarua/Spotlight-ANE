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

package com.tuarua.spotlight {
public class SearchQueryError extends Error {
    /** An unknown error occurred. */
    public static const unknown:int = -2000;
    /** The index is unreachable. */
    public static const indexUnreachable:int = -2001;
    /** The query is invalid, such as a syntactically invalid query or one that specifies items
     * that your app isn’t entitled to access. */
    public static const invalidQuery:int = -2002;
    /** The query was cancelled by calling cancel(). */
    public static const cancelled:int = -2003;

    public function SearchQueryError(message:* = "", id:* = 0) {
        super(message, id);
    }
}
}
