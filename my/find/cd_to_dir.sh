#!/bin/bash

# fd - Find any directory and cd to selected directory
cdd() {
 export FZF_DEFAULT_OPTS='--height=95% '
 
 cd $(find . -maxdepth 4 -type d -print| fzf) && \
   clear           && \
   echo -e "\n\n"  && \
   $PREFIX/bin/exa && \
   echo -e "\n\n"

 export FZF_DEFAULT_OPTS='--height=70% --preview="cat {}" --preview-window=right:60%:wrap'
}

cdf() {
 
 pushd $(dirname $(fzf)) && \
   clear                 && \
   echo -e "\n\n"        && \
   $PREFIX/bin/exa       && \
   echo -e "\n\n"
}

