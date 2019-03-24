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

public extension FreObjectSwift {
    public subscript(dynamicMember name: String) -> [String]? {
        get { return [String](rawValue?[name]) }
        set { rawValue?[name] = newValue?.toFREObject() }
    }
    public subscript(dynamicMember name: String) -> [Date]? {
        get {
            guard let rv = rawValue?[name] else { return nil }
            var ret = [Date]()
            for v in FREArray(rv) {
                if let dte = Date(v) {
                    ret.append(dte)
                }
            }
            return ret
        }
        set {
            let freArray = FREArray(className: "Date")
            for v in newValue ?? [] {
                freArray?.push(v.toFREObject())
            }
            rawValue?[name] = freArray?.rawValue
        }
    }
}

public extension CSSearchableItemAttributeSet {
    func toFREObject(itemId: String) -> FREObject? {
        guard let fre = FreObjectSwift(className: "com.tuarua.spotlight.SearchableItemAttributeSet",
                                       args: self.contentType) else { return nil }
        fre.itemId = itemId
        if let title = self.title {
            fre.title = title
        }
        if let displayName = self.displayName {
            fre.displayName = displayName
        }
        if let alternateNames = self.alternateNames {
            fre.alternateNames = alternateNames
        }
        if let path = self.path {
            fre.path = path
        }
        if let contentURL = self.contentURL {
            fre.contentURL = contentURL.absoluteString
        }
        if let thumbnailURL = self.thumbnailURL {
           fre.thumbnailURL = thumbnailURL.absoluteString
        }
        if let relatedUniqueIdentifier = self.relatedUniqueIdentifier {
            fre.relatedUniqueIdentifier = relatedUniqueIdentifier
        }
        if let weakRelatedUniqueIdentifier = self.weakRelatedUniqueIdentifier {
            fre.weakRelatedUniqueIdentifier = weakRelatedUniqueIdentifier
        }
        if let domainIdentifier = self.domainIdentifier {
            fre.domainIdentifier = domainIdentifier
        }
        if let metadataModificationDate = self.metadataModificationDate {
            fre.metadataModificationDate = metadataModificationDate
        }
        if let contentType = self.contentType {
            fre.contentType = contentType
        }
        if let contentTypeTree = self.contentTypeTree {
            fre.contentTypeTree = contentTypeTree
        }
        if let keywords = self.keywords {
            fre.keywords = keywords
        }
        if let version = self.version {
            fre.version = version
        }
        if #available(iOS 11.0, *), #available(OSX 10.10, *) {
            if let userCreated = self.userCreated {
                fre.userCreated = userCreated.boolValue
            }
            if let userCurated = self.userCurated {
                fre.userCurated = userCurated.boolValue
            }
            if let rankingHint = self.rankingHint {
                fre.rankingHint = rankingHint
            }
        }
        
        // Music
        if let audioSampleRate = self.audioSampleRate {
            fre.audioSampleRate = audioSampleRate
        }
        if let audioChannelCount = self.audioChannelCount {
            fre.audioChannelCount = audioChannelCount
        }
        if let fileSize = self.fileSize {
            fre.fileSize = fileSize
        }
        if let tempo = self.tempo {
            fre.tempo = tempo
        }
        if let keySignature = self.keySignature {
            fre.keySignature = keySignature
        }
        if let timeSignature = self.timeSignature {
            fre.timeSignature = timeSignature
        }
        if let audioEncodingApplication = self.audioEncodingApplication {
            fre.audioEncodingApplication = audioEncodingApplication
        }
        if let composer = self.composer {
            fre.composer = composer
        }
        if let lyricist = self.lyricist {
            fre.lyricist = lyricist
        }
        if let album = self.album {
            fre.album = album
        }
        if let artist = self.artist {
            fre.artist = artist
        }
        if let audioTrackNumber = self.audioTrackNumber {
            fre.audioTrackNumber = audioTrackNumber
        }
        if let recordingDate = self.recordingDate {
            fre.recordingDate = recordingDate
        }
        if let musicalGenre = self.musicalGenre {
            fre.musicalGenre = musicalGenre
        }
        if let generalMIDISequence = self.generalMIDISequence {
            fre.generalMIDISequence = generalMIDISequence.boolValue
        }
        if let musicalInstrumentCategory = self.musicalInstrumentCategory {
            fre.musicalInstrumentCategory = musicalInstrumentCategory
        }
        if let musicalInstrumentName = self.musicalInstrumentName {
            fre.musicalInstrumentName = musicalInstrumentName
        }
        
