# pak package is implicitly already installed when using `rig`

xs <- c(
  # My bare minimum
  'assertthat',
  'conflicted',
  'devtools',
  'formatR',
  'lintr',
  'jsonlite',
  'renv',
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
  'rsvg',
  'treemapify',
  'UpSetR',
  'venn',
  # For more awesome text reports
  'BiocStyle',
  'blogdown',
  'bookdown',
  'gt',
  'kableExtra',
  'systemfonts',
  'xaringan',
  'webshot2',
  # For collaborators
  'readxl',
  # Working with Genomic sequences and annotations
  'Biostrings',
  'BSgenome',
  #'genbankr',
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
  'enrichplot',
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
  'RCy3', # interacts with cytoscape
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

# pak somehow fails when installing all at the same time with the dependencies
#pak::pkg_install(xs)

# Install individually, I guess
for (i in xs) {
  pak::pkg_install(i)
}
