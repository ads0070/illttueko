$(document).ready(function($) {
    $.ajax({
        url: "/seminar",
        type: "get",
        contentType : 'charset=UTF-8',
        success: function (data) {
            if(data) {
                setSeminarData(data);
            }
        },
        error: function () {
            //
        }
    })
});

function setSeminarData(data) {
    var seminarBody = document.getElementById("seminar-body");

    for(var i=0; i < data.result.length; i++) {
        let semTr = document.createElement("tr");
        let semTdidx = document.createElement("td");
        let semTdClassNo = document.createElement("td");
        let semTdStartTime = document.createElement("td");
        let semTdEndTime = document.createElement("td");
        let semTdReason = document.createElement("td");
        let semTdName = document.createElement("td");

        var startTime = new Date(data.result[i].startTime);
        var start = startTime.getFullYear() + "-" + ("00"+(startTime.getMonth()+1)).slice(-2)  + "-" + ("00"+startTime.getDate()).slice(-2) + " " + ("00"+startTime.getHours()).slice(-2) + ":" + ("00"+startTime.getMinutes()).slice(-2);

        var endTime = new Date(data.result[i].endTime);
        var end = endTime.getFullYear() + "-" + ("00"+(endTime.getMonth()+1)).slice(-2)  + "-" + ("00"+endTime.getDate()).slice(-2) + " " + ("00"+endTime.getHours()).slice(-2) + ":" + ("00"+endTime.getMinutes()).slice(-2);

        semTdidx.innerText = data.result[i].idx;
        semTdClassNo.innerText = data.result[i].lab.classNo;
        semTdStartTime.innerText = start;
        semTdEndTime.innerText = end;
        semTdReason.innerText = data.result[i].seminarInfo;
        semTdName.innerText = data.result[i].owner;

        semTr.appendChild(semTdidx);
        semTr.appendChild(semTdClassNo);
        semTr.appendChild(semTdStartTime);
        semTr.appendChild(semTdEndTime);
        semTr.appendChild(semTdReason);
        semTr.appendChild(semTdName);

        seminarBody.appendChild(semTr);
    }
}