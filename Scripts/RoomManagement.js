function removeValidate() {
    $("#inputRoomID").removeAttr("data-rules");
    $("#inputRoomName").removeAttr("data-rules");
    $("#inputRoomLocation").removeAttr("data-rules");
    $("#inputRoomCapacity").removeAttr("data-rules");
}

function addValidate() {
    $("#inputRoomID").attr("data-rules", "required")
    $("#inputRoomName").attr("data-rules", "required")
    $("#inputRoomLocation").attr("data-rules", "required")
    $("#inputRoomCapacity").attr("data-rules", "required")
}

$(document).ready(addValidate());