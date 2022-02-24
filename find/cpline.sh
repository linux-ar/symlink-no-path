#!/bin/bash

sk --ansi -i -c 'rg --color=always --line-number "{}"' --bind 'ctrl-y:execute-silent(echo {} | xclip -selection clipboard)+abort'

