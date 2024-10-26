import Toybox.Graphics;
import Toybox.WatchUi;

var _topkey;
var _leftcorner;
var _leftwing;
var _rightwing;
var _rightcorner;
var _background;

class rouletteView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
        _topkey = findDrawableById ("topkey");
        _leftcorner = findDrawableById ("leftcorner");
        _leftwing = findDrawableById ("leftwing");
        _rightwing = findDrawableById ("rightwing");
        _rightcorner = findDrawableById ("rightcorner");
        _background = findDrawableById ("roulette");
    }

    // Called when this View is brought to the foreground. Restore
    // the state of this View and prepare it to be shown. This includes
    // loading resources into memory.
    function onShow() as Void {
    }

    // Update the view
    function onUpdate(dc as Dc) as Void {
        // Call the parent onUpdate function to redraw the layout
        View.onUpdate(dc);
        dc.clear ();
        _background.draw (dc);
        if (position == 1) { _leftcorner.draw (dc);}
        if (position == 2) { _leftwing.draw (dc);}
        if (position == 3) { _topkey.draw (dc);}
        if (position == 4) { _rightwing.draw (dc);}
        if (position == 5) { _rightcorner.draw (dc);}
    }

    // Called when this View is removed from the screen. Save the
    // state of this View here. This includes freeing resources from
    // memory.
    function onHide() as Void {
    }

}
