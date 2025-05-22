using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.Math;
using Toybox.System;
using Toybox.Application;
using Toybox.Lang;


public var rouletteNumbers = [];
public var selectedIndex = null;
public var itemSize as Lang.Number = 0;
public var winText;


class RouletteRunnerView extends WatchUi.View {
    function initialize() {
        View.initialize();
    }

    function onShow() {
    var app = Application.getApp();
    rouletteNumbers = app.getSelectedRouletteData();

        if (rouletteNumbers == null || rouletteNumbers.size() == 0) {
            // Fallback to default if nothing selected
            rouletteNumbers = Application.loadResource(Rez.JsonData.fiveKm);
        }

        itemSize = rouletteNumbers.size();

        winText = WatchUi.loadResource(Rez.Strings.WinTextLabel);
    }

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
                (rouletteNumbers[i] as Lang.String),
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

    function updateDistanceData() {
        var app = Application.getApp();
        rouletteNumbers = app.getSelectedRouletteData();

        if (rouletteNumbers == null || rouletteNumbers.size() == 0) {
            rouletteNumbers = Application.loadResource(Rez.JsonData.fiveKm);
        }

        itemSize = rouletteNumbers.size();
        selectedIndex = null;

        requestUpdate();
    }

}