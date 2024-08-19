# We use pandoc/latex as a base
# it is an alpine distribution too
FROM pandoc/latex

# Install the texlive packages needed
# for the build
# - knowledge
# - currfile
# - tikz-cd
# - tikz
# we reinstall biber so that it is
# using the same version as the
# biblatex package in the texlive distribution
RUN tlmgr update --self
RUN tlmgr install     \
          knowledge   \
          currfile    \
          tikz-cd     \
          stmaryrd    \
          amsthm      \
          amsfonts    \
          amsmath     \
          thmtools    \
          upgreek     \
          standalone  \
          booktabs    \
          varwidth    \
          xparse      \
          tokcycle    \
          hyperref    \
          cleveref    \
          ifthen      \
          tikz        \
          microtype 
RUN tlmgr update biber biblatex

# we add to pandoc/latex
# the following binary packages
# - make
# - git
# - zip
# - tar (gnutar)
RUN apk add --no-cache \
    make               \
    git                \
    zip                \
    tar
