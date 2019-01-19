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
import com.tuarua.SpotlightANEContext;
import com.tuarua.fre.ANEError;

import flash.display.BitmapData;

public class SearchableItemAttributeSet {
    /** @private */
    public var itemId:String;
    public function SearchableItemAttributeSet(itemContentType:String) {
        this._itemContentType = itemContentType;
    }

    private var _itemContentType:String;

    /** A localized string to be displayed in the UI for this item. */
    public var displayName:String;

    /** An array of localized strings of alternate display names for this item. */
    public var alternateNames:Vector.<String>;

    /** This is the complete path to the item. */
    public var path:String;

    /** Optional file URL representing the content to be indexed
     * Applications that are also 'Documents & Data' clients can set this property to allow Spotlight to deduplicate
     * their searchable items against the iCloud Drive's items. When this property is set, Spotlight will not display
     * the iCloud Drive's searchable items that have the same contentURL property. */
    public var contentURL:String;

    /** Optional file URL pointing to a thumbnail image for this item */
    public var thumbnailURL:String;

    /** Optional image data for thumbnail for this item */
    public var thumbnailData:BitmapData;

    /** For activities, this is the unique identifier for the item this activity is related to. If the item
     * doesn't exist in the index, the activity will not get stored. When the item is deleted, the
     * activity will also be deleted. */
    public var relatedUniqueIdentifier:String;

    /** For activities, this is the unique identifier for an item this activity is related to. Unlike
     * relatedUniqueIdentifier, this attribute does not link the life time of the items. */
    public var weakRelatedUniqueIdentifier:String;

    /** This is the date that the last metadata attribute was changed. */
    public var metadataModificationDate:Date;

    /** UTI Type pedigree for an item.  Common types can be found in ContentType  */
    public var contentType:String;

    public var contentTypeTree:Vector.<String>;

    /** Represents keywords associated with this particular item.
     * Example Keywords might be Birthday,Important etc. */
    public var keywords:Vector.<String>;

    /** The title of this particular item.
     * Title of the document, or it could be the title of this mp3 or a subject of a mail message. */
    public var title:String;

    /** A version specifier for this item. */
    public var version:String;

    /** This property is used to indicate if the indexed item was created by the user
     * It is used to distinguish pushed app content from content that required explicit user interaction
     * Example content that may set this field: user created notes, documents
     * @available(iOS 11.0, *) */
    public var userCreated:Boolean;

    /** This property is used to indicate if the indexed item has been purchased or otherwise acquired by the user
     * Example content are songs bought by a user and made searchable
     * @available(iOS 11.0, *) */
    public var userOwned:Boolean;

    /** This property is used to indicate if the indexed item was selected by the user
     * It is used to distinguish pushed app content from content that a user has chosen to add to a collection
     * Example content that may set this field: downloaded media content, bookmarked websites/news articles
     * @available(iOS 11.0, *) */
    public var userCurated:Boolean;

    /** This property allows content donors to provide a ranking signal to each indexed item
     * It will inform the ranker, allowing it to distinguish more easily between otherwise similar items
     * This is query-independent and should be used to indicate the relative importance of an item w.r.t. all other items for the same application
     * Expected value ∈ [0-100]; preferably integral values
     * Monotonically increasing with larger values being considered better results
     * @available(iOS 11.0, *) */
    public var rankingHint:Number = -1;

    /** This property has the same semantics as -[CSSearchableItem domainIdentifier].
     * It can be set on the contentAttributeSet property of a NSUserActivity instance and then used to delete the user activity
     * by calling [[SearchableIndex defaultSearchableIndex] deleteSearchableItemsWithDomainIdentifiers:].
     * @available(iOS 10.0, *) */
    public var domainIdentifier:String;

    /** @private */
    public function get itemContentType():String {
        return _itemContentType;
    }


    /************************/
    /****** Document ********/
    /************************/


    /** Subject of the this item. */
    public var subject:String;

    /** Theme of the this item. */
    public var theme:String;

    /** An account of the content of the resource. Description may include
     * but is not limited to: an abstract, table of contents, reference
     * to a graphical representation of content or a free-text account of
     * the content. */
    public var contentDescription:String;

    /** Used to reference to the resource within a given
     * context. Recommended best practice is to identify the resource by
     * means of a string or number conforming to a formal identification system. */
    public var identifier:String;

    /** A class of entity for whom the resource is intended or useful. A
     * class of entity may be determined by the creator or the publisher
     * or by a third party. */
    public var audiences:Vector.<String>;

    /** Size of the document in MB. */
    public var fileSize:Number = -1;

