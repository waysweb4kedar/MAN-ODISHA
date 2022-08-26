// check empty
function Empty(control, message) {
    if (control.value.length == 0) {
        control.focus();
        alert(message);
        return false;
    }
    else { return true; }
}
//check alphabet 
function Alphabet(control, message) {
    if (!control.value.match(/^[a-zA-Z]+$/)) {
        control.focus();
        alert(message);
        return false;
    }
    else { return true; }
}
//check email  address
function Email(control, message) {
    if (!control.value.match(/^[\w_.+]+\@[a-z0-9._]+\.[a-z0-9]{2,4}$/)) {
        control.focus();
        alert(message);
        return false;
    }
    else { return true; }

}

// check dropdownbox
function Dropdownbox(control, message) {
    if (control.selectedIndex == 0) {
        alert(message);
        return false;
    }
    else { return true; }
}

function radiobutton(control, message) {
    var radio = control.getElementsByTagName("input");
    var isChecked = false;
    for (var i = 0; i < radio.length; i++) {
        if (radio[i].checked) {
            isChecked = true;
            break;
        }
    }
    if (!isChecked) {
        alert(message);
        return false;
    }
    else { return true; }

}