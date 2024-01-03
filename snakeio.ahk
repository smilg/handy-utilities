#Requires AutoHotkey v2.0

#Include "XInput.ahk"
XInput_Init()

WindowX := 0
WindowY := 0
WindowW := 0
WindowH := 0

WindowCenterX := 0
WindowCenterY := 0

StickScale := 0

PrevClick := 0

Loop {
    while (WinActive("Snake.io")) { ; only work while snake.io window is in focus
        if (State := XInput_GetState(0)) {  ; poll controller 1
            ; press both sticks down to update window centerpoint
            if ((State.wButtons & XINPUT_GAMEPAD_LEFT_THUMB) && (State.wButtons & XINPUT_GAMEPAD_RIGHT_THUMB)) {
                WinGetPos(&WindowX, &WindowY, &WindowW, &WindowH, "A")  ; get the size and position of the active window (snake.io)
                WindowCenterX := WindowW / 2
                WindowCenterY := WindowH / 2
                ; use the smaller of the two window dimensions to determine the movement circle size
                if (WindowW < WindowH) {
                    StickScale := WindowW / 8
                } else {
                    StickScale := WindowH / 8
                }
            }

            ; move mouse to stick location relative to center of window if stick is being moved
            if (abs(State.sThumbLX) > 10000 || abs(State.sThumbLY) > 10000) {
                MouseMove(WindowCenterX + (State.sThumbLX * StickScale / 32768), WindowCenterY - (State.sThumbLY * StickScale / 32768))
            }

            ; if any of abxy or shoulder buttons are pressed, send mouse down. when they're released, send mouse up.
            if (State.wButtons & (XINPUT_GAMEPAD_A | XINPUT_GAMEPAD_B | XINPUT_GAMEPAD_X | XINPUT_GAMEPAD_Y | XINPUT_GAMEPAD_LEFT_SHOULDER | XINPUT_GAMEPAD_RIGHT_SHOULDER)) {
                if (!PrevClick) {   ; only send mouse down if it isn't already down
                    Send("{LButton down}")
                    PrevClick := 1
                }
            } else if (PrevClick) {
                Send("{LButton up}")
                PrevClick := 0
            }
            
            ; dpad movement - get 1, 0 or -1 for x and y dpad direction
            DPadX := !!(State.wButtons & XINPUT_GAMEPAD_DPAD_RIGHT) -  !!(State.wButtons & XINPUT_GAMEPAD_DPAD_LEFT)
            DPadY := !!(State.wButtons & XINPUT_GAMEPAD_DPAD_UP) - !!(State.wButtons & XINPUT_GAMEPAD_DPAD_DOWN)
            ; if any dpad button is pressed, move that way
            if (DPadX || DPadY) {
                MouseMove(WindowCenterX + DPadX * StickScale, WindowCenterY - DPadY * StickScale)
            }
        }
    }
    Sleep(100)
}