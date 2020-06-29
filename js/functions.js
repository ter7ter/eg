function array_remove(array, index) {
	var new_array = [];
	for (var i in array) {
		if (i != index) {
			new_array.push(array[i]);
		}
	}
	return new_array;
}