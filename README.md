# Scriba

Scriba is a tool to generate documentation from source code. The content of the documentation is extracted directly from the source code and/or any other files found on the project tree. Unlike many other tools Scriba does not generate API-like documentation neither the generated documentation necessarily follows the same structure as the source code.

The purpose of Scriba is to provide an easy way to have source code and documentation mixed on the same set of files. The problem Scriba wants to solve is the mismatch between code and documentation that tends to occur on the life-cycle of a project, specially as the project grows older. What usually happens is that developers are busy producing code that works, and as documents are kept on completely different folder structures they never go and keep them up to date. Hopefully this script will be of great help for developers, specially on Agile and Extreme Programming environments where for their nature changes on the code happen a lot more often.

The main goal of Scriba is that we do not hinder the normal development work in any way:
* Scriba should not to give any extra work to the developers to create the documentation.
* Scriba should not interfere with any other software documentation tools.
* Scriba should not pollute the source code with strange syntax or extra sections.
* Scriba documentation should be able to be used as code comments and the code comments should also be able to be used as Scriba documentation.

With those principles in mind we made Scriba use the normal code comments sections to take the contents of the documents it will generate. We also have given the ability to format the text in a way that can easily be read as a normal text file but that will render nicely when exporting as a proper document.
