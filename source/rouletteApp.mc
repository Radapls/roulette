import Toybox.Application;
import Toybox.Lang;
import Toybox.WatchUi;

class rouletteApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state as Dictionary?) as Void {
    }

    // onStop() is called when your application is exiting
    function onStop(state as Dictionary?) as Void {
    }

    // Return the initial view of your application here
    function getInitialView() as [Views] or [Views, InputDelegates] {
        return [ new rouletteView(), new rouletteDelegate() ];
    }

}

function getApp() as rouletteApp {
    return Application.getApp() as rouletteApp;
}