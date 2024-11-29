import Toybox.Lang;
import Toybox.WatchUi;
import Toybox.System;


var randomIndex=3;

class rouletteDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onKey(key) {
        System.println(key.getKey());

        // When the user presses a button (e.g., key 4), increment randomIndex
        if (key.getKey() == 4) {
            // If randomIndex is less than 36 (the last valid index), increment it
            if (randomIndex < 36) {
                randomIndex++;
            } else {
                // Wrap around back to 0 if randomIndex exceeds the array bounds (36)
                randomIndex = 0;
            }
            WatchUi.requestUpdate();
            return true;
        }

        // When the user presses another button (e.g., key 13), decrement randomIndex
        if (key.getKey() == 13) {
            // If randomIndex is greater than 0, decrement it
            if (randomIndex > 0) {
                randomIndex--;
            } else {
                // Wrap around to 36 if randomIndex goes below 0
                randomIndex = 36;
            }
            WatchUi.requestUpdate();
            return true;
        }

        return false; // Pass unhandled keys to the system
    }
}