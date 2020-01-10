function addAuthorCheckNull(): Boolean {
    // 获取文本框的值
    let id = document.getElementById("author_id").value;
    let name = document.getElementById("author_name").value;
    let password = document.getElementById("author_password").value;
    if (id.length <= 3) {
        // alert("学号或姓名不能为空!");
        document.getElementById("author_id_msg").innerText = "编号必须填写";
        return false;
    }
    if (name.length <= 3) {
        document.getElementById("author_name_msg").innerText = "姓名必须填写";
        return false;
    }
    if (password.length <= 3) {
        document.getElementById("author_password_msg").innerText = "密码必须填写";
        return false;
    }
    return true;
}

function crateXml() {
    try {
        return new XMLHttpRequest();
    } catch (e) {
        e.printStackTrace();
        try {
            return new ActiveObject("Microsoft.XMLHttp");
        } catch (e) {
            alert("浏览器版本过低");
        }
    }
}

function checkIdCanUse() {
    let name = document.getElementById("author_id").value;
    let msg = document.getElementById("author_id_msg");
    let xmlHttp = crateXml();
    xmlHttp.open("get", "existId?author_id=" + name, true);
    xmlHttp.send(null);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState === 4 && xmlHttp.status === 200) {
            msg.innerText = xmlHttp.responseText;
        } else {
            msg.innerText = null;
        }
    }

}

