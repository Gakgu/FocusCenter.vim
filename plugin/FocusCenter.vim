let s:origin_scrolloff = &scrolloff
let s:active = 0

function! ToggleFocusCenter()
    if (s:active == 0)
        call ExecuteFocusCenterOn()
    else
        call ExecuteFocusCenterOff()
    endif
endfunction

function! ExecuteFocusCenterOn()
    if (s:active == 0)
        let s:active = 1
        let s:origin_scrolloff = &scrolloff
    endif

    set scrolloff=999
endfunction

function! ExecuteFocusCenterOff()
    let s:active = 0
    exec("set scrolloff=" . s:origin_scrolloff)
endfunction

command! FocusCenterOn call ExecuteFocusCenterOn()
command! FocusCenterOff call ExecuteFocusCenterOff()
command! FocusCenterToggle call ToggleFocusCenter()
