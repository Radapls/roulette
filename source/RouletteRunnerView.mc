using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Math;
using Toybox.System;
using Toybox.Application;


public var rouletteNumbers = ["0K", "2K", "5K", "8K", "10K", "15K", "18K", "21K","25K", "28K", "30K", "32K", "35K", "38K", "42K"];
public var selectedIndex = null;
public var itemSize = rouletteNumbers.size();
public var winText = WatchUi.loadResource( Rez.Strings.WinTextLabel );

class RouletteRunnerView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onShow() {	}

    function onLayout(dc) {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    function setSelectedIndex(index) {
        selectedIndex = index;
        requestUpdate();
    }

    function getPositionAngle(pos) {
        return (pos * 360.0 / itemSize) - 90;
    }

    function onUpdate(dc) {
        View.onUpdate(dc);
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_BLACK);
        dc.clear();

            var centerX = dc.getWidth() / 2;
            var centerY = dc.getHeight() / 2;

        for (var i = 0; i < itemSize; i++) {
            var angle = getPositionAngle(i);
            var rad = angle * Math.PI / 180;


            var radius = 190;

            var x = centerX + radius * Math.cos(rad);
            var y = centerY + radius * Math.sin(rad);

            if (i == selectedIndex) {
                dc.setColor(Graphics.COLOR_YELLOW, Graphics.COLOR_TRANSPARENT);
            }
            else
            {
                dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
            }

            dc.drawText(
                x,
                y,
                Graphics.FONT_SYSTEM_XTINY,
                rouletteNumbers[i],
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }

        if (!animationFinished && selectedIndex != null) {
            dc.drawText(
                centerX,
                centerY,
                Graphics.FONT_SYSTEM_XTINY,
                winText + rouletteNumbers[selectedIndex],
                Graphics.TEXT_JUSTIFY_CENTER | Graphics.TEXT_JUSTIFY_VCENTER
            );
        }

    }
}