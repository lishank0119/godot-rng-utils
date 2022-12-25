extends Node

var global_rng: RandomNumberGenerator = RandomNumberGenerator.new()

# 整數範圍隨機(from ~ to)
# Returns a pseudo-random integer between from and to (inclusive)
func int_range(from: int, to: int, rng: RandomNumberGenerator = null) -> int:
	if from == to:
		return from

	if rng == null:
		rng = global_rng

	rng.randomize()
	return rng.randi_range(from, to)

# 浮點數範圍隨機(from ~ to)
# Returns a pseudo-random float between from and to (inclusive)
func float_range(from: float, to: float, rng: RandomNumberGenerator = null) -> float:
	if from == to:
		return from

	if rng == null:
		rng = global_rng

	rng.randomize()
	return rng.randf_range(from, to)

# 陣列隨機抽取{num}個值, unique 是否取出都是唯一
# Returns one or multiple random items from an array
func array(array: Array, num: int = 1, unique: bool = false, rng: RandomNumberGenerator = null) -> Array:
	assert(num >= 1, "RngUtils ERROR: num >= 1")

	if unique:
		assert(num <= array.size(), "RandUtils ERROR: num <= array.size()")

	if rng == null:
		rng = global_rng

	if array.size() == 1:
		return [array[0]]
	elif num == 1:
		rng.randomize()
		var index = rng.randi() % array.size()
		return [array[index]]
	else:
		var results = []

		for i in num:
			var index: int = 0
			if array.size() > 1:
				rng.randomize()
				index = rng.randi() % array.size()

			results.append(array[index])

			if unique:
				array.remove_at(index)

		return results

# 權重隨機
# Returns one or multiple random items from an array with weighted
func array_with_weighted(weights: Array[Dictionary], num: int = 1, unique: bool = false, rng: RandomNumberGenerator = null) -> Array[Dictionary]:
	assert(num >= 1, "RngUtils ERROR: num >= 1")

	if unique:
		assert(num <= weights.size(), "RandUtils ERROR: num <= weights.size()")

	if rng == null:
		rng = global_rng

	if weights.size() == 1:
		return [weights[0]]
	else:
		var results: Array[Dictionary] = []

		for i in num:
			var weights_acc: Array[float] = _weights_to_weights_acc(weights)
			var weight_threshold := float_range(0.0 , weights_acc.back(), rng)

			var index: int = 0
			if weights.size() > 1:
				index = weights_acc.bsearch(weight_threshold)

			results.append(weights[index])

			if unique:
				weights.remove_at(index)

		return results

func _weights_to_weights_acc(weights: Array[Dictionary]) -> Array[float]:
	var weights_acc: Array[float] = []
	weights_acc.resize(weights.size())
	var weights_sum: float = 0.0
	for i in weights_acc.size():
		weights_sum += float(weights[i].get("weight", 0.0))
		weights_acc[i] = weights_sum

	return weights_acc
