package {
import com.tuarua.FreSwift;
import com.tuarua.SpotlightANE;
import com.tuarua.spotlight.ContentType;
import com.tuarua.spotlight.IndexError;
import com.tuarua.spotlight.SearchableIndex;
import com.tuarua.spotlight.SearchableItem;
import com.tuarua.spotlight.SearchableItemAttributeSet;

import flash.desktop.NativeApplication;
import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.Event;
import flash.events.MouseEvent;
import flash.text.AntiAliasType;
import flash.text.Font;
import flash.text.TextField;
import flash.text.TextFormat;
import flash.utils.Dictionary;

import views.SimpleButton;

[SWF(width="800", height="600", frameRate="60", backgroundColor="#FFFFFF")]
public class Main extends Sprite {
    // https://stackoverflow.com/questions/47392032/unknown-error-when-adding-an-cssearchableitem-to-core-spotlight-macos
    private var freSwiftANE:FreSwift = new FreSwift(); //must create before all others
    public static const FONT:Font = new FiraSansSemiBold();

    private var statusLabel:TextField;
    private var index:SearchableIndex;

    public function Main() {

        super();

        stage.align = StageAlign.TOP_LEFT;
        stage.scaleMode = StageScaleMode.NO_SCALE;

        start();

        
        NativeApplication.nativeApplication.executeInBackground = true;
        NativeApplication.nativeApplication.addEventListener(Event.EXITING, onExiting);

    }

    private function start():void {
        var tf:TextFormat = new TextFormat(Main.FONT.fontName, 13, 0x222222);
        tf.align = "center";
        tf.bold = false;

        var indexBtn:SimpleButton = new SimpleButton("Index Items");
        indexBtn.addEventListener(MouseEvent.CLICK, onIndexTouch);
        indexBtn.x = (stage.stageWidth - indexBtn.width) / 2;
        indexBtn.y = 80;

        var deleteBtn:SimpleButton = new SimpleButton("Delete Items");
        deleteBtn.addEventListener(MouseEvent.CLICK, onDeleteTouch);
        deleteBtn.x = (stage.stageWidth - deleteBtn.width) / 2;
        deleteBtn.y = 160;

        statusLabel = new TextField();
        statusLabel.wordWrap = statusLabel.multiline = false;
        statusLabel.embedFonts = true;
        statusLabel.antiAliasType = AntiAliasType.ADVANCED;
        statusLabel.sharpness = -100;
        statusLabel.defaultTextFormat = tf;
        statusLabel.selectable = false;
        statusLabel.width = stage.stageWidth;
        statusLabel.y = deleteBtn.y + 75;

        if (SearchableIndex.isIndexingAvailable) {
            addChild(indexBtn);
            addChild(deleteBtn);

            var spotlightId:String = SearchableIndex.spotlightId;
            if (spotlightId) {
                statusLabel.text = SearchableIndex.spotlightId;
            }

            index = new SearchableIndex();

        } else {
            statusLabel.text = "Spotlight is only supported on Mac OSX 10.11+ and iOS 9.0+";
        }


        addChild(statusLabel);
    }

    private function onDeleteTouch(event:MouseEvent):void {
            index.deleteSearchableItems(null, new <String>["com.tuarua.SpotlightExample"], function (error:IndexError):void {
                if (error) {
                    statusLabel.text = "Error: " + error.errorID + " : " + error.message;
                    return;
                }
                statusLabel.text = "Index Delete complete";
            });
    }

    private function onIndexTouch(event:MouseEvent):void {
        var attributeSet:SearchableItemAttributeSet = new SearchableItemAttributeSet(ContentType.text);
        attributeSet.title = "My First Spotlight Search";
        attributeSet.contentDescription = "This is a starry document";
        attributeSet.keywords = new <String>["example", "beer"];
        var item:SearchableItem = new SearchableItem("starlightDoc", "com.tuarua.SpotlightExample", attributeSet);
        var items:Vector.<SearchableItem> = new <SearchableItem>[item];

        index.indexSearchableItems(items, function (error:IndexError):void {
            if (error) {
                statusLabel.text = "Error: " + error.errorID + " : " + error.message;
                return;
            }
            statusLabel.text = "Index complete";
        });
    }

    private function onExiting(event:Event):void {
        SpotlightANE.dispose();
        freSwiftANE.dispose();
    }

}
}
