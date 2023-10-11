# Sammelsurium

*Sammelsurium* {n} smorgasbord [fig.] [diverse collection of things]

# R installation(R_conda.yml, R_install-packages.R)

List of packages that I like to use in R either via R's own package manager, or
for use in conda/mama:

        mamba env create --file R_conda.yml

The packages installed by both approaches are the same, see:

        diff -y <(grep ' *-' R_conda.yml | sed 's,^ *- [rbioconductor]*-,,g' | sort ) <( grep "^ *'" R_install-packages.R | sed "s,[' ,],,g" | tr '[:upper:]' '[:lower:]' | sort )

## R_rabbit-duck

Data as dataframe for the infamous rabbit-duck illusion in scatter plots with some additional dataset of equal mean, variance, and correlation:

|dataset     |x           |y           | Pearson correlation|
|:-----------|:-----------|:-----------|-------------------:|
|dino        |38.2 ± 18.7 |47.3 ± 35.2 |          -0.1037933|
|italy       |38.2 ± 18.7 |47.3 ± 35.2 |          -0.1037933|
|rabbit-duck |38.2 ± 18.7 |47.3 ± 35.2 |          -0.1037933|

![Scatter plot to show rabbit duck illusion](R_rabbit-duck/fun-data.jpg)

        ❯ head R_rabbit-duck/fun-data.tsv
        x	y	dataset
        25	2	rabbit-duck
        26	2	rabbit-duck
        27	2	rabbit-duck
        ...
