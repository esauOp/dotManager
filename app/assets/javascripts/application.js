// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-datepicker
//= require turbolinks
//= require bootstrap
//= require_tree .


var time  = document.getElementById("tasktimervalue");
// var timer = time.value;
// time.value = '00:00:00'

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

	setInterval(function () {
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
