import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Math;
import Toybox.System;
import Toybox.Application;

var x_center = 226.5;
var y_center = 226.5;
var radius = 200;

var rouletteNumbers = [
                "0K", "2K", "5K", "8K", "10K", "15K", "18K", "21K",
               "25K", "28K", "30K", "32K", "35K", "38K", "42K"];

var selectedIndex = null;

class RouletteView extends WatchUi.View {

        function initialize() {
        View.initialize();
    }

    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function setSelectedIndex(index) {
        selectedIndex = index;
        requestUpdate();
    }

    function getPositionAngle(pos) {
        return (pos * 360.0 / 15.0) - 90;
    }

    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_PURPLE, Graphics.COLOR_PURPLE);
        dc.clear();

        for (var i = 0; i < rouletteNumbers.size(); i++) {
            var angle = getPositionAngle(i);
            var rad = angle * Math.PI / 180;

            var x = x_center + radius * Math.cos(rad);
            var y = y_center + radius * Math.sin(rad);

            if (i == selectedIndex) {
                dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
            } else {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            }

            dc.drawText(x, y, Graphics.FONT_SYSTEM_XTINY, rouletteNumbers[i], Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER);
        }
    }
}