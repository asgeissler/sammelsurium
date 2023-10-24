# Sammelsurium

*Sammelsurium* {noun} smorgasbord [figurative] [diverse collection of things]

# Homebrew

Install [homebrew](https://brew.sh/) with

        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

        grep -v '^#' Homebrew.txt | xargs brew install

Additional nice to have things that require extra traps:

        # excellent font for coding
        brew tap homebrew/cask-fonts
        brew install font-fira-sans font-fira-code
        # sshfs: Mounting via ssh
        brew tap macos-fuse-t/homebrew-cask
        brew install fuse-t fuse-t-sshfs



# R installation(R_conda.yml, R_install-packages.R)

List of packages that I like to use in R either via R's own package manager, or
for use in conda/mama:

        mamba env create --file R_conda.yml

The packages installed by both approaches are the same, see:

        diff -y <(grep ' *-' R_conda.yml | sed 's,^ *- [rbioconductor]*-,,g' | sort ) <( grep "^ *'" R_install-packages.R | sed "s,[' ,],,g" | tr '[:upper:]' '[:lower:]' | sort )

### Mac OS Silicon

State October 2023, bioconda does not yet support the silicon (M1/M2) CPU
architecture. However, the conda environment can still be used with:

        CONDA_SUBDIR=osx-64 mamba env create --file R_conda.yml
        mamba activate arr
        conda config --env --set subdir osx-64

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


# R_slides.Rmd

Template for making slides in R, based on a template by [Claus Ekstrøm](https://publichealth.ku.dk/staff/?pure=en/persons/114029).

# Python installation (python_conda.yml)

List of packages that I like to use in a python:

        mamba env create --file python_conda.yml
        mamba activate pie
        python3
        ...

# LaTeX_report.tex

As the name suggest a simple template for LaTeX based reports.



# Other 

The workflow manager [Snakemake](https://snakemake.readthedocs.io/en/stable/) is
fairly frequently used, so I like to have it in the base mamba environment:

        mamba install -c bioconda -n base snakemake

Copy `vimrc` and `zshrc` as dot-files to `$HOME` and install dependencies, as
listed in the files.