        // Document
        if let subject = self.subject {
            fre.subject = subject
        }
        if let theme = self.theme {
            fre.theme = theme
        }
        if let contentDescription = self.contentDescription {
            fre.contentDescription = contentDescription
        }
        if let identifier = self.identifier {
            fre.identifier = identifier
        }
        if let audiences = self.audiences {
            fre.audiences = audiences
        }
        if let fileSize = self.fileSize {
            fre.fileSize = fileSize
        }
        if let pageCount = self.pageCount {
            fre.pageCount = pageCount
        }
        if let pageWidth = self.pageWidth {
            fre.pageWidth = pageWidth
        }
        if let pageHeight = self.pageHeight {
            fre.pageHeight = pageHeight
        }
        if let securityMethod = self.securityMethod {
            fre.securityMethod = securityMethod
        }
        if let creator = self.creator {
            fre.creator = creator
        }
        if let encodingApplications = self.encodingApplications {
            fre.encodingApplications = encodingApplications
        }
        if let kind = self.kind {
            fre.kind = kind
        }
        if let fontNames = self.fontNames {
            fre.fontNames = fontNames
        }
        
        // Event
        if let dueDate = self.dueDate {
            fre.dueDate = dueDate
        }
        if let completionDate = self.completionDate {
            fre.completionDate = completionDate
        }
        if let startDate = self.startDate {
            fre.startDate = startDate
        }
        if let endDate = self.endDate {
            fre.endDate = endDate
        }
        if let importantDates = self.importantDates {
            fre.importantDates = importantDates
        }
        if let allDay = self.allDay {
            fre.allDay = allDay.boolValue
        }
        
        // Media
        if let editors = self.editors {
            fre.editors = editors
        }
        if let participants = self.contentSources {
            fre.participants = participants
        }
        if let projects = self.contentSources {
            fre.projects = projects
        }
        if let downloadedDate = self.downloadedDate {
            fre.downloadedDate = downloadedDate
        }
        if let contentSources = self.contentSources {
            fre.contentSources = contentSources
        }
        if let comment = self.comment {
            fre.comment = comment
        }
        if let copyright = self.copyright {
            fre.copyright = copyright
        }
        if let lastUsedDate = self.lastUsedDate {
            fre.lastUsedDate = lastUsedDate
        }
        if let contentCreationDate = self.contentCreationDate {
            fre.contentCreationDate = contentCreationDate
        }
        if let contentModificationDate = self.contentModificationDate {
            fre.contentModificationDate = contentModificationDate
        }
        if let addedDate = self.addedDate {
            fre.addedDate = addedDate
        }
        if let duration = self.duration {
            fre.duration = duration
        }
        if let contactKeywords = self.contentSources {
            fre.contactKeywords = contactKeywords
        }
        if let codecs = self.contentSources {
            fre.codecs = codecs
        }
        if let mediaTypes = self.contentSources {
            fre.mediaTypes = mediaTypes
        }
        if let streamable = self.streamable {
            fre.streamable = streamable.boolValue
        }
        if let totalBitRate = self.totalBitRate {
            fre.totalBitRate = totalBitRate
        }
        if let videoBitRate = self.videoBitRate {
            fre.videoBitRate = videoBitRate
        }
        if let audioBitRate = self.audioBitRate {
            fre.audioBitRate = audioBitRate
        }
        if let deliveryType = self.deliveryType {
            fre.deliveryType = deliveryType
        }
        if let organizations = self.organizations {
            fre.organizations = organizations
        }
        if let role = self.role {
            fre.role = role
        }
        if let languages = self.languages {
            fre.languages = languages
        }
        if let rights = self.rights {
            fre.rights = rights
        }
        if let publishers = self.publishers {
            fre.publishers = publishers
        }
        if let contributors = self.contributors {
            fre.contributors = contributors
        }
        if let coverage = self.coverage {
            fre.coverage = coverage
        }
        if let rating = self.rating {
            fre.rating = rating
        }
        if let ratingDescription = self.ratingDescription {
            fre.ratingDescription = ratingDescription
        }
        if let playCount = self.playCount {
            fre.playCount = playCount
        }
        if let information = self.information {
            fre.information = information
        }
        if let director = self.director {
            fre.director = director
        }
        if let producer = self.producer {
            fre.producer = producer
        }
        if let genre = self.genre {
            fre.genre = genre
        }
        if let performers = self.performers {
            fre.performers = performers
        }
        if let originalFormat = self.originalFormat {
            fre.originalFormat = originalFormat
        }
        if let originalSource = self.originalSource {
            fre.originalSource = originalSource
        }
        if let local = self.local {
            fre.local = local.boolValue
        }
        if let contentRating = self.contentRating {
            fre.contentRating = contentRating.boolValue
        }
        if let url = self.url {
            fre.url = url.absoluteString
        }
        
