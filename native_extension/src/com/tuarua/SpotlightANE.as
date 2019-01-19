package com.tuarua {
public class SpotlightANE {
    public function SpotlightANE() {
    }
    /** Disposes the ANE */
    public static function dispose():void {
        if (SpotlightANEContext.context != null) SpotlightANEContext.dispose();
    }
}
}
