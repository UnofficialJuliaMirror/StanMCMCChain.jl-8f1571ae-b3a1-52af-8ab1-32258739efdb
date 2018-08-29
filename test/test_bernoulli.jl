using CmdStan, StanMCMCChain, Test, Statistics

ProjDir = joinpath(dirname(@__FILE__), "..", "examples", "Bernoulli")
cd(ProjDir) do

  isdir("tmp") &&
    rm("tmp", recursive=true);
    
    #=
    ProjDir = dirname(@__FILE__)
    cd(ProjDir) do

      bernoullimodel = "
      data { 
        int<lower=1> N; 
        int<lower=0,upper=1> y[N];
      } 
      parameters {
        real<lower=0,upper=1> theta;
      } 
      model {
        theta ~ beta(1,1);
        y ~ bernoulli(theta);
      }
      "

      observeddata = [
        Dict("N" => 10, "y" => [0, 1, 0, 1, 0, 0, 0, 0, 0, 1]),
        Dict("N" => 10, "y" => [0, 1, 0, 0, 0, 0, 1, 0, 0, 1]),
        Dict("N" => 10, "y" => [0, 0, 0, 0, 0, 0, 1, 0, 1, 1]),
        Dict("N" => 10, "y" => [0, 0, 0, 1, 0, 0, 0, 1, 0, 1])
      ]

      global stanmodel, rc, chains, cnames
      stanmodel = Stanmodel(num_samples=1200, thin=2, name="bernoulli", 
        model=bernoullimodel, output_format=:mcmcchain);

      rc, chains, cnames = stan(stanmodel, observeddata, ProjDir, diagnostics=false,
        CmdStanDir=CMDSTAN_HOME);
  
    end # cd
    =#
    
    include("../examples/Bernoulli/bernoulli.jl")

    @test 0.1 <  mean(chains.value[:, 8, :] ) < 0.6
  
  isdir("tmp") &&
    rm("tmp", recursive=true);

end # cd
