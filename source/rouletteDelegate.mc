using Toybox.Lang;
using Toybox.WatchUi;
using Toybox.System;
using Toybox.Timer;
using Toybox.Math;

class RouletteDelegate extends WatchUi.BehaviorDelegate {

    function initialize(v as RouletteView) {
        BehaviorDelegate.initialize();
        view = v;
        timer = new Timer.Timer();
    }

    function onKey(key) {
        if (isAnimating) {
            return false;
        }

        if (key.getKey() == 4) {
            WatchUi.pushView( new Rez.Menus.RouletteMenu(), new RouletteMenuDelegate(), WatchUi.SLIDE_RIGHT);
            return true;
        }

        return false;
    }

}
