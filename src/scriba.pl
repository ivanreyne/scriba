#!/usr/bin/perl -w
#------------------------------------------------------------------------------#
#                         (c) 2015 Ivan Reyné Ferrando                         #
#                                                                              #
#                            http://ivanreyne.ninja                            #
#------------------------------------------------------------------------------#

use strict;
use diagnostics;
use File::Basename;
use Data::Dumper;
use Cwd 'abs_path';

# scrb: Document: UserGuide
# scrb: Chapter: 1. Introduction
#
# Scriba is a tool to generate documentation from source code. The content
# of the documentation is extracted directly from the source code and/or any
# other files found on the project tree.
# Unlike many other tools Scriba does not generate API-like documentation
# neither the generated documentation necessarily follows the same
# structure as the source code.
# _
# The purpose of Scriba is to provide an easy way to have source code and
# documentation mixed on the same set of files. The problem Scriba wants to
# solve is the mismatch between code and documentation that tends to occur
# on the life-cycle of a project, specially as the project grows older.
# What usually happens is that developers are busy producing code that
# works, and as documents are kept on completely different folder structures
# they never go and keep them up to date. Hopefully this script will be
# of great help for developers, specially on Agile and Extreme Programming
# environments where for their nature changes on the code happen a lot
# more often.
# _
# The main goal of Scriba is that we do not hinder the normal development
# work in any way:
# * Scriba should not to give any extra work to the developers to create
#   the documentation.
# * Scriba should not interfere with any other software documentation
#   tools.
# * Scriba should not pollute the source code with strange syntax or extra
#   sections.
# * Scriba documentation should be able to be used as code comments and the
#   code comments should also be able to be used as Scriba documentation.
#
# With those principles in mind we made Scriba use the normal code comments
# sections to take the contents of the documents it will generate. We also
# have given the ability to format the text in a way that can easily be
# read as a normal text file but that will render nicely when exporting as
# a proper document.

# scrb: Document: DeveloperGuide
# scrb: Chapter: 1. Introduction
#
# Scriba is written in Perl. A single Perl script, at the moment, with no
# extra custom libraries. The structure of the code itself follows a few
# simple rules:
# * Creating as many functions as needed to separated the processes.
# * The functions are organised at the top of the script file.
# * The body of the script contains as little code as possible, calling the
#   previously defined.
# * As we use it as an example we will exaggerate a bit with the comments! :-D
#
# We try to maintain the code itself clean even though we are not following
# any specific coding standards.
# _
# The variable names have a one letter (or more, for references) prefix that
# denotes their type:
# * b: boolean
# * i: integer numbers
# * f: floating point numbers
# * s: strings
# * a: arrays
# * h: hashes
# * o: objects
# * ref: reference to ...
#
# scrb: Chapter: 2. Function Descriptions
#
# This section gives a quick description of the functions.

#-------------------------------------------------------------------------------
# scrb: Document: DeveloperGuide
# scrb: Chapter: 2.1. help
# scrb: 2
#
# Prints the help screen with the command line usage.
#
# Parameters:
#   -
#
# Returns:
#   -
#-------------------------------------------------------------------------------
sub help {

# scrb: Document: UserGuide
# scrb: Chapter: 2.1. Installation
#
# There is no installation as such, at the moment. To be able to use the
# Scriba command line script the reccomendation is to simply create a link
# to the src/scriba.pl on you local/user bin directory.
#
# <div class="code">
# > cd ~/bin<br/>
# > ln -s ~/dev/scriba/src/scriba.pl scriba
# </div>
#
# scrb: Chapter: 2.2. Command Line Usage
#
# Srciba runs on the command line on Linux based system. It is a Perl script
# that uses some standard Linux commands to perform some of the actions. For
# example we use the "find" command to be able to find and filter the files
# we will process for documentation contents.
# _
# The script command line accepts the following parameters:
# _
# <div class="code">
# scriba [-i \<path\>] [-ifind \<find command parameters\>] [-o \<output path\>]
# [-t \<template name\>] [-jsdoc \<jsdoc URL\>] [-pdf] [-info] [-infoinline]
# _
# * -i \<path\>: path to the input directory Scriba will process in order
#   to extract all the document creation section.<br/>
#   Default: "./"
# * -ifind \<find command parameters\>: parameters to pass to find in order
#   to give better control of which files Scriba will use when looking into
#   files in order to find the document data.<br/>
#   Default: ""
# * -o \<output path\>: the output directory path where we will create the
#   documents stored in the given source code.<br/>
#   Default: "./ScribaGen/"
# * -t \<template name\>: the name of the templates we will use to render
#   the generated documents, the software is distributed with two templates
#   "default" and "print".<br/>
#   Default: "default"
# * -jsdoc \<jsdoc URL\>: tells Scriba to parse JSDoc information and to
#   generate links whenever a module or function is referenced on the
#   Scriba comments. The modules are referenced simply by
#   stating their names as they appear on the JSDoc definition. For functions
#   you need to write them in the form of Module.Function.<br/>
#   Default: no JSDoc
#   processing.
# * -pdf: Tells Scriba to generate a PDF file on top of the default HTML
#   generated using an external tool.<br/>
#   Default: no PDF generated
# * -info: Tells Scriba to print on the console a summary of lines of code,
#   comments and Scriba comments.<br/>
#   Default: no info printed
# * -infoinline: Tells Scriba to add to the generated document embedded inline
#   information on what sections come from what files. It is useful for debug
#   purposes.<br/>
#   Default: no inline debug information on output
# </div>
#
    print "Scriba is a tool to generate documentation from source code. The content of the documentation is extracted directly from the source code and/or any other files found on the project tree. The purpose of Scriba is to provide an easy way to have source code and documentation mixed on the same set of files. The problem Scriba wants to solve is the mismatch between code and documentation that tends to happen on the life-cycle of a project.\n\n".
          "Usage:\n".
          "    scriba [-i <path>] [-ifind <find command parameters>] ".
          "[-o <output path>] [-t <template name>] [-jsdoc <jsdoc URL>] ".
          "[-pdf] [-info] [-infoinline]\n\n".
          "You can specify the arguments in any order.\n\n".
          "The script command line accepts the following parameters:\n".
          "-i <path>: path to the input directory Scriba will process in order to extract all the document creation section.\n".
          "    Default: \"./\"\n".
          "-ifind <find command parameters>: parameters to pass to find in order to give better control of which files Scriba will use when looking into files in order to find the document data.\n".
          "    Default: \"\"\n".
          "-o <output path>: the output directory path where we will create the documents stored in the given source code.\n".
          "    Default: \"./ScribaGen/\"\n".
          "-t <template name>: the name of the templates we will use to render the generated documents, the software is distributed with two templates \"default\" and \"print\".\n".
          "    Default: \"default\"\n".
          "-jsdoc <jsdoc URL>: tells Scriba to parse JSDoc information and to generate links whenever a module or function is referenced on the Scriba comments. The modules are referenced simply by stating their names as they appear on the JSDoc definition. For functions you need to write them in the form of Module.Function.\n".
          "    Default: no JSDoc\n".
          "-pdf: Tells Scriba to generate a PDF file on top of the default HTML generated using an external tool.\n".
          "    Default: no PDF generated\n".
          "-info: Tells Scriba to print on the console a summary of lines of code, comments and Scriba comments.\n".
          "    Default: no info printed\n".
          "-infoinline: Tells Scriba to add to the generated document embedded inline information on what sections come from what files. It is useful for debug purposes.\n".
          "    Default: no inline debug information on output\n".
          "\n";
}

