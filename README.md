TiDocumentInteraction
===

This module allows you to show the familiar "UIActivityViewController" dialogue from iOS 6+.

This allowsyou to share files, open them in other apps, print them, etc.



<img src="https://github.com/mpociot/TiDocumentInteraction/raw/master/screenshots/ipad.png" height="600" />
<img src="https://github.com/mpociot/TiDocumentInteraction/raw/master/screenshots/iphone.png" height="600" />

## Usage

	var documentController = require("de.marcelpociot.documentinteraction");
	documentController.showDialog({
		url: Ti.Filesystem.getFile( "test.png" ).getNativePath(),
        view: button,
        animated: false
	});
	
## Documentation

### Method `showDialog`

#### url

Type: `String|File` 

The location to the file to open for sharing.

#### view

*iPad only*

Type: `View`

This property determines the view where the popover dialogue should be displayed.

#### animated

Type: `Boolean`	

Default: `TRUE`

Wether or not the opening / displaying of the view controller should be animated


## Twitter
If you like this module, feel free to follow me on twitter: [@marcelpociot](http://www.twitter.com/marcelpociot)

## License
MIT