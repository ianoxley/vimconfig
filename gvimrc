if has("gui_kde")
    set guifont=Ubuntu Mono/12/-1/5/50/0/0/0/0/0
elseif has("gui_gtk")
    set guifont=Ubuntu\ Mono\ 12
elseif has("gui_running")
    if has("win32") || has("win64")
        set guifont=Ubuntu\ Mono:h12
        " Maximise the window
        set lines=999 columns=95
    else
        set guifont=-xos4-terminus-medium-r-normal--14-140-72-72-c-80-iso8859-1
    endif
endif

