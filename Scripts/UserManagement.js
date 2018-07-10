function removeValidate() {
    $("#inputLoginName").removeAttr("data-rules");
    $("#inputRealName").removeAttr("data-rules");
    $("#inputPassword").removeAttr("data-rules");
    $("#inputPhone").removeAttr("data-rules");
}

function addValidate() {
    $("#inputLoginName").attr("data-rules", "required")
    $("#inputRealName").attr("data-rules", "required")
    $("#inputPassword").attr("data-rules", "required")
    $("#inputPhone").attr("data-rules", "required")
}

$(document).ready(addValidate());