using Toybox.Application;
using Toybox.Lang;
using Toybox.WatchUi;
using Toybox.Timer;


class RouletteApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) { }

    function onStop(state) { }

    function getInitialView() {
        var view = new RouletteView();
        var delegate = new RouletteDelegate(view);
        return [view, delegate];
    }
}