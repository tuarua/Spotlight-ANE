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
public class CustomAttributeKey {
    private var _keyName:String;
    private var _isSearchable:Boolean;
    private var _isSearchableByDefault:Boolean;
    private var _isUnique:Boolean;
    private var _isMultiValued:Boolean;

    /**
     * @param keyName The name of the custom attribute for use as a key in a SearchableItemAttributeSet.
     * The key name must be a string that contains only ASCII characters and no punctuation other than
     * the underscore (that is, “_”). The prefix kMD is reserved.
     * @param isSearchable A Boolean value that indicates if the attribute can be specified as a search term.
     * @param isSearchableByDefault A Boolean value that indicates if the attribute should be searchable by default.
     * @param isUnique A Boolean value that indicates if duplicate values should be treated as the same value
     * to save storage space.
     * @param isMultiValued A Boolean value that indicates if the attribute is likely to have multiple values,
     * such as arrays, associated with it.
     */
    public function CustomAttributeKey(keyName:String,
                                       isSearchable:Boolean = true,
                                       isSearchableByDefault:Boolean = false,
                                       isUnique:Boolean = false,
                                       isMultiValued:Boolean = false) {
        this._keyName = keyName;
        this._isSearchable = isSearchable;
        this._isSearchableByDefault = isSearchableByDefault;
        this._isUnique = isUnique;
        this._isMultiValued = isMultiValued;
    }

    public function get keyName():String {
        return _keyName;
    }
    /** Can this attribute be searched on? By default, true*/
    public function get isSearchable():Boolean {
        return _isSearchable;
    }
    /** Is this property searchable by default? By default, false*/
    public function get isSearchableByDefault():Boolean {
        return _isSearchableByDefault;
    }
    /**  Should values be uniqued to save storage? By default, false. Set this to true when there is a small set of
     * known values, or values are likely to be frequently repeating for other reasons.*/
    public function get isUnique():Boolean {
        return _isUnique;
    }
    /** Is this attribute expecting multiple values to be associated with it, i.e. are values arrays?  By default, false */
    public function get isMultiValued():Boolean {
        return _isMultiValued;
    }
}
}
