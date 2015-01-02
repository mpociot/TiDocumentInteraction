// open a single window
var win = Ti.UI.createWindow({
	backgroundColor:'white'
});
var button = Ti.UI.createButton({
	title: "Show"
});
win.add(button);
win.open();

button.addEventListener("click", function()
{
	var documentController = require("de.marcelpociot.documentinteraction");
	documentController.showDialog({
		url: Ti.Filesystem.getFile( "test.png" ).getNativePath(),
        view: button
	});
});