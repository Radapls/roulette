using Toybox.Application;
using Toybox.Lang;
using Toybox.WatchUi;
using Toybox.Timer;


class RouletteRunnerApp extends Application.AppBase {
    private var _selectedRouletteData = null;

    function initialize() {
        AppBase.initialize();
    }

    function getSelectedRouletteData() {
        if (_selectedRouletteData == null) {
            _selectedRouletteData = Application.loadResource(Rez.JsonData.fiveKm);
        }
        return _selectedRouletteData;
    }

    function setSelectedRouletteData(data) {
        _selectedRouletteData = data;
    }

    function getInitialView() {
        var view = new RouletteRunnerView();
        var delegate = new RouletteRunnerDelegate(view);
        return [view, delegate];
    }
}