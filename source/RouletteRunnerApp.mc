using Toybox.Application;
using Toybox.Lang;
using Toybox.WatchUi;
using Toybox.Timer;


class RouletteRunnerApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    function onStart(state) { }

    function onStop(state) { }

    function getInitialView() {
        var view = new RouletteRunnerView();
        var delegate = new RouletteRunnerDelegate(view);
        return [view, delegate];
    }
}