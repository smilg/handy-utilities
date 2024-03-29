﻿#Requires AutoHotkey v2.0
#SingleInstance Force

GroupAdd("Browsers", "ahk_exe firefox.exe")
GroupAdd("Browsers", "ahk_exe brave.exe")
GroupAdd("Browsers", "ahk_exe chrome.exe")

/*
MOUSE BUTTONS:
front side button: F24
back side button: F23

middle extra button: F18
middle extra button gestures:
	up: F19
	down: F20
	left: F21
	right: F22

*/


/*
 *==============*
 *--------------*
 *  HOTSTRINGS  *
 *--------------*
 *==============*
 */
 
/*
 *=============*
 * PUNCTUATION *
 *=============*
 */
::\endash::–
::\emdash::—
::\--::—
::\interrobang::‽

/*
 *===============*
 * GREEK LETTERS *
 *===============*
 */

;Uppercase: \\letter
;Lowercase: \.letter

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

/*
 *=========*
 * ARROWS *
 *=========*
 */
::\arrowN::↑
::\arrowNE::↗
::\arrowE::→
::\->::→
::\arrowSE::↘
::\arrowS::↓
::\arrowSW::↙
::\arrowW::←
::\<-::←
::\arrowNW::↖

/*
 *==========*
 * CURRENCY *
 *==========*
 */
::\cent::¢
::\euro::€      ; EU
::\pound::₤     ; GB
::\yen::¥       ; JP
::\shekel::₪    ; Israel
::\rupee::₹     ; India
::\ruble::₽     ; Russia
::\lira::₺      ; Turkey
::\baht::฿      ; Thailand
::\afghani::؋   ; Afghanistan
::\rial::﷼      ; Iran
::\dram::֏      ; Armenia
::\dong::₫      ; Vietnam
::\peso::₱      ; Philippines
::\btc::₿

/*
 *======*
 * MATH *
 *======*
 */
::\exp0::⁰
::\exp1::¹
::\exp2::²
::\exp3::³
::\exp4::⁴
::\exp5::⁵
::\exp6::⁶
::\exp7::⁷
::\exp8::⁸
::\exp9::⁹
::\sub0::₀
::\sub1::₁
::\sub2::₂
::\sub3::₃
::\sub4::₄
::\sub5::₅
::\sub6::₆
::\sub7::₇
::\sub8::₈
::\sub9::₉
::\approxequal::≈
::\approx::≈
::\>=::≥
::\<=::≤
::\notequal::≠
::\degree::°
::\deg::°
::\times::×
::\divide::÷
::\plusminus::±
::\infinity::∞
::\inf::∞

/*
 *===============*
 * ABBREVIATIONS *
 *===============*
 */
::\b/c::because

/*
 *======*
 * MISC *
 *======*
 */
::\celsius::℃
::\fahrenheit::℉
::\copyright::©
::\trademark::™
::\reserved::®
::\pilcrow::¶
::\section::§
::\eighthnote::♪
::\sus::ඞ
::\shrug::¯\_(ツ)_/¯

^!T::Run("wt.exe")

#+R::Reload
#+b::SoundPlay("bruhsoundeffect2.wav")	;Win+Shift+B play bruh sound effect 2
#+Space::Media_Play_Pause

; #^+D::
; WinGetActiveTitle, ActiveTitle
; Run "scripts\switchlaptopmon.bat"
; WinWaitNotActive %ActiveTitle%, , 1
; WinActivate, %ActiveTitle%
; Return
#F12::Run('"scripts\cubeswitch_kasa.pyw" toggle')	;toggle cube lamp
#+F12::Run('"scripts\cubeswitch_kasa.pyw" bright')	;brighten cube lamp 10%
#!F12::Run('"scripts\cubeswitch_kasa.pyw" dim')	;dim cube lamp 10%
; #+!F12::
; {
; OutputVar := InputHook(L50, {Enter}{Esc})
; Run "scripts\cubeswitch_kasa.pyw" %OutputVar%
; Return
; }
#!+R::Run('"C:\Program Files\Rainmeter\Rainmeter.exe" !LoadLayout "Bliss 1 Monitor"')	;Win+Alt+Shift+R refresh all rainmeter skins
#!+S::Run "scripts\screenoff.bat"	;Win+Alt+Shift+S turn off screen
#+A::Run "scripts\amazonlinkconverter.pyw"  ;Win+Shift+A shorten amazon link

#HotIf WinActive("ahk_group Browsers")
F24::^Tab
F23::^+Tab
XButton1::^Tab
XButton2::^+Tab
F19::^t
F20::^w

#HotIf WinActive("ahk_exe Inventor.exe")
F18::,

; #IfWinActive ahk_exe javaw.exe
; F24::.
; F19::Numpad0
; F20::Numpad1
; F18::Numpad2
; F21::Numpad4
; Return

#HotIf WinActive("ahk_exe Terraria.exe")
F23::J	;quick mana
F24::H	;quick heal
F18::B	;quick buff
F19::R	;mount

#HotIf WinActive("xschem")
F18::Ins    ; middle button insert component
; F21::U      ; left gesture undo
; F22::+U     ; right gesture redo

; #HotIf WinActive(ahk_exe isaac-ng.exe)
; ~Esc::
; ~Enter::
; {
;     turboenable := 0
;     HotKey(*Up, Off)
;     HotKey(*Down, Off)
;     HotKey(*Left, Off)
;     HotKey(*Right, Off)
; Return
; }

; *Up::SpamKey("Up")
; *Down::SpamKey("Down")
; *Left::SpamKey("Left")
; *Right::SpamKey("Right")

; *\::
; {
;     turboenable := !turboenable
;     if (turboenable) {
;         Hotkey(*Up, On)
;         HotKey(*Down, On)
;         HotKey(*Left, On)
;         HotKey(*Right, On)
;     } else {
;         HotKey(*Up, Off)
;         HotKey(*Down, Off)
;         HotKey(*Left, Off)
;         HotKey(*Right, Off)
;     }
; Return
; }

; SpamKey(key) {
;     While GetKeyState(key, "P") {
;         send % "{" . key . " down}"
;         Sleep, 60
;         send % "{" . key . " up}"
;         Sleep, 60
;     }
; }

; Return
