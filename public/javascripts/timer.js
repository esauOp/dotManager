var intervalTime;
var time  = document.getElementById("tasktimervalue");
// var timer = time.value;
// time.value = '00:00:00'

if(intervalTime){
	clearInterval(intervalTime);
}

if(time)
{	
// 	var t = new Date();

// 	t= t.getHours()+":"+t.getMinutes()+":"+t.getSeconds()
// 	t = timeToSeconds(t);

// 	timer = t - timer;
	tnow = new Date();

	tnow.setHours(0);
	tnow.setMinutes(0);
	tnow.setSeconds(0);
	tnow.setSeconds(tnow.getSeconds() + timeToSeconds(time.value))

// 	// t.setSeconds(t.getSeconds() + (timer*-1));
// 	timer  = document.getElementById("tasktimervalue");
	
	intervalTime = window.setInterval(function () {
		tnow.setSeconds(tnow.getSeconds() + 1)
		var hh = tnow.getHours();
		var mm = tnow.getMinutes();
		var ss = tnow.getSeconds();

		//if (hh > 12) {hh = hh - 12;}

		if (hh < 10) {hh = "0"+hh;}
		if (mm < 10) {mm = "0"+mm;}
		if (ss < 10) {ss = "0"+ss;}

		time.value = hh+":"+mm+":"+ss;

	    //timer.value = tnow.getHours()+":"+tnow.getMinutes()+":"+tnow.getSeconds()
	}, 1000);
}

function timeToSeconds(time) {
    time = time.split(/:/);
    return (time[0] * 3600) + (time[1] * 60) + (time[2] *1);
}



