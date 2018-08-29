# Just an example of convert_a3d, never called as the array format is
# the intermediate format

# Would be called if output_format=:mcmcchains, e.g.:

#   stanmodel = Stanmodel(num_samples=1200, thin=2, name="bernoulli", 
#     model=bernoullimodel, output_format=:mcmcchains);

function convert_a3d(a3d, cnames, ::Val{:mcmcchain})
  Chains(a3d, names=cnames)
end
