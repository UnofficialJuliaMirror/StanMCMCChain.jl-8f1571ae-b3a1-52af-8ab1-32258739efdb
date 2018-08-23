# Just an example of convert_a3d, never called as the array format is
# the intermediate format

# Would be called if output_format=:dataframe, e.g.:

#   stanmodel = Stanmodel(num_samples=1200, thin=2, name="bernoulli", 
#   model=bernoullimodel, output_format=:mambachains);

function convert_a3d(a3d, cnames, ::Val{:mambachains})
  snames = [Symbol(cnames[i]) for i in 1: length(cnames)]
  sr = getindex(a3d, [1:1:size(a3d, 1);], [1:size(a3d, 2);], [1:size(a3d, 3);])
  Chains(sr, 1:size(a3d, 2), cnames, [i for i in 1:size(a3d, 3)])
end
