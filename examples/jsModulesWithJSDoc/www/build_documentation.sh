#!/bin/sh
#------------------------------------------------------------------------------#
#                         (c) 2015 Ivan Reyné Ferrando                         #
#                                                                              #
#                            http://ivanreyne.ninja                            #
#------------------------------------------------------------------------------#

echo Building the JSDoc documentation into \"../doc/jsdoc\" path
rm -rf ../doc/jsdoc/*
yuidoc -o ../doc/jsdoc ./js_src/app/

echo Building the Scriba documentation into \"../scriba/\" path
rm -rf ../doc/scriba/*
scriba -o ../doc/scriba -i ./js_src/app/ -jsdoc ../jsdoc -t print -pdf
scriba -o ../doc/scriba -i ./js_src/app/ -jsdoc ../jsdoc
