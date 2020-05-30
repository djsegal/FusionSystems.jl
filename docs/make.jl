using FusionSystems
using Documenter

makedocs(;
    modules=[FusionSystems],
    authors="Dan Segal <dansegal2@gmail.com> and contributors",
    repo="https://github.com/djsegal/FusionSystems.jl/blob/{commit}{path}#L{line}",
    sitename="FusionSystems.jl",
    format=Documenter.HTML(;
        prettyurls=get(ENV, "CI", "false") == "true",
        canonical="https://djsegal.github.io/FusionSystems.jl",
        assets=String[],
    ),
    pages=[
        "Home" => "index.md",
    ],
)

deploydocs(;
    repo="github.com/djsegal/FusionSystems.jl",
)
