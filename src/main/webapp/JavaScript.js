$(document).ready(function () {
    $(document).on('change', ".Uncheck_class", function () {
        $(".check_class").prop("checked", false);
        $(this).prop("checked", true);
    });
    $(document).on('change', ".check_class", function () {
        $(".Uncheck_class").prop("checked", false);
    });
});
function myFunction() {
    var val = getRadioVal(document.getElementById('form_id'), 'ratings');
    alert(val);
    var inputElements = document.getElementsByClassName('check_class');
    var checkedValue = [];
    for (var i = 0; inputElements[i]; ++i) {
        console.log(inputElements[i]);
        if (inputElements[i].checked) {
            checkedValue.push(inputElements[i].value);
        }
    }
    alert(checkedValue)
}

function getRadioVal(form, name) {
    var val;
    var radios = form.elements[name];

    for (var i = 0, len = radios.length; i < len; i++) {
        if (radios[i].checked) { 
            val = radios[i].value; 
            break; 
        }
    }
    return val; 
}
