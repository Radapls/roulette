import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;


var position=3;

class rouletteDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

   function onKey(key) {
    if (key.getKey() == 8 && position <5) {
        position++;
        System.println(position);
        WatchUi.requestUpdate();
        return true;
    }

        if (key.getKey() == 13 && position >1) {
        position--;
        System.println(position);
        WatchUi.requestUpdate();
        return true;
    }

    return true;

   }
}