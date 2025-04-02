using Toybox.Attention;
using Toybox.System;
using Toybox.WatchUi;

    public var view;
    public var randomIndex = 3;
    public var timer;
    public var animationDuration = 2000;
    public var isAnimating = false;
    public var animationFinished = false;
    public var elapsedTime = 0;
    public var interval = 100;

class RouletteMenuDelegate extends WatchUi.MenuInputDelegate {
	function initialize() {
		MenuInputDelegate.initialize();
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
			animationFinished = false;

            randomIndex = Math.rand() % itemSize;
            view.setSelectedIndex(randomIndex);

            WatchUi.requestUpdate();
            return;
        }

        randomIndex = Math.rand() % itemSize;
        view.setSelectedIndex(randomIndex);

		animationFinished = true;
        WatchUi.requestUpdate();
        elapsedTime += interval;
    }

	function onMenuItem( item ) {
		if ( item == :spin ) {
			startRouletteSpin();
		} else if ( item == :exit ) {
			System.exit();
		}
	}
}