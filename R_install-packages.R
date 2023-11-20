install.packages('BiocManager')

xs <- c(
  # My bare minimum
  'assertthat',
  'conflicted',
  'devtools',
  'formatR',
  'lintr',
  'roxygen2',
  'tidyverse',
  'languageserver',
  'zeallot',
  # Plotting
  'ape',
  'corrplot',
  'cowplot',
  'dendextend',
  'directlabels',
  'ggbio',
  'ggExtra',
  'ggforce',
  'ggfortify',
  'ggplotify',
  'ggpolypath',
  'ggpubr',
  'ggrepel',
  'ggsci',
  'gplots',
  'gridGraphics',
  'magick',
  'patchwork',
  'pheatmap',
  'plotly',
  'RColorBrewer',
  'UpSetR',
  'venn',
  # For more awesome text reports
  'BiocStyle',
  'blogdown',
  'bookdown',
  'kableExtra',
  'systemfonts',
  'xaringan',
  # For collaborators
  'readxl',
  # Working with Genomic sequences and annotations
  'Biostrings',
  'BSgenome',
  'genbankr',
  'GenomeInfoDbData',
  'msa',
  'rtracklayer',
  'plyranges',
  # Transcriptomics
  'DESeq2',
  'edgeR',
  'fedup',
  'fgsea',
  'pathview',
  'IHW',
  'clusterProfiler',
  'ReportingTools',
  'RUVSeq',
  'stageR',
  'sva',
  'topGO',
  'fdrtool',
  # Graphs
  'ggkegg',
  'ggfx',
  'tidygraph',
  'ggraph',
  'networkD3',
  'WGCNA',
  # Regression / ML stuff
  'broom',
  'glmnet',
  'randomForest',
  # Some gadgets
  'dbplyr',
  'furrr',
  'multidplyr',
  'microbenchmark',
  'profmem',
  'servr',
  'tictoc',
  'xml2',
  # API for NCBI's Entrez
  'rentrez'
)

#BiocManager::install(xs, type = 'mac.binary')
BiocManager::install(xs)


# Make sure everything is really up todate
#BiocManager::install(type = 'mac.binary')
BiocManager::install()


# Temporary fix for 'systemfonts':
#withr::with_makevars(c(OBJCXX = "gcc"), install.packages('systemfonts'))


# Memo for lpsymphony
# brew tap coin-or-tools/coinor
# brew install coin-or-tools/coinor/symphony
# devtools::install_github("vladchimescu/lpsymphony")
