extends Node2D

func _ready():
	
	print("int_range 1~100 : ", RngUtils.int_range(1, 100))
	print("float_range 0.1~5.1 : ", RngUtils.float_range(0.1, 5.1))
	
	var array := ["a", "b", "c", "d"]
	# 陣列取一個
	# random one item
	print("array random one : ", RngUtils.array(array))
	
	# 陣列取四個，可重複
	# random four items(not unique)
	print("array random four (not unique) : ", RngUtils.array(array, 4))
	# 陣列取四個，不可重複
	# random four items(unique)
	print("array random four (unique) : ", RngUtils.array(array, 4, true))
	
	var sum_weighted: Dictionary = {}
	var sum_unique_weighted: Dictionary = {}
	
	for i in 100:
		var weights: Array[Dictionary] = [
			{"value":"a","txt": "apple", "weight": 5.0},
			{"value":"b", "weight": 10.0},
			{"value":"c", "weight": 20.0},
			{"value":"d", "weight": 40.0},
			{"value":"e", "weight": 25.0},
		]
		
		# 陣列取四個，可重複
		# random four items(not unique)
		var random_weights: Array[Dictionary] = RngUtils.array_with_weighted(weights, 4)
		print("random_weights : ", random_weights)
		
		# 陣列取四個，不可重複
		#random four items(unique)
		var random_unique_weights: Array[Dictionary] = RngUtils.array_with_weighted(weights, 4, true)
		print("random_unique_weights : ", random_unique_weights)
		
		# 計算次數
		# Calculation counts
		for index in 4:
			var count = sum_weighted.get(random_weights[index].value, 0)
			sum_weighted[random_weights[index].value] = count + 1
			
			var unique_count = sum_unique_weighted.get(random_unique_weights[index].value, 0)
			sum_unique_weighted[random_unique_weights[index].value] = unique_count + 1
		
	var percentage: Dictionary = {}
	for key in sum_weighted.keys():
		percentage[key] = float(sum_weighted[key]) / 400.0 * 100
	print("random_weights four (not unique) percentage : ", percentage)
	
	var weighted_percentage: Dictionary = {}
	for key in sum_unique_weighted.keys():
		weighted_percentage[key] = float(sum_unique_weighted[key]) / 400.0 * 100.0
	print("random_weights four (unique) percentage : ", weighted_percentage)
