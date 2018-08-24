module StanMCMCChains

# package code goes here
using MCMCChain, Statistics, Documenter

import CmdStan: convert_a3d
import MCMCChain: AbstractChains, Chains

include("utilities/convert_a3d.jl")

export
  convert_a3d
  
end # module