        // Image
        if let pixelHeight = self.pixelHeight {
            fre.pixelHeight = pixelHeight
        }
        if let pixelWidth = self.pixelWidth {
            fre.pixelWidth = pixelWidth
        }
        if let pixelCount = self.pixelCount {
            fre.pixelCount = pixelCount
        }
        if let colorSpace = self.colorSpace {
            fre.colorSpace = colorSpace
        }
        if let bitsPerSample = self.bitsPerSample {
            fre.bitsPerSample = bitsPerSample
        }
        if let flashOn = self.flashOn {
            fre.flashOn = flashOn.boolValue
        }
        if let focalLength = self.focalLength {
            fre.focalLength = focalLength
        }
        if let focalLength35mm = self.focalLength35mm {
            fre.focalLength35mm = focalLength35mm
        }
        if let acquisitionMake = self.acquisitionMake {
            fre.acquisitionMake = acquisitionMake
        }
        if let acquisitionModel = self.acquisitionModel {
            fre.acquisitionModel = acquisitionModel
        }
        if let cameraOwner = self.cameraOwner {
            fre.cameraOwner = cameraOwner
        }
        if let lensModel = self.lensModel {
            fre.lensModel = lensModel
        }
        if let isoSpeed = self.isoSpeed {
            fre.isoSpeed = isoSpeed
        }
        if let orientation = self.orientation {
            fre.orientation = orientation
        }
        if let layerNames = self.layerNames {
            fre.layerNames = layerNames
        }
        if let whiteBalance = self.whiteBalance {
            fre.whiteBalance = whiteBalance
        }
        if let aperture = self.aperture {
            fre.aperture = aperture
        }
        if let profileName = self.profileName {
            fre.profileName = profileName
        }
        if let resolutionWidthDPI = self.resolutionWidthDPI {
            fre.resolutionWidthDPI = resolutionWidthDPI
        }
        if let resolutionHeightDPI = self.resolutionHeightDPI {
            fre.resolutionHeightDPI = resolutionHeightDPI
        }
        if let exposureMode = self.exposureMode {
            fre.exposureMode = exposureMode
        }
        if let exposureTime = self.exposureTime {
            fre.exposureTime = exposureTime
        }
        if let exifVersion = self.exifVersion {
            fre.exifVersion = exifVersion
        }
        if let exifgpsVersion = self.exifgpsVersion {
            fre.exifgpsVersion = exifgpsVersion
        }
        if let hasAlphaChannel = self.hasAlphaChannel {
            fre.hasAlphaChannel = hasAlphaChannel.boolValue
        }
        if let redEyeOn = self.redEyeOn {
            fre.redEyeOn = redEyeOn.boolValue
        }
        if let meteringMode = self.meteringMode {
            fre.meteringMode = meteringMode
        }
        if let maxAperture = self.maxAperture {
            fre.maxAperture = maxAperture
        }
        if let fNumber = self.fNumber {
            fre.fNumber = fNumber
        }
        if let exposureProgram = self.exposureProgram {
            fre.exposureProgram = exposureProgram
        }
        if let exposureTimeString = self.exposureTimeString {
            fre.exposureTimeString = exposureTimeString
        }
        
        // Message
        if let accountIdentifier = self.accountIdentifier {
            fre.accountIdentifier = accountIdentifier
        }
        if let accountHandles = self.accountHandles {
            fre.accountHandles = accountHandles
        }
        if let htmlContentData = self.htmlContentData {
            let ba = FreByteArraySwift(data: htmlContentData as NSData)
            fre["htmlContentData"] = ba.rawValue
        }
        if let textContent = self.textContent {
            fre.textContent = textContent
        }
        if let authors = self.authors {
            fre.authors = authors
        }
        if let primaryRecipients = self.primaryRecipients {
            fre.primaryRecipients = primaryRecipients
        }
        if let additionalRecipients = self.additionalRecipients {
            fre.additionalRecipients = additionalRecipients
        }
        if let hiddenAdditionalRecipients = self.hiddenAdditionalRecipients {
            fre.hiddenAdditionalRecipients = hiddenAdditionalRecipients
        }
        if let emailHeaders = self.emailHeaders {
            fre.mailboxIdentifiers = JSON(emailHeaders).description
        }
        if let mailboxIdentifiers = self.mailboxIdentifiers {
            fre.mailboxIdentifiers = mailboxIdentifiers
        }
        if let authorNames = self.authorNames {
            fre.authorNames = authorNames
        }
        if let recipientNames = self.recipientNames {
            fre.recipientNames = recipientNames
        }
        if let authorEmailAddresses = self.authorEmailAddresses {
            fre.authorEmailAddresses = authorEmailAddresses
        }
        if let recipientEmailAddresses = self.recipientEmailAddresses {
            fre.recipientEmailAddresses = recipientEmailAddresses
        }
        if let authorAddresses = self.authorAddresses {
            fre.authorAddresses = authorAddresses
        }
        if let recipientAddresses = self.recipientAddresses {
            fre.recipientAddresses = recipientAddresses
        }
        if let phoneNumbers = self.phoneNumbers {
            fre.phoneNumbers = phoneNumbers
        }
        if let emailAddresses = self.emailAddresses {
            fre.emailAddresses = emailAddresses
        }
        if let instantMessageAddresses = self.instantMessageAddresses {
            fre.instantMessageAddresses = instantMessageAddresses
        }