    /** Number of pages in the item. */
    public var pageCount:Number = -1;

    /** Width in points (72 points per inch) of the document page
     * (first page only for PDF's - other pages within the PDF may
     * not be the same width). */
    public var pageWidth:Number = -1;

    /** Height in points (72 points per inch) of the document page
     * (first page only for PDF's - other pages within the PDF may
     * not be the same height). */
    public var pageHeight:Number = -1;

    /** Security (encryption) method used in the file */
    public var securityMethod:String;

    /** Application used to create the document content (e.g. "Word", "Framemaker", etc.). */
    public var creator:String;

    /** Software used to convert the original content into a PDF stream (e.g. "Distiller", etc.). */
    public var encodingApplications:Vector.<String>;

    /** Kind that this item represents. */
    public var kind:String;

    /** Array of font names used in the item. */
    public var fontNames:Vector.<String>;


    /************************/
    /********* Event ********/
    /************************/

    /** Date this item is due. */
    public var dueDate:Date;
    /** Date the item was completed */
    public var completionDate:Date;
    /** Start date of this item. */
    public var startDate:Date;
    /** End date for this item. */
    public var endDate:Date;
    /** Important dates associated with this item */
    public var importantDates:Vector.<Date>;
    /** Whether this event covers complete days */
    public var allDay:Boolean;

    /************************/
    /********* Image ********/
    /************************/

    /**  The height of the item in pixels (ie Image height or Video frame height) */
    public var pixelHeight:Number = -1;

    /** The width of the item in pixels (ie Image width or Video frame width) */
    public var pixelWidth:Number = -1;

    /** The total number of pixels in the item. */
    public var pixelCount:Number = -1;

    /** What color space model is this item following (For example, "RGB", "CMYK", "YUV", "YCbCr") */
    public var colorSpace:String;

    /** Number of bits per sample
     * For example bit depth of an image (8-bit, 16-bit etc..) or bit
     * depth per audio sample of uncompressed audio data (8, 16, 24, 32, 64, etc..) */
    public var bitsPerSample:Number = -1;

    /** Indicates if the flash was used to take the picture.  Should be true if flash is on, false otherwise. */
    public var flashOn:Boolean;

    /** The actual focal length of the lens in mm. */
    public var focalLength:Number = -1;

    /** Indicates if the focal length is 35mm.  Should be 1 if true, 0 otherwise */
    public var focalLength35mm:Number = -1;

    /** Device make that was used to acquire this item */
    public var acquisitionMake:String;

    /** Device model that was used to acquire this item */
    public var acquisitionModel:String;

    /** The owner of the camera used to capture this image. */
    public var cameraOwner:String;

    /** The model of the lens used to capture this image. */
    public var lensModel:String;

    /** The ISO Speed the camera was set to when the image was taken. Examples are 100, 200, 400, etc. */
    public var isoSpeed:Number = -1;

    /** The orientation of the data.  Should be 0 for Landscape or 1 for Portrait. */
    public var orientation:Number = -1;

    /** The names of the various layers in the file */
    public var layerNames:Vector.<String>;

    /** The white balance setting of the camera when the image was acquired.  Should be 0 for Auto or 1 for Manual. */
    public var whiteBalance:Number = -1;

    /** The size of the lens aperture as a log-scale APEX value when the image was acquired. */
    public var aperture:Number = -1;

    /** Name of the color profile used for the image */
    public var profileName:String;

    /** Resolution width of this image in DPI */
    public var resolutionWidthDPI:Number = -1;

    /** Resolution height of this image in DPI */
    public var resolutionHeightDPI:Number = -1;

    /** Mode that was used for the exposure.  Should be 0 for AutoExposure, 1 for Manual, 2 for AutoBracket. */
    public var exposureMode:Number = -1;

    /** Time that the lens was public during exposure in seconds */
    public var exposureTime:Number = -1;

    /** The verion of the EXIF header that was used to generate the metadata */
    public var exifVersion:String;

    /** The version of GPSInfoIFD header that was used to generate the metadata */
    public var exifgpsVersion:String;

    /** Indicates if this image file has an alpha channel.  Should be 0 for no alpha channel, 1 for alpha channel. */
    public var hasAlphaChannel:Boolean;

    /** Indicates if red-eye reduction was used to take the picture.  Should be 0 for no red-eye, 1 for red-eye */
    public var redEyeOn:Boolean;

    /** The metering mode for the image (Average, Partial, Pattern, ...) */
    public var meteringMode:String;

    /** The smallest F number of the lens. The unit is the APEX
     * value. Ordinarily it is given in the range of 00.00 to 99.99. */
    public var maxAperture:Number = -1;

