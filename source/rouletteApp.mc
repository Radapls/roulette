import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class RouletteApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state as Dictionary?) as Void {}

    function onStop(state as Dictionary?) as Void {}

    function getInitialView() as [Views] or [Views, InputDelegates] {
        var view = new RouletteView();
        var delegate = new RouletteDelegate(view);
        return [view, delegate];
    }
}

function getApp() as RouletteApp {
    return Application.getApp() as RouletteApp;
}