#-------------------------------------------------------------------------------
# scrb: Document: DeveloperGuide
# scrb: Chapter: 2.2. checkArguments
# scrb: 2
#
# Checks the arguments passed to the script. We need to have at
# least one argument.
#
# Parameters:
#   $refaArguments:  Reference to the arguments array.
#   $refhParameters: Reference to the hash where we will store information
#                    about the arguments passed to the script.
#
# Returns:
#   1 -> Success.
#   0 -> Some problem while parsing the arguments.
#-------------------------------------------------------------------------------
sub checkArguments {
    my($refaArguments, $refhParameters) = @_;

    my $iReturn = 0;

    for(my $iNumArg = 0; $iNumArg < scalar(@{$refaArguments}); $iNumArg ++) {
        # Mandatory arguments.
        if($refaArguments->[$iNumArg] eq "-i") {
            $iNumArg ++;
            $refhParameters->{INPUT_DIR} = $refaArguments->[$iNumArg];
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-ifind") {
            $iNumArg ++;
            $refhParameters->{FIND_ARGS} = $refaArguments->[$iNumArg];
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-o") {
            $iNumArg ++;
            $refhParameters->{OUTPUT_DIR} = $refaArguments->[$iNumArg];
            if($refhParameters->{OUTPUT_DIR} !~ /\/$/) {
                $refhParameters->{OUTPUT_DIR} .= '/';
            }
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-jsdoc") {
            $iNumArg ++;
            $refhParameters->{OUTPUT_JSDOC} = $refaArguments->[$iNumArg];
            if($refhParameters->{OUTPUT_JSDOC} !~ /\/$/) {
                $refhParameters->{OUTPUT_JSDOC} .= '/';
            }
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-pdf") {
            $refhParameters->{OUTPUT_PDF} = 1;
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-t") {
            $iNumArg ++;
            $refhParameters->{TEMPLATE} = $refaArguments->[$iNumArg];
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-info") {
            $refhParameters->{INFO} = 1;
            $iReturn = 1;
        }
        elsif($refaArguments->[$iNumArg] eq "-infoinline") {
            $refhParameters->{INFO_INLINE} = 1;
            $iReturn = 1;
        }
    }
    # Checking we have all the mandatory arguments.
    #if($iReturn == 3) { $iReturn = 1; }
    #else { $iReturn = 0; }

    $iReturn;
}

#-------------------------------------------------------------------------------
# scrb: Document: DeveloperGuide
# scrb: Chapter: 2.3. readTemplates
# scrb: 2
#
# Reads the templates we are going to need to render the documentation.
#
# Parameters:
#   $refhParameters: Reference to the hash where we will store information
#                    about the arguments passed to the script.
#   $refhTemplates:  Reference to the hash where we will store the templates.
#
# Returns:
#   1 -> Success.
#   0 -> Some problem while parsing the arguments.
#-------------------------------------------------------------------------------
sub readTemplates {
    my($refhParameters, $refhTemplates) = @_;

    my $iReturn = 1;
    my $sLine = "";

    # reading the document template
    if(!(open(FILE, "<$refhTemplates->{BASE_PATH}document.html"))) {
        # If the file is not readable we will give a little message.
        print "ERROR: Could not open the file '$refhTemplates->{BASE_PATH}document.html'.\n".
              "       Please Check if the file has read permisions and that the name is correct.\n";
    }
    else {
        $refhTemplates->{DOCUMENT} = "";
        my $sLine = "";
        while($sLine = <FILE>) {
            $refhTemplates->{DOCUMENT} .= $sLine;
        }
        close (FILE);
    }

    # reading the chapter template
    if(!(open(FILE, "<$refhTemplates->{BASE_PATH}chapter.html"))) {
        # If the file is not readable we will give a little message.
        print "ERROR: Could not open the file '$refhTemplates->{BASE_PATH}chapter.html'.\n".
              "       Please Check if the file has read permisions and that the name is correct.\n";
    }
    else {
        $refhTemplates->{CHAPTER} = "";
        my $sLine = "";
        while($sLine = <FILE>) {
            $refhTemplates->{CHAPTER} .= $sLine;
        }
        close (FILE);
    }

    # reading the index entry template
    if(!(open(FILE, "<$refhTemplates->{BASE_PATH}index_entry.html"))) {
        # If the file is not readable we will give a little message.
        print "ERROR: Could not open the file '$refhTemplates->{BASE_PATH}index_entry.html'.\n".
              "       Please Check if the file has read permisions and that the name is correct.\n";
    }
    else {
        $refhTemplates->{INDEX_ENTRY} = "";
        my $sLine = "";
        while($sLine = <FILE>) {
            $refhTemplates->{INDEX_ENTRY} .= $sLine;
        }
        close (FILE);
    }

    $iReturn;
}