    /** The focal length of the lens divided by the diameter of the aperture when the image was acquired. */
    public var fNumber:Number = -1;

    /** The class of the program used by the camera to set exposure when the picture is taken
     * (Manual, Normal, Aperture Priority, ...) */
    public var exposureProgram:String;

    /** The time  of the exposure as a string, e.g. "1/250 seconds". */
    public var exposureTimeString:String;

    /************************/
    /********* Media ********/
    /************************/

    /** The list of editor/editors that have worked on this item. */
    public var editors:Vector.<String>;

    /** The list of people who are visible in an image or movie or written about in a document.*/
    public var participants:Vector.<String>;

    /** The list of projects that this item is part of.
     * For example if you were working on a movie, all of the movie files could be marked
     * as belonging to the project "My movie"*/
    public var projects:Vector.<String>;

    /** This is the date that the file was last downloaded / received.*/
    public var downloadedDate:Date;

    /** This attribute indicates where the item was obtained from.
     * Examples:
     * - downloaded file may refer to the site they were downloaded from,the refering URL, etc
     * - files received by email may indicate who sent the file, the message subject, etc*/
    public var contentSources:Vector.<String>;

    /** This is a comment related to a file.*/
    public var comment:String;

    /** This is the copyright of the content.*/
    public var copyright:String;

    /** This is the date that the item was last used*/
    public var lastUsedDate:Date;

    /** This is the date that the contents of the item were created*/
    public var contentCreationDate:Date;

    /** This is the date that the contents of the item were last modified*/
    public var contentModificationDate:Date;

    /** This is the date that the item was moved into the current location.*/
    public var addedDate:Date;

    /** This is the duration, in seconds, of the content of the item (if appropriate).*/
    public var duration:Number = -1;

    /** A list of contacts that are somehow associated with this document, beyond what is captured as Author.*/
    public var contactKeywords:Vector.<String>;

    /** The codecs used to encode/decode the media*/
    public var codecs:Vector.<String>;

    /** Media types present in the content*/
    public var mediaTypes:Vector.<String>;

    /** Whether the content is prepared for streaming.  Should be 0 for not streamable, 1 for streamable.*/
    public var streamable:Boolean;

    /** The total bit rate (audio & video combined) of the media*/
    public var totalBitRate:Number = -1;

    /** The video bit rate*/
    public var videoBitRate:Number = -1;

    /** The audio bit rate*/
    public var audioBitRate:Number = -1;

    /** The delivery type of the item.  Should be 0 for fast start and 1 for RTSP.*/
    public var deliveryType:Number = -1;

    /** Used to indicate company/Organization that created the document.*/
    public var organizations:Vector.<String>;

    /** Used to indicate the role of the document creator*/
    public var role:String;

    /** Used to designate the languages of the intellectual content of the
     * resource. Recommended best practice for the values of the Language
     * element is defined by BCP 47.*/
    public var languages:Vector.<String>;

    /** Used to provide a link to information about rights held in and
     * over the resource. Typically a Rights element will contain a
     * rights management statement for the resource, or reference a
     * service providing such information. Rights information often
     * /encompasses Intellectual Property Rights (IPR), Copyright, and
     * various Property Rights. If the rights element is absent, no
     * assumptions can be made about the status of these and other rights
     * with respect to the resource.*/
    public var rights:String;

    /** Used to designate the entity responsible for making the resource
     * available. Examples of a Publisher include a person, an
     * organization, or a service. Typically, the name of a Publisher
     * should be used to indicate the entity.*/
    public var publishers:Vector.<String>;

    /** Used to designate the entity responsible for making contributions
     * to the content of the resource. Examples of a Contributor include
     * a person, an organization or a service. Typically, the name of a
     * Contributor should be used to indicate the entity.*/
    public var contributors:Vector.<String>;

    /** Used to designate the extent or scope of the content of the
     * resource. Coverage will typically include spatial location
     * (a place name or geographic co-ordinates), temporal period (a period label, date, or date range)
     * or jurisdiction (such as a named administrative entity).
     * Recommended best practice is to select a value from a controlled vocabulary, and that, where appropriate,
     * named places or time periods be used in preference to numeric identifiers such as sets of co-ordinates or date ranges.*/
    public var coverage:Vector.<String>;

    /** User rating of this item out of 5 stars*/
    public var rating:Number = -1;

    /** A description of the rating.  E.g. the number of reviewers.*/
    public var ratingDescription:String;

    /** User play count of this item*/
    public var playCount:Number = -1;

    /** Information about the item*/
    public var information:String;

