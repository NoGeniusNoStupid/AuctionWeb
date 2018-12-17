function check() {
    var inputList = document.getElementsByTagName("INPUT");
    for (var i = 0; i < inputList.length; i++) {
        if (inputList[i].type == "password") {
            var date = inputList[i].value;
            if (date.length < 6 || date.length > 10) {
                alert("请输入6-10位密码");
                return false;
            }
        }
        if (inputList[i].type == "tel") {
            var date = inputList[i].value;
            if (!validatemobile(date)) {
                return false;
            }
        }
        if (inputList[i].type == "email") {
            var date = inputList[i].value;
            if (!isCardNo(date)) {
                return false;
            }
        }
        if (inputList[i].type == "file") {
            var date = inputList[i].value;
            if (date == "") {
                alert("请上传图片");
                return false;
            }
        }
        if (inputList[i].type == "text" || inputList[i].type == "number" || inputList[i].type == "datetime-local"
            || inputList[i].type == "date") {
            var date = inputList[i].value;
            if (date == "") {
                alert(inputList[i].title);
                return false;
            }
        }
        if (inputList[i].type == "number") {
            var date = inputList[i].value;
            var ival = parseInt(date);
            if (ival<=0){
                alert("输入的数字不能小于0");
                return false;
            }
        }
    }
    
    return true;
}


function editCheck() {
    var inputList = document.getElementsByTagName("INPUT");
    for (var i = 0; i < inputList.length; i++) {
        if (inputList[i].type == "password") {
            var date = inputList[i].value;
            if (date.length < 6 || date.length > 10) {
                alert("请输入6-10位密码");
                return false;
            }
        }
        if (inputList[i].type == "tel") {
            var date = inputList[i].value;
            if (!validatemobile(date)) {
                return false;
            }
        }
        if (inputList[i].type == "email") {
            var date = inputList[i].value;
            if (!isCardNo(date)) {
                return false;
            }
        }
        if (inputList[i].type == "text" || inputList[i].type == "number" || inputList[i].type == "datetime-local"
            || inputList[i].type == "date") {
            var date = inputList[i].value;
            if (date == "") {
                alert(inputList[i].title);
                return false;
            }
        }
        if (inputList[i].type == "number") {
            var date = inputList[i].value;
            var ival = parseInt(date);
            if (ival <= 0) {
                alert("输入的数字不能小于0");
                return false;
            }
        }
    }

    return true;
}
//邮箱校验
function CheckEmail(obj) {
    //对电子邮件的验证
    var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
    if (!myreg.test(obj)) {
        alert('请输入有效的邮箱！');
        return false;
    }
    return true;

}
//手机校验
function validatemobile(mobile) {
    if (mobile.length == 0) {
        alert('手机号码不能为空！');
        return false;
    }
    if (mobile.length != 11) {
        alert('请输入有效的手机号码，需是11位！');
        return false;
    }
    var myreg = /^(((13[0-9]{1})|(15[0-9]{1})|(18[0-9]{1}))+\d{8})$/;
    if (!myreg.test(mobile)) {
        alert('请输入有效的手机号码！');
        return false;
    }
    return true;
}
//身份证号码校验
function isCardNo(card) {
    // 身份证号码为15位或者18位，15位时全为数字，18位前17位为数字，最后一位是校验位，可能为数字或字符X 
    var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
    if (reg.test(card) === false) {
        alert("身份证输入不合法");
        return false;
    }
    return true;
}
//校验时间
function CheckTime() {
    var startTime = document.getElementById("StartTime").value;
    var endTime = document.getElementById("EndTime").value;
    var startTimestamp = Date.parse(startTime);//获取开始时间戳
    var endTimetamp = Date.parse(endTime);//获取结束时间戳
    var timestamp = Date.parse(new Date());//获取当前时间戳
    if (startTimestamp < timestamp) {
        alert("开始时间不能小于当前时间");
        return false;
    }
    if (endTimetamp < startTimestamp) {
        alert("开始时间不能小于结束时间");
        return false;
    }
    return true;
}