#-------------------------------------------------------------------------------
# scrb: Document: DeveloperGuide
# scrb: Chapter: 2.4. processFiles
# scrb: 2
#
# Processes the input directories looking for the project files and looks in
# everyone of them if there are any comment sections that need to be used
# as source for documentation.
#
# Parameters:
#   $refhParameters:   Reference to the hash where we will store information
#                      about the arguments passed to the script.
#   $refhDocStructure: Reference to the hash where we will store the
#                      information extracted from the source files.
#   $refhFileInfo:     Reference to the hash where we will store information
#                      about the number of lines, comments, Scriba comments,
#                      etc.
#
# Returns:
#   1 -> Success.
#   0 -> Some problem while parsing the arguments.
#-------------------------------------------------------------------------------
sub processFiles {
    my($refhParameters, $refhDocStructure, $refhFileInfo) = @_;

    my $iReturn = 1;

    # scrb: Document: UserGuide
    # scrb: Chapter: 2. How Does it Work?
    #
    # Scriba creates a list of text files to process using the Linux _find_
    # command on the directory specified by the _-i_ command line argument.
    # We can also pass extra parameters to the find command with the _-ifind_
    # parameter. This can be useful in case we need to exclude certain
    # directories from the source code processing.
    # For example, to exclude all the files from the "ckeditor" folder
    # we can do:
    # <div class="code">
    # \> scriba -o doc -ifind '! -path "*/ckeditor/*"'
    # </div>
    # _
    my @aFiles = ();
    @aFiles = `find $refhParameters->{INPUT_DIR} -type f $refhParameters->{FIND_ARGS} -exec grep -Iq . \{\} \\; -and -print`;
    chomp(@aFiles);
    # keeping jsDoc information
    $refhFileInfo->{JSDOC} = {};
    $refhFileInfo->{JSDOC}{CLASSES} = {};

    # scrb:
    # Each file is processed to look for Scriba encoded information. The order
    # in which the files are processed is not important as Scriba generates
    # the documents according to the section names and numbers as defined
    # in the contents of the files and that is completely independent on the
    # file they are defined into._
    my $sFile = "";
    foreach $sFile (@aFiles) {
        if(!(open(FILE, "<$sFile"))) {
            # If the file is not readable we will give a little message.
            print "ERROR: Could not open the file '$sFile'.\n".
                  "       Please Check if the file has read permisions and that the name is correct.\n";
        }
        else {
            # keeping statistical information
            $refhFileInfo->{$sFile} = {};
            $refhFileInfo->{$sFile}{NUM_LINES} = 0;
            $refhFileInfo->{$sFile}{NUM_COMMENTS} = 0;
            $refhFileInfo->{$sFile}{NUM_Scriba_COMMENTS} = 0;

            # document structure defaults
            my $sDocument = 'Undefined';
            my $sChapter = 'Undefined';
            my $sJsDocClass = 'Undefined';
            # file processing variables
            my $sLine = "";
            my $sCleanLine = "";
            my $sCleanCode = "";
            my $sCleanCodeSpaces = "";
            my $bInComments = 0;
            my $bInCommentsCode = 0;
            my $bInCommentsLimit = 0;
            # to mark if we are in an "ul/ol" section
            my $bInList = 0;
            # scrb:
            # Scriba will read the files and each time it detects that
            # we are inside a comments section the software will check if that
            # comment section contains any of the Scriba tags.
            # If a Scriba tag is found it means that the given comment
            # is going to be part of the generated documentation contents.
            # Any content after the initial Scriba tag and until the end of
            # the comment section will be put on the generated document.
            # All that information is kept in memory so we can define and/or
            # add information on the same generated document from completely
            # different source files in completely different directories.
            # _
            while($sLine = <FILE>) {
                # scrb: Chapter: 2.3. Scriba Sections and Functionality
                $sCleanLine = "";
                # counting source code lines
                $refhFileInfo->{$sFile}{NUM_LINES} ++;
                chomp($sLine);

                # scrb:
                # At the moment we have done extensive tests both in Perl and
                # JavaScript. In theory it should also work on C/C++/Java/...
                # but more languages are going to be added in the future.
                # _

                # detecting if we are in a comments section
                my $bComment = 0;
                # C/C++/Perl/etc
                if($sLine =~ /^\s*\*\//) {
                    $bComment = 1;
                    $sCleanLine = '';
                }
                elsif($sLine =~ /^\s*\/\*+\s*(.*)\*\/\s*$/) {
                    $bComment = 1;
                    $sCleanLine = $1;
                }
                elsif($sLine =~ /^\s*\/\*+\s*(.*)$/) {
                    $bComment = 1;
                    $sCleanLine = $1;
                }
                elsif($sLine =~ /^\s*[#*]\s*(.*)$/) {
                    $bComment = 1;
                    $sCleanLine = $1;
                }
                elsif($sLine =~ /^\s*\/\/\s*(.*)$/) {
                    $bComment = 1;
                    $sCleanLine = $1;
                }
                # extracting jsDoc info to be able to use it in our
                # documentation
                if($bComment) {
                    if($sCleanLine =~ /\@class\s+(.+?)\b/) {
                        $sJsDocClass = $1;
                        $refhFileInfo->{JSDOC}{CLASSES}{$sJsDocClass} = {};
                        $refhFileInfo->{JSDOC}{CLASSES}{$sJsDocClass}{METHODS} = [];
                        $refhFileInfo->{JSDOC}{CLASSES}{$sJsDocClass}{VARIABLES} = [];
                    }
                    if($sCleanLine =~ /\@method\s+(.+?)\b/) {
                        if($sJsDocClass ne 'Undefined') {
                            push(@{$refhFileInfo->{JSDOC}{CLASSES}{$sJsDocClass}{METHODS}}, $1);
                        }
                    }
                }

                # detecting is a comments section has ended
                if(!$bComment) {
                    $bInComments = 0;
                }
                else {
                    # counting source code lines
                    $refhFileInfo->{$sFile}{NUM_COMMENTS} ++;
                }

                # scrb: Chapter: 2.3.1. Document Organization
                #
                # All the Scriba sections are comments which their initial
                # characters are *scrb:* The content of the section will be
                # stored to be part of the documentation. The section ends
                # when the comment section ends._
                # As we are simply putting the content from the source code
                # into the generated HTML document we can use any HTML tag
                # to format the output. But as reading the source from the
                # text file could become complicated Scriba provides some
                # easy to read short-codes that will transform into the
                # proper HTML tag without loosing clarity on the plain text.
                # <div class="code">
                # // scrb:_
                # // This section will be part of the documentation.
                # </div>
                # _

                # detecting if we have started a Scriba comment section
                if($bComment && !$bInComments) {
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*(\d+)?/) {
                        $bInComments = 1;
                        $bInCommentsLimit = 0;
                    }
                }

                # if we are in a Scriba comments section
                if($bInComments) {
                    # scrb:
                    # If we find a Scriba section marker followed by a number
                    # *scrb: X* it means that the Scriba section does not end
                    # at the end of the comment but after _X_ lines of
                    # comments that are empty._
                    # This feature is particularly useful when you want to
                    # integrate and reuse comments from other tools or purposes
                    # to be included as part of the generated documentation.
                    # <div class="code">
                    # // scrb: 2_
                    # // This section will be part of the documentation._
                    # // This section will also be part of the documentation._
                    # //_
                    # // This section will also be part of the documentation._
                    # //_
                    # // This section will *NOT* be part of the documentation_
                    # // as it is part of some other documentation system like_
                    # // JSDoc information._
                    # </div>
                    # _

                    # detecting if we are limiting the comment paragraphs for
                    # this section
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*(\d+)?/) {
                        if($1) {
                            $bInComments = $1;
                            $bInCommentsLimit = 1;
                        }
                    }
                    # scrb: Chapter: 2.3.2. Document Formatting
                    #
                    # If inside a Scriba section we find a line (or a series
                    # of lines) starting with an *asterisk* Scriba will
                    # transform them into an unordered list section.
                    # <div class="code">
                    # // * Item 1_
                    # // * Item 2_
                    # // * Item 3_
                    # // * Item 4_
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # * Item 1_
                    # * Item 2_
                    # * Item 3_
                    # * Item 4_
                    # </div>
                    # _

                    # processing the line for inline text formating:
                    # "ul" sections
                    if($sCleanLine =~ /^\s*\*\s+(.+)/) {
                        if(!$bInList) {
                            $sCleanLine = "<ul><li>$1";
                            $bInList = 1;
                        }
                        else {
                            $sCleanLine = "</li><li>$1";
                        }
                    }

                    # scrb:
                    # If inside a Scriba section we find a line (or a series
                    # of lines) starting with a *hash* Scriba will
                    # transform them into an ordered list section.
                    # <div class="code">
                    # // # Item 1_
                    # // # Item 2_
                    # // # Item 3_
                    # // # Item 4_
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # # Item 1_
                    # # Item 2_
                    # # Item 3_
                    # # Item 4_
                    # </div>
                    # _

                    # "ol" sections
                    if($sCleanLine =~ /^\s*\#\s+(.+)/) {
                        if(!$bInList) {
                            $sCleanLine = "<ol><li>$1";
                            $bInList = 2;
                        }
                        else {
                            $sCleanLine = "</li><li>$1";
                        }
                    }
                    # "ul" sections end
                    if(($bInList == 1) && ($sCleanLine eq "")) {
                        $sCleanLine = "</ul>";
                        $bInList = 0;
                    }
                    # "ol" sections end
                    if(($bInList == 2) && ($sCleanLine eq "")) {
                        $sCleanLine = "</ol>";
                        $bInList = 0;
                    }

                    # scrb:
                    # If inside a Scriba section we find a comment line that
                    # contains only an *underscore* this will tell Scriba to
                    # insert a _paragraph break_ at that point._
                    # If we find the *underscore* at the end of a line this
                    # will tell Scriba to insert a _line break_ at that point.
                    # <div class="code">
                    # // AAAA content, AAAA content, AAAA content, AAAA content_
                    # // AAAA content, AAAA content, AAAA content, AAAA content_
                    # // \__
                    # // BBBB content, BBBB content, BBBB content, BBBB content\__
                    # // BBBB content, BBBB content, BBBB content, BBBB content_
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # AAAA content, AAAA content, AAAA content, AAAA content
                    # AAAA content, AAAA content, AAAA content, AAAA content
                    # _
                    # BBBB content, BBBB content, BBBB content, BBBB content_
                    # BBBB content, BBBB content, BBBB content, BBBB content
                    # </div>
                    # _

                    # paragraph break
                    if($sCleanLine eq "_") {
                        # having in mind we could have a paragraph break after
                        # a "ul" section
                        if($bInList == 1) {
                            $sCleanLine = "</ul></p><p>";
                            $bInList = 0;
                        }
                        elsif($bInList == 2) {
                            $sCleanLine = "</ol></p><p>";
                            $bInList = 0;
                        }
                        else {
                            $sCleanLine = "</p><p>";
                        }
                    }

                    # scrb:
                    # We can apply some basic formats to the text we are
                    # typing just by enclosing between special characters.
                    # <div class="code">
                    # // *asterisks* for bold: \*AAAA AAAA\* content_
                    # // *underscores* for italic: \_BBBB BBBB\_ content_
                    # // *pluses* for underline: \+CCCC CCCC\+ content_
                    # // *minuses* for strikeout: \-DDDD DDDD\- content_
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # *asterisks* for bold: content *AAAA AAAA* content_
                    # *underscores* for italic: _BBBB BBBB_ content_
                    # *pluses* for underline: +CCCC CCCC+ content_
                    # *minuses* for strikeout: -DDDD DDDD- content_
                    # </div>
                    # _

                    # bold text
                    $sCleanLine =~ s/(?<!\\)\*([\w\s;:,.-]*?\S)(?<!\\)\*/<b>$1<\/b>/g;
                    # italic text
                    $sCleanLine =~ s/(?<!\\)_([\w\s;:,.-]*?\S)(?<!\\)_/<i>$1<\/i>/g;
                    # underline text
                    $sCleanLine =~ s/(?<!\\)\+([\w\s;:,.-]*?\S)(?<!\\)\+/<u>$1<\/u>/g;
                    # strike through text
                    $sCleanLine =~ s/(?<!\\)\-([\w\s;:,.-]*?\S)(?<!\\)\-/<s>$1<\/s>/g;

                    # scrb:
                    # As the greater and less than symbols have special meaning
                    # in HTML we are going to need to escape them. If you want
                    # to use a \< or a \> you need to precede them with
                    # one backslash: &#92;&lt; and or &#92;&gt;.
                    # You can also use the HTML entity codes: \&lt; and \&gt;
                    # <div class="code">
                    # // &#92;&lt;_
                    # // &#92;&gt;
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # \<_
                    # \>
                    # </div>
                    # _
                    $sCleanLine =~ s/\\</&lt;/g;
                    $sCleanLine =~ s/\\>/&gt;/g;
                    # scrb:
                    # As the ampersand has special meaning when coding HTML
                    # entities we are going to need to escape them if we want
                    # to use them. If you want to use a &amp;
                    # you need to precede it with one backslash: &#92;&amp;
                    # You can always use the HTML entity: \&amp;
                    # <div class="code">
                    # // &#92;&amp;
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # \&
                    # </div>
                    # _
                    $sCleanLine =~ s/\\&/&amp;/g;
                    # If we simply want to have a line break at the end of
                    # the line we can use the underscore character to mark
                    # that.
                    $sCleanLine =~ s/_$/<br\/>/g;
                    # scrb:
                    # Scriba also provides the ability to escape any character
                    # in case it is useful:
                    # <div class="code">
                    # // &#92;&#92;_
                    # // &#92;A
                    # </div>
                    # _
                    # Will be rendered the following way:
                    # <div class="example">
                    # \\_
                    # \A
                    # </div>
                    # _
                    $sCleanLine =~ s/\\(.)/$1/g;

                    # counting source code lines
                    $refhFileInfo->{$sFile}{NUM_Scriba_COMMENTS} ++;

                    # scrb: Chapter: 2.3.1. Document Organization
                    #
                    # Perhaps the most important feature is the way Scriba
                    # organizes documents and chapters. The way it works is
                    # that the Scriba software starts processing a file for
                    # Scriba document sections. There are two special
                    # section tags that tell to what *Document* and *Chapter*
                    # the next Scriba comments belong to. This is valid until
                    # the next time another document or chapter section
                    # occur._
                    # This means that once a document and chapter have been
                    # defined the next Scriba comments will all go into that
                    # specific chapter._
                    # For example this text is a good few comments below
                    # the following definition:
                    # <div class="code">
                    # // scrb: Document: UserGuide_
                    # // scrb: Chapter: 2.3. Scriba Sections and Functionality
                    # </div>
                    # _
                    # Note that the name of the _document_ is going to be
                    # used as the file name for the document._
                    # Note that the chapter numbering has an implication on
                    # the type of HTML _heading_ tag Scriba will use and
                    # the way the document index will look like. The numbering
                    # format Scriba understands follows the following
                    # pattern:
                    # <div class="code">
                    # \<0-9\>+.[\<0-9\>+.[\<0-9\>+.[etc]]]
                    # </div>
                    # This means that X. AAAA will be an H1 type of heading._
                    # This means that X.Y. AAAA will be an H2 type of heading._
                    # This means that X.Y.Z. AAAA will be an H3 type of heading._
                    # _
                    my $bProcessed = 0;
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s+Document:\s*(.+)\s*$/) {
                        $sDocument = $1;
                        $bProcessed = 1;
                    }
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s+Chapter:\s*(.+)\s*$/) {
                        $sChapter = $1;
                        $bProcessed = 1;
                        # creating the data structure to store the
                        # documentation information
                        if(!exists $refhDocStructure->{$sDocument}{$sChapter}) {
                            $refhDocStructure->{$sDocument}{$sChapter} = {};
                            $refhDocStructure->{$sDocument}{$sChapter}{FILE_ID} = [];
                            $refhDocStructure->{$sDocument}{$sChapter}{CONTENT} = "";
                        }
                        push(@{$refhDocStructure->{$sDocument}{$sChapter}{FILE_ID}}, $sFile . " " . $refhFileInfo->{$sFile}{NUM_LINES});
                    }
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*(\d+)?\s*$/) {
                        $bProcessed = 1;
                    }
                    elsif($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*code\s*begin\s*$/) {
                        $bProcessed = 1;
                    }
                    elsif($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*code\s*end\s*$/) {
                        $bProcessed = 1;
                    }
                    # if we are in a Scriba comment section with limit then
                    # we decrease the counter with each blanc line of comments
                    if($bInCommentsLimit && ($sCleanLine eq "")) {
                        $bInComments--;
                    }

                    if(!$bProcessed) {
                        if(($sDocument ne 'Undefined') && ($sChapter ne 'Undefined')) {
                            if(!exists $refhDocStructure->{$sDocument}) {
                                $refhDocStructure->{$sDocument} = {};
                            }
                            # creating the data structure to store the
                            # documentation information
                            if(!exists $refhDocStructure->{$sDocument}{$sChapter}) {
                                $refhDocStructure->{$sDocument}{$sChapter} = {};
                                $refhDocStructure->{$sDocument}{$sChapter}{FILE_ID} = [];
                                $refhDocStructure->{$sDocument}{$sChapter}{CONTENT} = "";
                            }
                            $refhDocStructure->{$sDocument}{$sChapter}{CONTENT} .= $sCleanLine . " ";
                        }
                    }
                    #print "'" . $sCleanLine . "'\n";
                }
                # scrb: Chapter: 2.3.2. Document Formatting
                # We can also create a special Scriba section that will contain
                # code taken directly from the application source. We mark
                # the place where we want to start dumping code with the
                # special key "scrb: code begin" and it will dump everything
                # until we find "scrb: code end".
                # <div class="code">
                # // scrb: code begin_
                # real application code_
                # // scrb: code end
                # </div>
                # _
                # This will be rendered the following way:

                # scrb: code begin
                if($bInCommentsCode) {
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*code\s*end/) {
                        $bInCommentsCode = 0;
                        # replacing some special characters
                        $sCleanCode =~ s/</&lt;/g;
                        $sCleanCode =~ s/>/&gt;/g;
                        $sCleanCode =~ s/\n/<br \/>/g;
                        # adding the code within code sections
                        $refhDocStructure->{$sDocument}{$sChapter}{CONTENT} .= '<pre class="code source_code">';
                        $refhDocStructure->{$sDocument}{$sChapter}{CONTENT} .= $sCleanCode;
                        $refhDocStructure->{$sDocument}{$sChapter}{CONTENT} .= '</pre>';
                    }
                    else {
                        # removing as many initial blank spaces as the first
                        # initial line has
                        if($sCleanCode eq "") {
                            if($sLine =~ /^(\s+)/) {
                                $sCleanCodeSpaces = $1;
                            }
                        }
                        $sLine =~ s/^$sCleanCodeSpaces//;
                        $sCleanCode .= $sLine . "\n";
                    }
                }
                # scrb: code end

                # detecting if we have started a special Scriba code dump
                # comment section
                if($bComment && !$bInCommentsCode) {
                    if($sCleanLine =~ /^\s*$refhParameters->{Scriba_ID}\s*code\s*begin/) {
                        $bInCommentsCode = 1;
                        $sCleanCode = "";
                        $sCleanCodeSpaces = "";
                    }
                }
            }
            close (FILE);
        }
    }

    $iReturn;
}

