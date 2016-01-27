# Hilbert-Schmidt Independence Criterion (HSIC)

This package provides basic implementations of the Hilbert-Schmidt Independence Criterion (HSIC).

# What is implemented
The package currently contains the following implementations:

- Gamma HSIC (HSIC with Gamma approximation) [1]

# Usage

The gamma HSIC can be run using:

.. code-block:: julia

		julia> X = randn(100)
		julia> Y = randn(100) * 0.2
		julia> p = 0.1
		julia> (value, threshold) = gammaHSIC(X, Y, α = p)
		julia> independent = value < threshold

# Reference
[1] Gretton, Arthur, et al. "A kernel statistical test of independence." Advances in Neural Information Processing Systems. 2007.
