[![Build Status](https://travis-ci.org/trappmartin/HilbertSchmidtIndependenceCriterion.jl.svg?branch=master)](https://travis-ci.org/trappmartin/HilbertSchmidtIndependenceCriterion.jl)
# Hilbert-Schmidt Independence Criterion (HSIC)

This package provides basic implementations of the Hilbert-Schmidt Independence Criterion (HSIC).

# What is implemented
The package currently contains the following implementations:

- Gamma HSIC (HSIC with Gamma approximation) [1]

# Usage

The gamma HSIC can be run using:

	julia> X = randn(100) # rows are samples
	julia> Y = randn(100) * 0.2 # rows are samples
	julia> p = 0.1 # p-value (level of test)
	julia> (value, threshold) = gammaHSIC(X, Y, α = p)
	julia> independent = value < threshold

# Reference
[1] Gretton, Arthur, et al. "A kernel statistical test of independence." Advances in Neural Information Processing Systems. 2007.
