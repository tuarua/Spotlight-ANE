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
/** An item that can be indexed and made available to users when they search on their devices.  */
public class SearchableItem {
    private var _uniqueIdentifier:String;
    private var _domainIdentifier:String;
    private var _expirationDate:Date;
    private var _attributeSet:SearchableItemAttributeSet;

    /**
     * @param uniqueIdentifier Should be unique to your application group.
     * <p>REQUIRED since this is the way you will refer to the item to update the index / delete it from the index
     * Starts with an UUID for ease of use, but you can replace it with an UID of your own before the item is first indexed if you wish.</p>
     *
     * @param domainIdentifier An optional identifier that represents the "domain" or owner of this item.
     * <p>This might be an identifier for a mailbox in an account whose indexed data you may want to remove when the account is deleted.
     * In that case the domainIdentifier should be of the form account-id.mailbox-id where account-id and mailbox-id should not contains periods.
     * Calling deleteSearchableItemsWithDomainIdentifiers with account-id.mailbox-id will delete all items with that domain identifier.
     * Calling deleteSearchableItemsWithDomainIdentifiers with account-id will delete all items with account-id and any mailbox-id.</p>
     *
     * @param attributeSet Set of attributes containing meta data for the item
     *
     */
    public function SearchableItem(uniqueIdentifier:String, domainIdentifier:String,
                                   attributeSet:SearchableItemAttributeSet) {
        this._uniqueIdentifier = uniqueIdentifier;
        this._domainIdentifier = domainIdentifier;
        this._attributeSet = attributeSet;
    }

    public function get uniqueIdentifier():String {
        return _uniqueIdentifier;
    }

    public function get domainIdentifier():String {
        return _domainIdentifier;
    }

    /** Searchable items have an expiration date or time to live.  By default it's set to 1 month. */
    public function get expirationDate():Date {
        return _expirationDate;
    }

    public function get attributeSet():SearchableItemAttributeSet {
        return _attributeSet;
    }

    public function set expirationDate(value:Date):void {
        _expirationDate = value;
    }

    public function set attributeSet(value:SearchableItemAttributeSet):void {
        _attributeSet = value;
    }

    public function set domainIdentifier(value:String):void {
        _domainIdentifier = value;
    }
}
}
