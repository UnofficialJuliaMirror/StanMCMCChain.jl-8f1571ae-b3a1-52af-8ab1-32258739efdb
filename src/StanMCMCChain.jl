module StanMCMCChain

# package code goes here
using MCMCChain, Plots, Statistics, Documenter

import CmdStan: convert_a3d
import MCMCChain: AbstractChains, Chains

include("utilities/convert_a3d.jl")

export
  convert_a3d
  
end # module
