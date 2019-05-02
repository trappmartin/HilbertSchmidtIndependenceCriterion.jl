"""
    estimateKernelSize{T <: Real}(X::Array{T, 2}; sampleSize = 100)

    Estimate kernel size by taking median distance between points.
"""
function estimateKernelSize(X::Array{T, 2}; sampleSize = 100) where T <: Real

	M = size(X)[1]

	# set kernel size to median distance between points
	if M > sampleSize
		Xmed = X[shuffle(collect(1:M))[1:sampleSize],:]
		S = sampleSize
	else
		Xmed = X
		S = M
	end

	dists = pairwise(SqEuclidean(), Xmed, Xmed, dims=2)
    sig = sqrt(0.5 * median(dists))

    return sig
end

"""
    rbfDotProduct(X::Array{T, 2}, X::Array{T, 2}, kernelSize::Float64)

"""
function rbfDotProduct(X::Array{T, 2}, Y::Array{T, 2}, kernelSize) where T <: Real

    H = zeros(size(X,1), size(Y,1))
    @assert size(X,2) == size(Y,2)

    for i in 1:size(X,1)
        for j in 1:size(Y,1)
            @inbounds begin
                H[i,j] = first( (X[i,:].-Y[j,:]) * (X[i,:].-Y[j,:])' )
            end
        end
    end

    return exp.(-H/2/kernelSize^2)
end

eye(n) = Matrix(I, n, n)