        fre.likelyJunk = likelyJunk.boolValue
        if let supportsPhoneCall = self.supportsPhoneCall {
            fre.supportsPhoneCall = supportsPhoneCall.boolValue
        }
        
        // Place
        if let headline = self.headline {
            fre.headline = headline
        }
        if let instructions = self.instructions {
            fre.instructions = instructions
        }
        if let thoroughfare = self.thoroughfare {
            fre.thoroughfare = thoroughfare
        }
        if let subThoroughfare = self.subThoroughfare {
            fre.subThoroughfare = subThoroughfare
        }
        if let postalCode = self.postalCode {
            fre.postalCode = postalCode
        }
        if let city = self.city {
            fre.city = city
        }
        if let stateOrProvince = self.stateOrProvince {
            fre.stateOrProvince = stateOrProvince
        }
        if let country = self.country {
            fre.country = country
        }
        if let fullyFormattedAddress = self.fullyFormattedAddress {
            fre.fullyFormattedAddress = fullyFormattedAddress
        }
        if let altitude = self.altitude {
            fre.altitude = altitude
        }
        if let latitude = self.latitude {
            fre.latitude = latitude
        }
        if let longitude = self.longitude {
            fre.longitude = longitude
        }
        if let speed = self.speed {
            fre.speed = speed
        }
        if let timestamp = self.timestamp {
            fre.timestamp = timestamp
        }
        if let imageDirection = self.imageDirection {
            fre.imageDirection = imageDirection
        }
        if let namedLocation = self.namedLocation {
            fre.namedLocation = namedLocation
        }
        if let gpsTrack = self.gpsTrack {
            fre.gpsTrack = gpsTrack
        }
        if let gpsStatus = self.gpsStatus {
            fre.gpsStatus = gpsStatus
        }
        if let gpsMeasureMode = self.gpsMeasureMode {
            fre.gpsMeasureMode = gpsMeasureMode
        }
        if let gpsdop = self.gpsdop {
            fre.gpsdop = gpsdop
        }
        if let gpsMapDatum = self.gpsMapDatum {
            fre.gpsMapDatum = gpsMapDatum
        }
        if let gpsDestLatitude = self.gpsDestLatitude {
            fre.gpsDestLatitude = gpsDestLatitude
        }
        if let gpsDestLongitude = self.gpsDestLongitude {
            fre.gpsDestLongitude = gpsDestLongitude
        }
        if let gpsDestBearing = self.gpsDestBearing {
            fre.gpsDestBearing = gpsDestBearing
        }
        if let gpsDestDistance = self.gpsDestDistance {
            fre.gpsDestDistance = gpsDestDistance
        }
        if let gpsProcessingMethod = self.gpsProcessingMethod {
            fre.gpsProcessingMethod = gpsProcessingMethod
        }
        if let gpsAreaInformation = self.gpsAreaInformation {
            fre.gpsAreaInformation = gpsAreaInformation
        }
        if let gpsDateStamp = self.gpsDateStamp {
            fre.gpsDateStamp = gpsDateStamp
        }
        if let gpsDifferental = self.gpsDifferental {
            fre.gpsDifferental = gpsDifferental
        }
        if let supportsNavigation = self.supportsNavigation {
            fre.supportsNavigation = supportsNavigation.boolValue
        }
        
