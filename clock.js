function get_new_time(string) {

    // split the string to times
    var a = string.split(":")

    var hours = a[0]
    var mins = a[1]
    var secs = a[2]

    // get numbers only with 0 in case of 01 - 09
    hours = hours * 1
    mins = mins * 1
    secs = secs * 1

    // minus one second
    secs = secs - 1

    // transform all to miliseconds
    var hours_ms = hours * 3600000
    var min_ms = mins * 60000
    var sec_ms = secs * 1000

    // finished miliseconds number
    var ms = hours_ms + min_ms + sec_ms

    // generating new time code with milisecond
    // to HOURS:MIN:SEC transformation
    ms = ~~(ms / 1000)
    var new_seconds = ms % 60
    ms = ~~(ms / 60)
    var new_minutes = ms % 60
    ms = ~~(ms / 60)
    var new_hours = ms % 60

    // add leading 0 in case of smaller number than 10
    if (new_seconds < 10) { var new_sstring = "0"+new_seconds+""}
    else {new_sstring = new_seconds}

    if (new_minutes <10) { var new_mstring = "0"+new_minutes+""}
    else {new_mstring = new_minutes}

    if (new_hours < 10) { var new_hstring = "0"+new_hours+""}
    else {new_hstring = new_hours}

    return new_hstring+":"+new_mstring+":"+new_sstring
}
