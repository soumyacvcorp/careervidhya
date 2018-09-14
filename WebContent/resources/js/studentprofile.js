
function openPage(pageName,elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablink");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.color = "#fff"
    }
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = "#fff";
    elmnt.style.color = "#000";

}

function openPageJava(pageName,elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontentjava");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinkjava");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.color = "#fff"
    }
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = "#fff";
    elmnt.style.color = "#000";

}

function openPageapti(pageName,elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontentapti");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinkapti");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.color = "#fff"
    }
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = "#fff";
    elmnt.style.color = "#000";

}

function openPagecom(pageName,elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontentcom");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinkcom");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.color = "#fff"
    }
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = "#fff";
    elmnt.style.color = "#000";

}
function openPagelin(pageName,elmnt) {
    var i, tabcontent, tablinks;
    tabcontent = document.getElementsByClassName("tabcontentlinux");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinklinux");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.color = "#fff"
    }
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].style.backgroundColor = "#000";
    }
    document.getElementById(pageName).style.display = "block";
    elmnt.style.backgroundColor = "#fff";
    elmnt.style.color = "#000";

}
