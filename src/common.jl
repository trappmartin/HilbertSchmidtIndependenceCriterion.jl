@doc doc"""
estimateKernelSize{T <: Real}(X::Array{T, 2}; sampleSize = 100)
	 Estimate kernel size by taking median distance between points.
""" ->
function estimateKernelSize{T <: Real}(X::Array{T, 2}; sampleSize = 100)

	M = size(X)[1]

	# set kernel size to median distance between points
	if M > sampleSize
		Xmed = X[1:sampleSize,:] # NOTE: Replace this with random sampling in the future
		S = sampleSize
	else
		Xmed = X
		S = M
	end

	G = sum((Xmed.*Xmed), 2)
  Q = repmat(G, 1, S)
  R = repmat(G', S, 1)
  dists = Q + R - 2*Xmed*Xmed'
  dists = dists - tril(dists)
  dists = reshape(dists, S^2, 1)
  sig = sqrt(0.5 * median(dists[dists .> 0]))

	return sig

end

@doc doc"""
rbfDotProduct(X::Array{T, 2}, X::Array{T, 2}, kernelSize::Float64)

""" ->
function rbfDotProduct{T <: Real}(X::Array{T, 2}, Y::Array{T, 2}, kernelSize::Float64)

	G = sum((X.*Y), 2)
	H = sum((X.*Y), 2)

	Q = repmat(G, 1, size(Y, 1))
	R = repmat(H', size(X, 1), 1)

	H = Q + R - 2*X*Y'

	H = exp(-H/2/kernelSize^2)

	return H

end
