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
public final class ContentType {
    public static const text:String = "kUTTypeText";
    /** The generic abstract type identifier for most things (files, directories).*/
    public static const item:String = "kUTTypeItem";
    /** The abstract type identifier for anything containing user-viewable document content (documents, pasteboard data, and document packages).*/
    public static const content:String = "kUTTypeContent";
    /** The type identifier for Mac apps.*/
    public static const application:String = "kUTTypeApplication";
    /** The abstract type identifier for messages (email, instant message, etc.).*/
    public static const message:String = "kUTTypeMessage";
    /** The abstract type identifier for contact information( for example, a person, group, or organization).*/
    public static const contact:String = "kUTTypeContact";
    /** The abstract type identifier for an archive of files and directories.*/
    public static const archive:String = "kUTTypeArchive";
    /** The abstract type identifier for image data.*/
    public static const image:String = "kUTTypeImage";
    /** An abstract type identifier for audio and/or video content.*/
    public static const audiovisualContent:String = "kUTTypeAudiovisualContent";
    /** An abstract type identifier for pure video data(no audio).*/
    public static const video:String = "kUTTypeVideo";
    /** An abstract type identifier for pure audio data (no video).*/
    public static const audio:String = "kUTTypeAudio";
}
}