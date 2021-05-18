﻿GroupAdd, Browsers, ahk_exe firefox.exe
GroupAdd, Browsers, ahk_exe brave.exe

/*
MOUSE BUTTONS:
lower side button: F24
upper side button: F23

middle extra button: F18
middle extra button gestures:
	up: F19
	down: F20
	left: F21
	right: F22

*/

::\emdash::—	;em dash hotstring
::\endash::–	;en dash hotstring


/*
 * GREEK LETTERS
 */
::\\Alpha::Α
::\.alpha::α
::\\Beta::Β
::\.beta::β
::\\Gamma::Γ
::\.gamma::γ
::\\Delta::Δ
::\.delta::δ
::\\Epsilon::Ε
::\.epsilon::ε
::\\Zeta::Ζ
::\.zeta::ζ
::\\Eta::Η
::\.eta::η
::\\Theta::Θ
::\.theta::θ
::\\Iota::Ι
::\.iota::ι
::\\Kappa::Κ
::\.kappa::κ
::\\Lambda::Λ
::\.lambda::λ
::\\Mu::Μ
::\.mu::μ
::\\Nu::Ν
::\.nu::ν
::\\Xi::Ξ
::\.xi::ξ
::\\Omicron::Ο
::\.omicron::ο
::\\Pi::Π
::\.pi::π
::\\Rho::Ρ
::\.rho::ρ
::\\Sigma::Σ
::\.sigma::σ
::\\Tau::Τ
::\.tau::τ
::\\Upsilon::Υ
::\.upsilon::υ
::\\Phi::Φ
::\.phi::φ
::\\Chi::Χ
::\.chi::χ
::\\Psi::Ψ
::\.psi::ψ
::\\Omega::Ω
::\.omega::ω


::\sus::ඞ
::\shrug::¯\_(ツ)_/¯
::\stanford::
	Run python "C:\Users\jacob\Documents\Scripts\stanford perm\permutations.pyw"
	Send ^v
Return

#+b::SoundPlay bruhsoundeffect2.wav	;Win+Shift+B play bruh sound effect 2
#+Space::Media_Play_Pause 
#F10::Run "C:\Users\%A_UserName%\Dropbox\Scripts\lightswitch.pyw" desk_lamp_toggle	;toggle desk lamp
#F11::Run "C:\Users\%A_UserName%\Dropbox\Scripts\lightswitch.pyw" ceiling_light_toggle	;toggle ceiling light
#F12::Run "C:\Users\%A_UserName%\Dropbox\Scripts\cubeswitch.pyw" cube_lamp_toggle	;toggle cube lamp
#+F12::Run "C:\Users\%A_UserName%\Dropbox\Scripts\cubeswitch.pyw" cube_lamp_bright	;brighten cube lamp 10%
#!F12::Run "C:\Users\%A_UserName%\Dropbox\Scripts\cubeswitch.pyw" cube_lamp_dim	;dim cube lamp 10%
#!+R::Run "C:\Program Files\Rainmeter\Rainmeter.exe" !RefreshApp	;Win+Alt+Shift+R refresh all rainmeter skins
#!+S::Run "C:\Users\%A_UserName%\Miscellaneous\turn off screen.bat"	;Win+Alt+Shift+S turn off screen
#+A::Run "C:\Users\%A_UserName%\Dropbox\Scripts\amazonlinkconverter.pyw"

#IfWinActive ahk_group Browsers
F24::^Tab
F23::^+Tab
XButton1::^Tab
XButton2::^+Tab
F19::^t
F20::^w
Return

#IfWinActive ahk_exe Inventor.exe
F18::,
Return

#IfWinActive ahk_exe javaw.exe
F24::.
F19::Numpad0
F20::Numpad1
F18::Numpad2
F21::Numpad4
Return

#IfWinActive ahk_exe Terraria.exe
F23::J	;quick mana
F24::H	;quick heal
F18::B	;quick buff
F19::R	;mount

Return