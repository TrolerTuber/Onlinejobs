var visable = true;
$(function () {
	window.addEventListener('message', function (event) {
		var jobs = event.data.jobs;
		loadJobs = function(){
			if (jobs.police > 9) {
				$('#policecounter').html('+9')
			}else{
				$('#policecounter').html(jobs.police)
			}
			if (jobs.ems > 9) {
				$('#ambulancecounter').html('+9')
			}else{
				$('#ambulancecounter').html(jobs.ems)
			}
			if (jobs.mechanic > 9) {
				$('#mechaniccounter').html('+9')
			}else{
				$('#mechaniccounter').html(jobs.mechanic)
			}
			//taxicounter
			if (jobs.taxi > 9) {
				$('#taxicounter').html('+9')
			}else{
				$('#taxicounter').html(jobs.taxi)
			}
			$('#playerscounter').html(jobs.player_count)
		}

		switch (event.data.action) {
			case 'toggle':
				if (visable) {
					$('#JobsCounter').fadeOut();
				} else {
					$('#JobsCounter').fadeIn();
				}
				visable = !visable;
			break;

			case 'close':
				$('#contador').fadeOut();
				visable = false;
			break;

			case 'updatePlayerJobs':
				loadJobs();	
			break;
		}
		$("#id").html(event.data.id)
	}, false);
});