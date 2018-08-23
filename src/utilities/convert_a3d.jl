# Just an example of convert_a3d, never called as the array format is
# the intermediate format

# Would be called if output_format=:mcmcchains, e.g.:

#   stanmodel = Stanmodel(num_samples=1200, thin=2, name="bernoulli", 
#   model=bernoullimodel, output_format=:mambacmcchains);

function convert_a3d(a3d, cnames, ::Val{:mcmcchains})
  println("In convert_a3d")
  #snames = [Symbol(cnames[i]) for i in 1: length(cnames)]
  #sr = getindex(a3d, [1:1:size(a3d, 1);], [1:size(a3d, 2);], [1:size(a3d, 3);])
  Chains(a3d)
end
