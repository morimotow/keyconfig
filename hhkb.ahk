#UseHook

vHHKB = False

; メニュー設定
#Persistent 
Menu, Tray, Add, HHKB, HHKBHandler  ; Creates a new menu item.
Menu, Tray, Check, HHKB
return

; ; HHKB <-> 英語キーボード

HHKBHandler:
    Menu, Tray, ToggleCheck, HHKB
    vHHKB := !vHHKB
return

; 英語キーボード->日本語キーボードに変換
*+2::
Send {@}
return

*+6::
Send {^}
return

*+7::
Send {&}
return

*+8::
Send {*}
return

*+9::
Send {(}
return

*+0::
Send {)}
return

*+-::Send,{_}
^::Send,{=}
*+^::Send,{+}

VKF4::Send,{``}
*+VKF4::Send,{~}


@::Send,{[}
*+@::Send,{{}
[::Send,{]}
*+[::Send,{}}

; CTRL+]対応(Vimタグジャンプ用)
*^[::Send,^{]}

*+;::Send,{:}

:::Send,{'}

*::Send,{"}

]::Send,{\}
*+]::Send,{|}

; HHKB用入力項目
*Home::
    if (vHHKB)
        Send {Blind}{Up}
    else
        Send {Blind}{Home}
    return

*PgUp::
    if (vHHKB)
        Send {Blind}{Right}
    else
        Send {Blind}{PgUp}
    return

*NumpadMult::
    if (vHHKB)
        Send {Blind}{Left}
    else
        Send {Blind}{NumpadMult}
    return

*NumpadDiv::
    if (vHHKB)
        Send {Blind}{Down}
    else
        Send {Blind}{NumpadDiv}
    return

*PrintScreen::
    if (vHHKB)
        Send {Blind}{Home}
    else
        Send {Blind}{PrintScreen}
    return

*Left::
    if (vHHKB)
        Send {Blind}{End}
    else
        Send {Blind}{Left}
    return

*Up::
    if (vHHKB)
        Send {Blind}{PgUp}
    else
        Send {Blind}{Up}
    return

*Down::
    if (vHHKB)
        Send {Blind}{PgDn}
    else
        Send {Blind}{Down}
    return

*NumpadAdd::
    if (vHHKB)
        Send {Blind}{vkF4sc029}
    else
        Send {Blind}{NumpadAdd}
    return


; 英語キーボード用キー入れ替え(HHKBでも使える)
Capslock::Ctrl
sc03a::Ctrl

+WheelUp::  ; Scroll left.  
ControlGetFocus, fcontrol, A  
Loop 4  ; <-- Increase this value to scroll faster.  
    SendMessage, 0x114, 0, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 0 after it is SB_LINELEFT.  
return  

+WheelDown::  ; Scroll right.
ControlGetFocus, fcontrol, A  
Loop 4  ; <-- Increase this value to scroll faster.  
    SendMessage, 0x114, 1, 0, %fcontrol%, A  ; 0x114 is WM_HSCROLL and the 1 after it is SB_LINERIGHT.  
return

#IfWinActive, ahk_class ahk_class Vim
+WheelUp:: Send, 3zh  ; Scroll left.  
+WheelDown::Send, 3zl   ; Scroll right.
#IfWinActive

#IfWinActive, ahk_class ahk_class XLMAIN
+WheelUp::ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,0,3)  ; Scroll left. 
+WheelDown::ComObjActive("Excel.Application").ActiveWindow.SmallScroll(0,0,3)  ; Scroll right. 
#IfWinActive

#IfWinActive, ahk_class ahk_class SWT_Window0
MButton::F3
#IfWinActive
