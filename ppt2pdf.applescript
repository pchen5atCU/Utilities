(* Applescript for Mac OS X. The author's os version is 10.11.3. 
 The Microsoft PowerPoint version of the author is 15.27(161010) of Office 2016 for Mac from CUHK.
Automatically convert ppt and pptx files in a chosen folder to pdf. The quality should
be guaranteed because this script calls the PowerPoint application to work. *)

set F to choose folder
set MyExten to {"pptx", "ppt"}
tell application "Finder" to set fl to (files of entire contents of F whose name extension is in MyExten)

repeat with F in fl
	tell application "Microsoft PowerPoint"
		open F
		activate
	end tell
	tell application "System Events"
		tell process "Microsoft PowerPoint"
			click menu item "Export..." of menu "File" of menu bar 1
			delay 1
			keystroke return
			click menu item "Close" of menu "File" of menu bar 1
		end tell
	end tell
end repeat
