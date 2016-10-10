//根据传入的时间戳字符串返回格式化的时间
function transferTime(timeStr) {
	var date = new Date(Number(timeStr));
	var Y = date.getFullYear() + '-';
	M = (date.getMonth() + 1 < 10 ? '0' + (date.getMonth() + 1) : date
			.getMonth() + 1)
			+ '-';
	D = date.getDate() + ' ';
	return Y + M + D;
}
