
var timer  = document.getElementById("tasktimervalue");

if(timer)
{
timer = timeToSeconds(timer.value);

var t = new Date();

t= t.getHours()+":"+t.getMinutes()+":"+t.getSeconds()
t = timeToSeconds(t);

timer = t - timer;
tnow = new Date();

tnow.setHours(0);
tnow.setMinutes(0);
tnow.setSeconds(0);
tnow.setSeconds(tnow.getSeconds() + timer)

// t.setSeconds(t.getSeconds() + (timer*-1));
timer  = document.getElementById("tasktimervalue");

setInterval(function () {
	tnow.setSeconds(tnow.getSeconds() + 1)

    timer.value = tnow.getHours()+":"+tnow.getMinutes()+":"+tnow.getSeconds()
}, 1000);
}
function timeToSeconds(time) {
    time = time.split(/:/);
    return (time[0] * 3600) + (time[1] * 60) + (time[2] *1);
}