        return fre.rawValue
    }
    
    convenience init?(_ freObject: FREObject?) {
        guard let rv = freObject,
            let itemContentType = String(rv["itemContentType"]) else { return nil }
        let fre = FreObjectSwift(rv)
        self.init(itemContentType: itemContentType)
        
        if let title: String = fre.title {
            self.title = title
        }
        if let displayName: String = fre.displayName {
            self.displayName = displayName
        }
        if let alternateNames: [String] = fre.alternateNames, alternateNames.count > 0 {
            self.alternateNames = alternateNames
        }
        if let path: String = fre.path {
            self.path = path
        }
        if let contentURL: String = fre.contentURL {
            self.contentURL = URL(safe: contentURL)
        }
        if let thumbnailURL: String = fre.thumbnailURL {
            self.thumbnailURL = URL(safe: thumbnailURL)
        }
        if let relatedUniqueIdentifier: String = fre.relatedUniqueIdentifier {
            self.relatedUniqueIdentifier = relatedUniqueIdentifier
        }
        if let weakRelatedUniqueIdentifier: String = fre.weakRelatedUniqueIdentifier {
            self.weakRelatedUniqueIdentifier = weakRelatedUniqueIdentifier
        }
        if let domainIdentifier: String = fre.domainIdentifier {
            self.domainIdentifier = domainIdentifier
        }
        if let metadataModificationDate: Date = fre.metadataModificationDate {
            self.metadataModificationDate = metadataModificationDate
        }
        if let contentType: String = fre.contentType {
            self.contentType = contentType
        }
        if let contentTypeTree: [String] = fre.contentTypeTree, contentTypeTree.count > 0 {
            self.contentTypeTree = contentTypeTree
        }
        if let keywords: [String] = fre.keywords, keywords.count > 0 {
            self.keywords = keywords
        }
        if let version: String = fre.version {
            self.version = version
        }
        if #available(iOS 11.0, *), #available(OSX 10.10, *) {
            if let userCreated: Bool = fre.userCreated, userCreated {
                self.userCreated = 1
            }
            if let userCurated: Bool = fre.userCurated, userCurated {
                self.userCurated = 1
            }
            if let rankingHint: NSNumber = fre.rankingHint, rankingHint > -1.0 {
                self.rankingHint = rankingHint
            }
        }

        if let audioSampleRate: NSNumber = fre.audioSampleRate, audioSampleRate > -1.0 {
            self.audioSampleRate = audioSampleRate
        }
        if let audioChannelCount: NSNumber = fre.audioChannelCount, audioChannelCount > -1.0 {
            self.audioChannelCount = audioChannelCount
        }
        if let fileSize: NSNumber = fre.fileSize, fileSize > -1.0 {
            self.fileSize = fileSize
        }
        if let tempo: NSNumber = fre.tempo, tempo > -1.0 {
            self.tempo = tempo
        }
        if let keySignature: String = fre.keySignature {
            self.keySignature = keySignature
        }
        if let timeSignature: String = fre.timeSignature {
            self.timeSignature = timeSignature
        }
        if let audioEncodingApplication: String = fre.audioEncodingApplication {
            self.audioEncodingApplication = audioEncodingApplication
        }
        if let composer: String = fre.composer {
            self.composer = composer
        }
        if let lyricist: String = fre.lyricist {
            self.lyricist = lyricist
        }
        if let album: String = fre.album {
            self.album = album
        }
        if let artist: String = fre.artist {
            self.artist = artist
        }
        if let audioTrackNumber: NSNumber = fre.audioTrackNumber, audioTrackNumber > -1.0 {
            self.audioTrackNumber = audioTrackNumber
        }
        if let recordingDate: Date = fre.recordingDate {
            self.recordingDate = recordingDate
        }
        if let musicalGenre: String = fre.musicalGenre {
            self.musicalGenre = musicalGenre
        }
        if let generalMIDISequence: Bool = fre.generalMIDISequence, generalMIDISequence {
            self.generalMIDISequence = 1
        }
        if let musicalInstrumentCategory: String = fre.musicalInstrumentCategory {
            self.musicalInstrumentCategory = musicalInstrumentCategory
        }
        if let musicalInstrumentName: String = fre.musicalInstrumentName {
            self.musicalInstrumentName = musicalInstrumentName
        }

        if let subject: String = fre.subject {
            self.subject = subject
        }
        if let theme: String = fre.theme {
            self.theme = theme
        }
        if let contentDescription: String = fre.contentDescription {
            self.contentDescription = contentDescription
        }
        if let identifier: String = fre.identifier {
            self.identifier = identifier
        }
        if let audiences: [String] = fre.audiences, audiences.count > 0 {
            self.audiences = audiences
        }
        if let fileSize: NSNumber = fre.fileSize, fileSize > -1.0 {
            self.fileSize = fileSize
        }
        if let pageCount: NSNumber = fre.pageCount, pageCount > -1.0 {
            self.pageCount = pageCount
        }
        if let pageWidth: NSNumber = fre.pageWidth, pageWidth > -1.0 {
            self.pageWidth = pageWidth
        }
        if let pageHeight: NSNumber = fre.pageHeight, pageHeight > -1.0 {
            self.pageHeight = pageHeight
        }
        if let securityMethod: String = fre.securityMethod {
            self.securityMethod = securityMethod
        }
        if let creator: String = fre.creator {
            self.creator = creator
        }
        if let encodingApplications: [String] = fre.encodingApplications, encodingApplications.count > 0 {
            self.encodingApplications = encodingApplications
        }
        if let kind: String = fre.kind {
            self.kind = kind
        }
        if let fontNames: [String] = fre.fontNames, fontNames.count > 0 {
            self.fontNames = fontNames
        }

        if let dueDate: Date = fre.dueDate {
            self.dueDate = dueDate
        }
        if let completionDate: Date = fre.completionDate {
            self.completionDate = completionDate
        }
        if let startDate: Date = fre.startDate {
            self.startDate = startDate
        }
        if let endDate: Date = fre.endDate {
            self.endDate = endDate
        }
        if let importantDates: [Date] = fre.importantDates, importantDates.count > 0 {
            self.importantDates = importantDates
        }
        if let allDay: Bool = fre.allDay, allDay {
            self.allDay = 1
        }

        if let editors: [String] = fre.editors {
            self.editors = editors
        }
        if let participants: [String] = fre.contentSources, participants.count > 0 {
            self.participants = participants
        }
        if let projects: [String] = fre.contentSources, projects.count > 0 {
            self.projects = projects
        }
        if let downloadedDate: Date = fre.downloadedDate {
            self.downloadedDate = downloadedDate
        }
        if let contentSources: [String] = fre.contentSources, contentSources.count > 0 {
            self.contentSources = contentSources
        }
        if let comment: String = fre.comment {
            self.comment = comment
        }
        if let copyright: String = fre.copyright {
            self.copyright = copyright
        }
        if let lastUsedDate: Date = fre.lastUsedDate {
            self.lastUsedDate = lastUsedDate
        }
        if let contentCreationDate: Date = fre.contentCreationDate {
            self.contentCreationDate = contentCreationDate
        }
        if let contentModificationDate: Date = fre.contentModificationDate {
            self.contentModificationDate = contentModificationDate
        }
        if let addedDate: Date = fre.addedDate {
            self.addedDate = addedDate
        }
        if let duration: NSNumber = fre.duration, duration > -1.0 {
            self.duration = duration
        }
        if let contactKeywords: [String] = fre.contentSources, contactKeywords.count > 0 {
            self.contactKeywords = contactKeywords
        }
        if let codecs: [String] = fre.contentSources, codecs.count > 0 {
            self.codecs = codecs
        }
        if let mediaTypes: [String] = fre.contentSources, mediaTypes.count > 0 {
            self.mediaTypes = mediaTypes
        }
        if let streamable: Bool = fre.streamable, streamable {
            self.streamable = 1
        }
        if let totalBitRate: NSNumber = fre.totalBitRate, totalBitRate > -1.0 {
            self.totalBitRate = totalBitRate
        }
        if let videoBitRate: NSNumber = fre.videoBitRate, videoBitRate > -1.0 {
            self.videoBitRate = videoBitRate
        }
        if let audioBitRate: NSNumber = fre.audioBitRate, audioBitRate > -1.0 {
            self.audioBitRate = audioBitRate
        }
        if let deliveryType: NSNumber = fre.deliveryType, deliveryType > -1.0 {
            self.deliveryType = deliveryType
        }
        if let organizations: [String] = fre.organizations, organizations.count > 0 {
            self.organizations = organizations
        }
        if let role: String = fre.role {
            self.role = role
        }
        if let languages: [String] = fre.languages, languages.count > 0 {
            self.languages = languages
        }
        if let rights: String = fre.rights {
            self.rights = rights
        }
        if let publishers: [String] = fre.publishers, publishers.count > 0 {
            self.publishers = publishers
        }
        if let contributors: [String] = fre.contributors, contributors.count > 0 {
            self.contributors = contributors
        }
        if let coverage: [String] = fre.coverage, coverage.count > 0 {
            self.coverage = coverage
        }
        if let rating: NSNumber = fre.rating, rating > -1.0 {
            self.rating = rating
        }
        if let ratingDescription: String = fre.ratingDescription {
            self.ratingDescription = ratingDescription
        }
        if let playCount: NSNumber = fre.playCount, playCount > -1.0 {
            self.playCount = playCount
        }
        if let information: String = fre.information {
            self.information = information
        }
        if let director: String = fre.director {
            self.director = director
        }
        if let producer: String = fre.producer {
            self.producer = producer
        }
        if let genre: String = fre.genre {
            self.genre = genre
        }
        if let performers: [String] = fre.performers, performers.count > 0 {
            self.performers = performers
        }
        if let originalFormat: String = fre.originalFormat {
            self.originalFormat = originalFormat
        }
        if let originalSource: String = fre.originalSource {
            self.originalSource = originalSource
        }
        if let local: Bool = fre.local, local {
            self.local = 1
        }
        if let contentRating: Bool = fre.contentRating, contentRating {
            self.contentRating = 1
        }
        if let url: String = fre.url {
            self.url = URL(safe: url)
        }

        if let pixelHeight: NSNumber = fre.pixelHeight, pixelHeight > -1.0 {
            self.pixelHeight = pixelHeight
        }
        if let pixelWidth: NSNumber = fre.pixelWidth, pixelWidth > -1.0 {
            self.pixelWidth = pixelWidth
        }
        if let pixelCount: NSNumber = fre.pixelCount, pixelCount > -1.0 {
            self.pixelCount = pixelCount
        }
        if let colorSpace: String = fre.colorSpace {
            self.colorSpace = colorSpace
        }
        if let bitsPerSample: NSNumber = fre.bitsPerSample, bitsPerSample > -1.0 {
            self.bitsPerSample = bitsPerSample
        }
        if let flashOn: Bool = fre.flashOn, flashOn {
            self.flashOn = 1
        }
        if let focalLength: NSNumber = fre.focalLength, focalLength > -1.0 {
            self.focalLength = focalLength
        }
        if let focalLength35mm: NSNumber = fre.focalLength35mm, focalLength35mm > -1.0 {
            self.focalLength35mm = focalLength35mm
        }
        if let acquisitionMake: String = fre.acquisitionMake {
            self.acquisitionMake = acquisitionMake
        }
        if let acquisitionModel: String = fre.acquisitionModel {
            self.acquisitionModel = acquisitionModel
        }
        if let cameraOwner: String = fre.cameraOwner {
            self.cameraOwner = cameraOwner
        }
        if let lensModel: String = fre.lensModel {
            self.lensModel = lensModel
        }
        if let isoSpeed: NSNumber = fre.isoSpeed, isoSpeed > -1.0 {
            self.isoSpeed = isoSpeed
        }
        if let orientation: NSNumber = fre.orientation, orientation > -1.0 {
            self.orientation = orientation
        }
        if let layerNames: [String] = fre.layerNames, layerNames.count > 0 {
            self.layerNames = layerNames
        }
        if let whiteBalance: NSNumber = fre.whiteBalance, whiteBalance > -1.0 {
            self.whiteBalance = whiteBalance
        }
        if let aperture: NSNumber = fre.aperture, aperture > -1.0 {
            self.aperture = aperture
        }
        if let profileName: String = fre.profileName {
            self.profileName = profileName
        }
        if let resolutionWidthDPI: NSNumber = fre.resolutionWidthDPI, resolutionWidthDPI > -1.0 {
            self.resolutionWidthDPI = resolutionWidthDPI
        }
        if let resolutionHeightDPI: NSNumber = fre.resolutionHeightDPI, resolutionHeightDPI > -1.0 {
            self.resolutionHeightDPI = resolutionHeightDPI
        }
        if let exposureMode: NSNumber = fre.exposureMode, exposureMode > -1.0 {
            self.exposureMode = exposureMode
        }
        if let exposureTime: NSNumber = fre.exposureTime, exposureTime > -1.0 {
            self.exposureTime = exposureTime
        }
        if let exifVersion: String = fre.exifVersion {
            self.exifVersion = exifVersion
        }
        if let exifgpsVersion: String = fre.exifgpsVersion {
            self.exifgpsVersion = exifgpsVersion
        }
        if let hasAlphaChannel: Bool = fre.hasAlphaChannel, hasAlphaChannel {
            self.hasAlphaChannel = 1
        }
        if let redEyeOn: Bool = fre.redEyeOn, redEyeOn {
            self.redEyeOn = 1
        }
        if let meteringMode: String = fre.meteringMode {
            self.meteringMode = meteringMode
        }
        if let maxAperture: NSNumber = fre.maxAperture, maxAperture > -1.0 {
            self.maxAperture = maxAperture
        }
        if let fNumber: NSNumber = fre.fNumber, fNumber > -1.0 {
            self.fNumber = fNumber
        }
        if let exposureProgram: String = fre.exposureProgram {
            self.exposureProgram = exposureProgram
        }
        if let exposureTimeString: String = fre.exposureTimeString {
            self.exposureTimeString = exposureTimeString
        }

        if let accountIdentifier: String = fre.accountIdentifier {
            self.accountIdentifier = accountIdentifier
        }
        if let accountHandles: [String] = fre.accountHandles, accountHandles.count > 0 {
            self.accountHandles = accountHandles
        }
        if let freHtmlContentData = rv["htmlContentData"] {
            let ba = FreByteArraySwift.init(freByteArray: freHtmlContentData)
            if let data = ba.value as Data? {
                self.htmlContentData = data
            }
        }
        if let textContent: String = fre.textContent {
            self.textContent = textContent
        }
        if let authors: [CSPerson] = fre.authors {
            self.authors = authors
        }
        if let primaryRecipients: [CSPerson] = fre.primaryRecipients {
            self.primaryRecipients = primaryRecipients
        }
        if let additionalRecipients: [CSPerson] = fre.additionalRecipients {
            self.additionalRecipients = additionalRecipients
        }
        if let hiddenAdditionalRecipients: [CSPerson] = fre.hiddenAdditionalRecipients {
            self.hiddenAdditionalRecipients = hiddenAdditionalRecipients
        }
        
        if let emailHeaders: String = fre.emailHeaders {
            let d = JSON(parseJSON: emailHeaders)
            let f = [String: [String]]()
            if let dictionaryObject = d.dictionaryObject {
                for header in dictionaryObject {
                    if let v = header.value as? String {
                        let split = v.split(separator: ",")
                        var arr = [String]()
                        for e in split {
                            arr.append(String(e))
                        }
                    }
                }
                self.emailHeaders = f
            }
        }
        
        if let mailboxIdentifiers: [String] = fre.mailboxIdentifiers, mailboxIdentifiers.count > 0 {
            self.mailboxIdentifiers = mailboxIdentifiers
        }
        if let authorNames: [String] = fre.authorNames, authorNames.count > 0 {
            self.authorNames = authorNames
        }
        if let recipientNames: [String] = fre.recipientNames, recipientNames.count > 0 {
            self.recipientNames = recipientNames
        }
        if let authorEmailAddresses: [String] = fre.authorEmailAddresses, authorEmailAddresses.count > 0 {
            self.authorEmailAddresses = authorEmailAddresses
        }
        if let recipientEmailAddresses: [String] = fre.recipientEmailAddresses, recipientEmailAddresses.count > 0 {
            self.recipientEmailAddresses = recipientEmailAddresses
        }
        if let authorAddresses: [String] = fre.authorAddresses, authorAddresses.count > 0 {
            self.authorAddresses = authorAddresses
        }
        if let recipientAddresses: [String] = fre.recipientAddresses, recipientAddresses.count > 0 {
            self.recipientAddresses = recipientAddresses
        }
        if let phoneNumbers: [String] = fre.phoneNumbers, phoneNumbers.count > 0 {
            self.phoneNumbers = phoneNumbers
        }
        if let emailAddresses: [String] = fre.emailAddresses, emailAddresses.count > 0 {
            self.emailAddresses = emailAddresses
        }
        if let instantMessageAddresses: [String] = fre.instantMessageAddresses, instantMessageAddresses.count > 0 {
            self.instantMessageAddresses = instantMessageAddresses
        }
        if let likelyJunk: Bool = fre.likelyJunk, likelyJunk {
            self.likelyJunk = 1
        }
        if let supportsPhoneCall: Bool = fre.supportsPhoneCall, supportsPhoneCall {
            self.supportsPhoneCall = 1
        }

        if let headline: String = fre.headline {
            self.headline = headline
        }
        if let instructions: String = fre.instructions {
            self.instructions = instructions
        }
        if let thoroughfare: String = fre.thoroughfare {
            self.thoroughfare = thoroughfare
        }
        if let subThoroughfare: String = fre.subThoroughfare {
            self.subThoroughfare = subThoroughfare
        }
        if let postalCode: String = fre.postalCode {
            self.postalCode = postalCode
        }
        if let city: String = fre.city {
            self.city = city
        }
        if let stateOrProvince: String = fre.stateOrProvince {
            self.stateOrProvince = stateOrProvince
        }
        if let country: String = fre.country {
            self.country = country
        }
        if let fullyFormattedAddress: String = fre.fullyFormattedAddress {
            self.fullyFormattedAddress = fullyFormattedAddress
        }
        if let altitude: NSNumber = fre.altitude, altitude > -1.0 {
            self.altitude = altitude
        }
        if let latitude: NSNumber = fre.latitude, latitude > -1.0 {
            self.latitude = latitude
        }
        if let longitude: NSNumber = fre.longitude, longitude > -1.0 {
            self.longitude = longitude
        }
        if let speed: NSNumber = fre.speed, speed > -1.0 {
            self.speed = speed
        }
        if let timestamp: Date = fre.timestamp {
            self.timestamp = timestamp
        }
        if let imageDirection: NSNumber = fre.imageDirection, imageDirection > -1.0 {
            self.imageDirection = imageDirection
        }
        if let namedLocation: String = fre.namedLocation {
            self.namedLocation = namedLocation
        }
        if let gpsTrack: NSNumber = fre.gpsTrack, gpsTrack > -1.0 {
            self.gpsTrack = gpsTrack
        }
        if let gpsStatus: String = fre.gpsStatus {
            self.gpsStatus = gpsStatus
        }
        if let gpsMeasureMode: String = fre.gpsMeasureMode {
            self.gpsMeasureMode = gpsMeasureMode
        }
        if let gpsdop: NSNumber = fre.gpsdop, gpsdop > -1.0 {
            self.gpsdop = gpsdop
        }
        if let gpsMapDatum: String = fre.gpsMapDatum {
            self.gpsMapDatum = gpsMapDatum
        }
        if let gpsDestLatitude: NSNumber = fre.gpsDestLatitude, gpsDestLatitude > -1.0 {
            self.gpsDestLatitude = gpsDestLatitude
        }
        if let gpsDestLongitude: NSNumber = fre.gpsDestLongitude, gpsDestLongitude > -1.0 {
            self.gpsDestLongitude = gpsDestLongitude
        }
        if let gpsDestBearing: NSNumber = fre.gpsDestBearing, gpsDestBearing > -1.0 {
            self.gpsDestBearing = gpsDestBearing
        }
        if let gpsDestDistance: NSNumber = fre.gpsDestDistance, gpsDestDistance > -1.0 {
            self.gpsDestDistance = gpsDestDistance
        }
        if let gpsProcessingMethod: String = fre.gpsProcessingMethod {
            self.gpsProcessingMethod = gpsProcessingMethod
        }
        if let gpsAreaInformation: String = fre.gpsAreaInformation {
            self.gpsAreaInformation = gpsAreaInformation
        }
        if let gpsDateStamp: Date = fre.gpsDateStamp {
            self.gpsDateStamp = gpsDateStamp
        }
        if let gpsDifferental: NSNumber = fre.gpsDifferental, gpsDifferental > -1.0 {
            self.gpsDifferental = gpsDifferental
        }
        if let supportsNavigation: Bool = fre.supportsNavigation, supportsNavigation {
            self.supportsNavigation = 1
        }
    }
}
