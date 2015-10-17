#!/bin/sh
#------------------------------------------------------------------------------#
#                         (c) 2015 Ivan Reyné Ferrando                         #
#                                                                              #
#                            http://ivanreyne.ninja                            #
#------------------------------------------------------------------------------#

echo Building the documentation into \"../doc\" path

mkdir -p ../doc
scriba -o ../doc -info -t print -pdf
scriba -o ../doc -info