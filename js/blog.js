/**
 * 
 */

	function GetFormatedDate() {
		var monthNames = ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"];
		var currentDate = new Date();
		var day = currentDate.getDate();
		var month = monthNames[currentDate.getMonth()];
		var year = currentDate.getFullYear();
		var hour = currentDate.getHours();
		var minutes = currentDate.getMinutes();
		var seconds = currentDate.getSeconds();
		var today = month + ", " + day + " " + year + " " + hour + ":" + minutes + ":" + seconds;
		return today;
	};
