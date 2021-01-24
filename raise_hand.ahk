Menu, Tray, Icon, raise_hand.ICO

FindAndClick(ImageFile, WinWidth, mx, my)
{
	IfNotExist, %ImageFile% 
	{
    	MsgBox, Error: Your file %ImageFile% either doesn't exist or isn't in this location.
		return
	}
	; searching is done in constrained space of the window, this speeds up searching
	ImageSearch, outx, outy, 600, 0, %WinWidth%, 200, *10 %ImageFile%
	if (ErrorLevel = 0) {
		; move onto icon, avoiding clicking left top of the icon
		outx := outx + 15
		outy := outy + 15

		; click
		MouseClick, Left, %outx%, %outy%, 1, 0

		; move mouse back to original position
		MouseMove, %mx%, %my%, 0 

		return true
	}

	return false ; requested image was not found
}


#IfWinActive ahk_exe Teams.exe ahk_class Chrome_WidgetWin_1
+^h:: ; toggle hand with Ctrl + Shift + h
	WinGetPos, WinX, WinY, WinWidth, WinHeight, A
	MouseGetPos, MX, MY

	if (!FindAndClick("raise_hand_default.JPG", WinWidth, mx, my)) {
		if (!FindAndClick("raise_hand_pushed.JPG", WinWidth, mx, my)) {
			; msgbox Could not find any icon on screen
		}
	}
	return
#IfWinActive