    /** Director of the item (e.g. movie director)*/
    public var director:String;

    /** Producer of the content*/
    public var producer:String;

    /** Genre of the item (e.g. movie genre)*/
    public var genre:String;

    /** Performers in the movie*/
    public var performers:Vector.<String>;

    /** Original format of the movie*/
    public var originalFormat:String;

    /** Original source of the movie*/
    public var originalSource:String;

    /** Whether or not the item is local.*/
    public var local:Boolean;

    /** Whether or not the item has explicit content.*/
    public var contentRating:Boolean;

    /** URL of the item*/
    public var url:String;

    /************************/
    /******* Message ********/
    /************************/

    /** Unique identifier for the account the item is associated with, if any*/
    public var accountIdentifier:String;

    /** Array of the canonical handles of the account the item is associated with
     * (IM handle, e-mail address, phone number...).
     * E.g. in Mail's case, all the email addresses the account receives email on.*/
    public var accountHandles:Vector.<String>;

    /** Contains the HTML content of the document encoded as an UTF-8 encoded string.*/
    public var htmlContentData:String;

    /** Contains the text content of the document.*/
    public var textContent:String;

    /** An array of Person objects representing the content of the From: field in an email*/
    public var authors:Vector.<Person>;

    /** An array of Person objects representing the content of the To: field in an email*/
    public var primaryRecipients:Vector.<Person>;

    /** An array of Person objects representing the content of the Cc: field in an email */
    public var additionalRecipients:Vector.<Person>;

    /** An array of Person objects representing the content of the Bcc: field in an email */
    public var hiddenAdditionalRecipients:Vector.<Person>;

    /** JSON string with all the headers of the message
     * Keys are header names and values arrays of strings
     * (because a header might be present multiple times in an email)*/
    public var emailHeaders:String;

    /** Array of Mailbox identifiers associated with the item. e.g. 'mailbox.inbox', 'mailbox.drafts', 'mailbox.sent',
     * or a custom identifier etc.*/
    public var mailboxIdentifiers:Vector.<String>;

    /** The list of author/authors that have worked on this item.
     * There could be 0 or more authors of a particular item.
     * The order of the authors in the array is preserved, but is not intended to represent
     * the main author or relative importance of the authors.*/
    public var authorNames:Vector.<String>;

    /** This attribute indicates the recipients of this item.*/
    public var recipientNames:Vector.<String>;

    /** This attribute indicates the author of the emails message addresses.
     * (This is always the email address, and not the human readable version)*/
    public var authorEmailAddresses:Vector.<String>;

    /** This attribute indicates the reciepients email addresses.
     * (This is always the email address,  and not the human readable version).*/
    public var recipientEmailAddresses:Vector.<String>;

    /** This attribute indicates the author addresses of the document.*/
    public var authorAddresses:Vector.<String>;

    /** This attribute indicates the recipient addresses of the document.*/
    public var recipientAddresses:Vector.<String>;

    /** Phone numbers for this item.*/
    public var phoneNumbers:Vector.<String>;

    /** mail addresses for this item.*/
    public var emailAddresses:Vector.<String>;

    /** Instant message addresses for this item.*/
    public var instantMessageAddresses:Vector.<String>;

    /** This attribute indicates if the document is likely to be considered junk.*/
    public var likelyJunk:Boolean;

    /** If supportsPhoneCall is true and the item has the phoneNumbers property, then the phone number may be used to
     * initiate phone calls. This should be used to indicate that using the phone number is appropriate, and a
     * primary action for the user. For example, supportsPhoneCall would be set on a business, but not an academic
     * paper that happens to have phone numbers for the authors or the institution.*/
    public var supportsPhoneCall:Boolean;


    /************************/
    /******** Music *********/
    /************************/

    /** The sample rate of the audio data contained in the file. The sample rate is a
     * float value representing hz (audio_frames/second). For example: 44100.0, 22254.54.*/
    public var audioSampleRate:Number = -1;

    /** The number of channels in the audio data contained in the file. This item only represents
     * the number of discreet channels of audio data found in the file. It does not indicate
     * any configuration of the data in regards to a user's speaker setup.*/
    public var audioChannelCount:Number = -1;

    /** The tempo of the music contained in the audio file in Beats Per Minute.*/
    public var tempo:Number = -1;

    /** The musical key of the song/composition contained in an audio file.
     For example: C, Dm, F#m, Bb.*/
    public var keySignature:String;

    /** The time signature of the musical composition contained in the audio/MIDI file.
     * For example: "4/4", "7/8".*/
    public var timeSignature:String;

