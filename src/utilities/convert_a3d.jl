# convert_a3d

# Function that allows federation by setting the `output_format`  in the Stanmodel().

function convert_a3d(a3d_array, cnames, ::Val{:mcmcchain})
  Chains(a3d_array, names=cnames)
end
