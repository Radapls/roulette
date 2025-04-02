import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;
import Toybox.Timer;
import Toybox.Math;

class RouletteDelegate extends WatchUi.BehaviorDelegate {
    var view;
    var randomIndex = 3;
    var timer;
    var animationDuration = 2000;
    var isAnimating = false;
    var elapsedTime = 0;
    var interval = 100;

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
            startRouletteSpin();
            return true;
        }

        return false;
    }

    function startRouletteSpin() {
        isAnimating = true;
        elapsedTime = 0;

       timer.start(method(:spinRoulette), interval, true);
    }

    function spinRoulette() {
        if (elapsedTime >= animationDuration) {
            timer.stop();
            isAnimating = false;

            randomIndex = Math.rand() % 15;
            view.setSelectedIndex(randomIndex);

            WatchUi.requestUpdate();
            return;
        }

        randomIndex = Math.rand() % 15;
        view.setSelectedIndex(randomIndex);

        WatchUi.requestUpdate();
        elapsedTime += interval;
    }
}