    /** The name of the application that encoded the data contained in the audio file.*/
    public var audioEncodingApplication:String;

    /** The composer of the song/composition contained in the audio file.*/
    public var composer:String;

    /** The lyricist/text writer for song/composition contained in the audio file.*/
    public var lyricist:String;

    /** The title for a collection of media. This is analagous to a record album,
     * or photo album whichs are collections of audio or images.*/
    public var album:String;

    /** The artist for the media*/
    public var artist:String;

    /** The track number of a song/composition when it is part of an album*/
    public var audioTrackNumber:Number = -1;

    /** The recording date of the song/composition. This information differs from
     * the contentCreationDate attribute as it indicates the date that the
     * 'art' was created, in contrast to contentCreationDate which for example, could indicate
     * the creation date of an edited or 'mastered' version of the original art.*/
    public var recordingDate:Date;

    /** The musical genre of the song/composition contained in the audio file.
     * For example: Jazz, Pop, Rock, Classical.*/
    public var musicalGenre:String;

    /** This attribute indicates whether the MIDI sequence contained in the file is setup for use with a General
     * MIDI device. */
    public var generalMIDISequence:Boolean;

    /** Meta data attribute that stores the category of
     * instrument. Files should have an instrument associated with
     * them ("Other Instrument" is provided as a catch-all). For some
     * categories, like "Keyboards" there are instrument names which
     * provide a more detailed instrument definition (e.g., Piano,Organ, etc.)*/
    public var musicalInstrumentCategory:String;

    /** Meta data attribute that stores the name of instrument
     * (relative to the instrument category) Files can have an
     * instrument name associated with them if they have certain
     * instrument categories (e.g., the category Percussion has
     * multiple instruments, including Conga and Bongo).*/
    public var musicalInstrumentName:String;

    /************************/
    /******** Place *********/
    /************************/

    /** A publishable entry providing a synopsis of the contents of the item.*/
    public var headline:String;

    /** Other editorial instructions concerning the use of the item, such as embargoes and warnings.*/
    public var instructions:String;

    /** The location (e.g., street name) for the item according to guidelines established by the provider.*/
    public var thoroughfare:String;

    /** The sub-location (e.g., street number) for the item according to guidelines established by the provider.*/
    public var subThoroughfare:String;

    /** The postal code for the item according to guidelines established by the provider.*/
    public var postalCode:String;

    /** Identifies city of item origin according to guidelines established by the provider.*/
    public var city:String;

    /** Identifies Province/State of origin according to guidelines established by the provider.*/
    public var stateOrProvince:String;

    /** Provides full, publishable, name of the country/primary location where the
     * intellectual property of the item was created,according to guidelines of the provider.*/
    public var country:String;

    /**  The fully formatted address of the item (obtained from MapKit)*/
    public var fullyFormattedAddress:String;

    /** The altitude of the item in meters above sea level, expressed
     * using the WGS84 datum.  Negative values lie below sea level.*/
    public var altitude:Number = -1;

    /** The latitude of the item in degrees north of the equator, expressed
     * using the WGS84 datum.  Negative values lie south of the equator.*/
    public var latitude:Number = -1;

    /** The longitude of the item in degrees east of the prime meridian,
     * expressed using the WGS84 datum.  Negative values lie west of the prime meridian.*/
    public var longitude:Number = -1;

    /** The speed of the item, in kilometers per hour.*/
    public var speed:Number = -1;

    /** The timestamp on the item.  This generally is used to indicate the time at
     * which the event captured by the item took place.*/
    public var timestamp:Date;

    /** The direction of the item's image, in degrees from true north.*/
    public var imageDirection:Number = -1;

    /** The name of the location or point of interest associated with the item. The name may be user provided.*/
    public var namedLocation:String;

    /** The direction of travel of the item, in degrees from true north.*/
    public var gpsTrack:Number = -1;
    public var gpsStatus:String;
    public var gpsMeasureMode:String;
    public var gpsdop:Number = -1;
    public var gpsMapDatum:String;
    public var gpsDestLatitude:Number = -1;
    public var gpsDestLongitude:Number = -1;
    public var gpsDestBearing:Number = -1;
    public var gpsDestDistance:Number = -1;
    public var gpsProcessingMethod:String;
    public var gpsAreaInformation:String;
    public var gpsDateStamp:Date;
    public var gpsDifferental:Number = -1;

    /**  If supportsNavigation is set to true, and the item has the latitude and longitude properties set, then
     * the latitude and longitude may be used for navigation. For example, supportsNavigation would be set
     * on a restaurant review, but not on a photo.*/
    public var supportsNavigation:Boolean;

}
}
