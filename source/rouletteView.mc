import Toybox.Graphics;
import Toybox.WatchUi;
import Toybox.Math;


var x_center = 230; // Adjust to match your watch display
var y_center = 227; // Adjust to match your watch display
var radius = 205;   // Adjust to control distance of numbers from center

class rouletteView extends WatchUi.View {

    function initialize() {
        View.initialize();
    }

    // Layout setup for the view
    function onLayout(dc as Dc) as Void {
        setLayout(Rez.Layouts.MainLayout(dc));
    }

    // Called when this View is brought to the foreground
    function onShow() as Void {
        // Add any setup code here if needed
    }

    // Calculate the angle for each number around the circle
    function getPositionAngle(pos) {
        return (pos * 360.0 / 37.0) - 90; // Subtracting 90 to start from the top
    }

    function onUpdate(dc as Dc) as Void {
        View.onUpdate(dc);
        dc.clear();

        // Set text color to white and fully opaque
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);

        // Define the list of numbers
        var numbers = ["0", "32", "15", "19", "4", "21", "2", "25", "17", "34", "6",
                    "27", "13", "36", "11", "30", "8", "23", "10", "5", "24",
                    "16", "33", "1", "20", "14", "31", "9", "22", "18", "29",
                    "7", "28", "12", "35", "3", "26"];

        // Select a random index from the numbers array

        // Get the number at the randomly selected index
        var number = numbers[randomIndex];

        // Calculate the angle for the randomly selected number
        var angle = getPositionAngle(randomIndex);
        var rad = angle * Math.PI / 180; // Convert to radians

        // Calculate the position of the number on the circle
        var x = x_center + radius * Math.cos(rad);
        var y = y_center + radius * Math.sin(rad);

        // Debugging output
        System.println("Number: " + number + ", Position: (" + x + ", " + y + ")");

        // Draw the number at the calculated position
        dc.drawText(x, y, Graphics.FONT_XTINY, number, Graphics.TEXT_JUSTIFY_VCENTER);
    }

    // Called when this View is removed from the screen
    function onHide() as Void {
        // Add any cleanup code here if needed
    }
}
