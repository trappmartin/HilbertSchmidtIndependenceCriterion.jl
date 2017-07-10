module HilbertSchmidtIndependenceCriterion

	using StatsFuns, Distances

	# includes
	include("common.jl")
	include("gammaHSIC.jl")

	# function exports
	export gammaHSIC, estimateKernelSize, rbfDotProduct

end # module
