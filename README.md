# StanMCMCChain

[![Build Status](https://travis-ci.org/StanJulia/StanMCMCChain.jl.svg?branch=master)](https://travis-ci.org/StanJulia/StanMCMCChain.jl)

[![Coverage Status](https://coveralls.io/repos/StanJulia/StanMCMCChain.jl/badge.svg?branch=master&service=github)](https://coveralls.io/github/StanJulia/StanMCMCChain.jl?branch=master)

[![codecov.io](http://codecov.io/github/StanJulia/StanMCMCChain.jl/coverage.svg?branch=master)](http://codecov.io/github/StanJulia/StanMCMCChain.jl?branch=master)


## Introduction

This package converts the output produced by CmdStan.jl to a TuringLang/Chains object suitable for further processing by the [MCMCChain](https://github.com/TuringLang/MCMCChain.jl) package.

## Usage

In the definition of the Stanmodel, request the output_format=:mcmcchains:

```
  stanmodel = Stanmodel(num_samples=1200, thin=2, name="bernoulli", 
    model=bernoullimodel, output_format=:mcmcchains);
```

The subsequent call to stan() will now return a MCMCChain.Chains object in chains:

```
  rc, chains, cnames = stan(stanmodel, observeddata, ProjDir, diagnostics=false,
    CmdStanDir=CMDSTAN_HOME);
```