#-------------------------------------------------------------------------------
# scrb: Document: DeveloperGuide
# scrb: Chapter: 2.5. createDocuments
# scrb: 2
#
# This function takes as input the document information extracted from the
# source code files and renders the documents using the templates specified
# by the user on the command line.
#
# Parameters:
#   $refhParameters:   Reference to the hash where we will store information
#                      about the arguments passed to the script.
#   $refhDocStructure: Reference to the hash where we will store the
#                      information extracted from the source files.
#   $refhTemplates:    Reference to the hash where we will store the templates.
#   $refhFileInfo:     Reference to the hash where we will store information
#                      about the number of lines, comments, Scriba comments,
#                      etc.
#
# Returns:
#   1 -> Success.
#   0 -> Some problem while parsing the arguments.
#-------------------------------------------------------------------------------
sub createDocuments {
    my($refhParameters, $refhDocStructure, $refhTemplates, $refhFileInfo) = @_;

    my $iReturn = 1;

    # scrb: Document: UserGuide
    # scrb: Chapter: 2. How Does it Work?
    #
    # Once all the documents have been processed the software proceeds to
    # create all defined documents using the given templates and styles.
    foreach my $sDocument (sort(keys %{$refhDocStructure})) {
        # we create a new document template
        my $sNewDocument = $refhTemplates->{DOCUMENT};
        $sNewDocument =~ s/{\$scrb_document_name}/$sDocument/;
        if (!(open (FILE, ">$refhParameters->{OUTPUT_DIR}${sDocument}.html"))) {
            # If the file is not writeable we will give a little message.
            print "ERROR: I could not open the file '$refhParameters->{OUTPUT_DIR}${sDocument}' for writing.\n".
                  "       Check if the file has read permisions and the name is correct.\n";
        }
        else {
            print "Creating '$refhParameters->{OUTPUT_DIR}${sDocument}.html'\n";
            # and dump each section, sorted by section name
            my $sAllChapters = '';
            my $sIndex = '';
            my $sChapterId = 0;
            foreach my $sChapter (sort(keys %{$refhDocStructure->{$sDocument}})) {
                my $sContent = $refhDocStructure->{$sDocument}{$sChapter}{CONTENT};

                # scrb: Chapter: 2.3.3. Linking with JSDoc
                #
                # One of the features we can activate is the linking of the
                # Scriba generated documents with JSDoc. What will happen is
                # that is we process some source code files that have properly
                # encoded JSDoc tags Scriba is able to interpret them and
                # then it can create links to the right JSDoc documentation._
                # You can activate this option with the _-jsdoc_ command line
                # option where you can pass the URL to use as base direction
                # for the links pointing to the JSDoc HTML page._
                # Scriba will parse the content of each comment section
                # looking for matching class names and functions and if found
                # it will blindly create the link (meaning that Scriba will
                # not check neither warn if the target URL is wrong or does
                # not exist)._
                # The way to reference modules and functions to point to
                # JSDoc documentation is the same used in JSDoc:
                # <div class="code">
                # \<Module\>[(.#)\<Method\>]
                # </div>

                # linking with jsdoc
                if($refhParameters->{OUTPUT_JSDOC}) {
                    foreach my $sClass (keys(%{$refhFileInfo->{JSDOC}{CLASSES}})) {
                        if($sContent =~ /\Q$sClass/) {
                            # linking any potential methods
                            foreach my $sClassMethod (@{$refhFileInfo->{JSDOC}{CLASSES}{$sClass}{METHODS}}) {
                                my $sSearch = "$sClass([.#])$sClassMethod";
                                $sContent =~ s/(?<!">)$sSearch\b/<a href="$refhParameters->{OUTPUT_JSDOC}classes\/$sClass.html#method_$sClassMethod">$sClass$1$sClassMethod<\/a>/g;
                            }
                            # linking with the class definition
                            $sContent =~ s/(?<!">)(?<!\/)$sClass\b/<a href="$refhParameters->{OUTPUT_JSDOC}classes\/$sClass.html">$sClass<\/a>/g;
                        }
                    }
                }
                # calculating the chapter level based on its numbering
                my $iChapterLevel = 1;
                if($sChapter =~ /^\s*([0-9.]+)/) {
                    my $sTempNumbering = $1;
                    # removing any trailing dots
                    if(substr($sTempNumbering, -1) eq '.') {
                        chop($sTempNumbering);
                    }
                    # counting the number of dot and adjusting
                    $iChapterLevel = $sTempNumbering =~ tr/\.//;
                    $iChapterLevel ++;
                }
                # rendering contents in the appropriate template
                my $sNewChapter = $refhTemplates->{CHAPTER};
                $sNewChapter =~ s/{\$scrb_chapter_name}/$sChapter/g;
                $sNewChapter =~ s/{\$scrb_chapter_level}/$iChapterLevel/g;
                $sNewChapter =~ s/{\$scrb_chapter_id}/scrb_$sChapterId/g;
                $sNewChapter =~ s/{\$scrb_chapter_content}/$sContent/;
                # do we have to add inline information?
                if($refhParameters->{INFO_INLINE}) {
                    my $sInfo = "";
                    for(my $i = 0; $i < scalar(@{$refhDocStructure->{$sDocument}{$sChapter}{FILE_ID}}); $i ++) {
                        $sInfo .= $refhDocStructure->{$sDocument}{$sChapter}{FILE_ID}[$i] . "<br/>";
                    }
                    $sNewChapter =~ s/{\$scrb_chapter_info}/$sInfo/g;
                }
                else {
                    $sNewChapter =~ s/{\$scrb_chapter_info}//g;
                    $sNewChapter =~ s/<p class="infoinline">.*<\/p>//mg;
                }
                $sAllChapters .= $sNewChapter;

                # rendering index content with the appropriate template
                my $sNewIndex = $refhTemplates->{INDEX_ENTRY};
                $sNewIndex =~ s/{\$scrb_chapter_name}/$sChapter/g;
                $sNewIndex =~ s/{\$scrb_chapter_level}/$iChapterLevel/g;
                $sNewIndex =~ s/{\$scrb_chapter_id}/scrb_$sChapterId/g;
                $sIndex .= $sNewIndex;

                # creating unique ids for chapters with a simple number
                $sChapterId ++;
            }

            $sNewDocument =~ s/{\$scrb_chapters}/$sAllChapters/;
            $sNewDocument =~ s/{\$scrb_index}/$sIndex/;

            print FILE $sNewDocument;
            close (FILE);

            if($refhParameters->{OUTPUT_PDF}) {
                `wkhtmltopdf --disable-smart-shrinking $refhParameters->{OUTPUT_DIR}${sDocument}.html $refhParameters->{OUTPUT_DIR}${sDocument}.pdf`;
                #`libreoffice --convert-to pdf $refhParameters->{OUTPUT_DIR}${sDocument}.html --outdir $refhParameters->{OUTPUT_DIR} --invisible`;
            }
        }
    }

    $iReturn;
}

#-------------------------------------------------------------------------------
# scrb: Document: DeveloperGuide
# scrb: Chapter: 2.6. printFileInfo
# scrb: 2
#
# Prints the statistical information we have collected whilst processing the
# source code file for document definition sections.
#
# Parameters:
#   $refhParameters:   Reference to the hash where we will store information
#                      about the arguments passed to the script.
#   $refhFileInfo:     Reference to the hash where we will store information
#                      about the number of lines, comments, Scriba comments,
#                      etc.
#
# Returns:
#   1 -> Success.
#   0 -> Some problem while parsing the arguments.
#-------------------------------------------------------------------------------
sub printFileInfo {
    my($refhParameters, $refhFileInfo) = @_;

    my $iReturn = 1;

    if($refhParameters->{INFO}) {
        print "\n";
        my $iTotalLines = 0;
        my $iTotalComments = 0;
        my $iTotalScribaComments = 0;

        my $fCommentsLines = 0;
        my $fScribaCommentsLines = 0;

        # scrb: Document: UserGuide
        # scrb: Chapter: 2.4. Statistical Information
        #
        # As Scriba processes all files on your project directory looking
        # for comments and its contents, it can provide some
        # information about the number of lines and number of comments
        # found that might be of help._
        # If you run the script with the _-info_ switch at the end of the
        # run it will print on the console something similar to this:
        # <div class="code">
        # Building the documentation into "../doc" path_
        # Creating '../doc/DeveloperGuide.html'_
        # Creating '../doc/UserGuide.html'_
        # _
        # lines: 11      comments:      6 / 54.55%  Scriba comments:      0 /  0.00%  ./build_documentation.sh&nbsp;_
        # lines: 1100    comments:    596 / 54.18%  Scriba comments:    436 / 73.15%  ./scriba.pl_
        # _
        # TOTAL FILES: 2_
        # lines: 1111    comments:    602 / 54.19%  Scriba comments:    436 / 72.43%_
        # </div>
        # This report tells you, first for each file and then as a total:
        # * The number of _lines_ on the files (not lines of code,
        #   simply lines)
        # * The number of comment lines we have detected. And a percentage
        #   based on the above number of lines.
        # * The number of Scriba comment lines. And a percentage based on
        #   the above number of comments.

        foreach my $sFile (sort(keys %{$refhFileInfo})) {
            if($sFile ne 'JSDOC') {
                # counting the percentage of commented lines on the source code
                $fCommentsLines = 0;
                if($refhFileInfo->{$sFile}{NUM_LINES}) {
                    $fCommentsLines = (100 * $refhFileInfo->{$sFile}{NUM_COMMENTS} / $refhFileInfo->{$sFile}{NUM_LINES});
                }
                # counting the percentage of Scriba commented lines on the source code
                $fScribaCommentsLines = 0;
                if($refhFileInfo->{$sFile}{NUM_COMMENTS}) {
                    $fScribaCommentsLines = (100 * $refhFileInfo->{$sFile}{NUM_Scriba_COMMENTS} / $refhFileInfo->{$sFile}{NUM_COMMENTS});
                }
                printf("lines: %-6i  comments: %6i / %5.02f%%  Scriba comments: %6i / %5.02f%%  %s\n",
                    $refhFileInfo->{$sFile}{NUM_LINES},
                    $refhFileInfo->{$sFile}{NUM_COMMENTS}, $fCommentsLines,
                    $refhFileInfo->{$sFile}{NUM_Scriba_COMMENTS}, $fScribaCommentsLines,
                    ${sFile});
                # adding the "totals" information
                $iTotalLines += $refhFileInfo->{$sFile}{NUM_LINES};
                $iTotalComments += $refhFileInfo->{$sFile}{NUM_COMMENTS};
                $iTotalScribaComments += $refhFileInfo->{$sFile}{NUM_Scriba_COMMENTS};
            }
        }
        # counting the total percentage of commented lines on the source code
        $fCommentsLines = 0;
        if($iTotalLines) {
            $fCommentsLines = (100 * $iTotalComments / $iTotalLines);
        }
        # counting the total percentage of Scriba commented lines on the source code
        $fScribaCommentsLines = 0;
        if($iTotalComments) {
            $fScribaCommentsLines = (100 * $iTotalScribaComments / $iTotalComments);
        }
        printf("\nTOTAL FILES: %i\nlines: %-6i  comments: %6i / %5.02f%%  Scriba comments: %6i / %5.02f%%\n",
            (scalar(keys %{$refhFileInfo}) - 1),
            $iTotalLines,
            $iTotalComments, $fCommentsLines,
            $iTotalScribaComments, $fScribaCommentsLines);
    }

    $iReturn;
}

#-------------------------------------------------------------------------------
# BEGINNING OF THE PROGRAM.
#-------------------------------------------------------------------------------

my %hArguments = ();
# Default values for the arguments.
$hArguments{INPUT_DIR} = "./";
$hArguments{FIND_ARGS} = "";
$hArguments{OUTPUT_DIR} = "./ScribaGen/";
$hArguments{OUTPUT_JSDOC} = '';
$hArguments{OUTPUT_PDF} = 0;
$hArguments{TEMPLATE} = "default";
$hArguments{INFO} = 0;
$hArguments{INFO_INLINE} = 0;
$hArguments{Scriba_ID} = "scrb:";

# path of the executable script, we need that in order to find the
# document generation templates
my $sScribaDirName = dirname(abs_path(__FILE__));
# print Dumper (\%hArguments);
if(checkArguments(\@ARGV, \%hArguments) == 0) {
    help();
}
else {
    # document generation templates
    my %hTemplates = ();
    $hTemplates{BASE_PATH} = $sScribaDirName . "/../templates/" . $hArguments{TEMPLATE} . "/";
    $hTemplates{DOCUMENT} = "";
    $hTemplates{CHAPTER} = "";

    # scrb: Document: DeveloperGuide
    # scrb: Chapter: 3. Scriba Flow
    #
    # The Scriba software calls its functions/steps in the following order:
    # * checkArguments & help: to make sure we have been given all the
    #   information we need to run the software.
    # * readTemplates: to read the templates we are going to use to generate
    #   the documentation.
    # * processFiles: to extract the Scriba documentation information sections
    #   from the project source files.
    # * createDocuments: to create the defined documents using the given
    #   templates
    # * printFileInfo: if needed, to print the statistical information we
    #   have been collecting whilst processing the project source files.

    # initialising the document generation templates
    readTemplates(\%hArguments, \%hTemplates);
    # new document structure
    my %hDocStructure = ();
    # file information
    my %hFileInfo = ();
    # extracting the information from the given files
    processFiles(\%hArguments, \%hDocStructure, \%hFileInfo);
    #print Dumper (\%{$hFileInfo{JSDOC}});
    # creating the document structure from the file contents
    createDocuments(\%hArguments, \%hDocStructure, \%hTemplates, \%hFileInfo);
    # print source code info
    printFileInfo(\%hArguments, \%hFileInfo);

    #print Dumper (\%hFileInfo);
    #print Dumper (\%hDocStructure);
}