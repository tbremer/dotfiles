# alias for the string lower function, copies to clipboard
# use like: lower merge_CSg4on5lwYyqT5reZQkF9
function lower;
    string lower "$argv[1]" | pbcopy
end;