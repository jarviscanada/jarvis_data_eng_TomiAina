# JAVA GREP APP
# Introduction
This is a Java-based app that can perform the capabilities of the grep command in Linux.
The app takes in three arguments that search for text patterns in a directory and outputs the matched line to a file.
The app is built and managed using  Java, Maven, IntelliJ IDEA IDE. The app was deployed
using docker for easier distribution and use. 
# Quick Start
The app takes 3 arguments as shown below:
````
USAGE: regex rootPath outFile
- regex: a special text string for describing a search pattern
- rootPath: root directory path
- outFile: output file name
````

The app has the ability to search for text patterns (regex) in a given directory (rootPath),
and outputs matched line to a file (outFile).

# Implementation

In implementing the app, a method is written to handle the CLI arguments (the arguments have been described above).
These arguments are saved to private variables using ``Getters`` and ``Settters``. In addition, self4j is used to
logging messages (exceptions) and debugging. The IntelliJ IDE is used to generate, implement all methods and run the app. 
These methods perform the following functions as described in the 
pseudocode. 

## Pseudocode
````
matchedLines = []
for file in listFilesRecursively(rootDir)
  for line in readLines(file)
      if containsPattern(line)
        matchedLines.add(line)
writeToFile(matchedLines)

````
## Performance Issue
The grep app loads all the data in the root directory directly to memory; it then tries to
match the regex pattern and outputs it in the OutFile. If the data in the directory is more than the
heap size memory allocated in the JVM, the grep app application will fail and throw an `OutOfMemoryError` exception.
In order to fix this, the heap size is reallocated (by increasing the size). This ensures that the app works.
# Test
The application was tested manually on the CLI by preparing sample data, running some test cases and comparing the result with the manually
test with the app to ensure that the results were the same.

# Deployment
The grep app was _**dockerized**_ for easier distribution. To _**dockerize**_
means to package, deploy and run the application as an image. The created docker image is then pushed to  docker hub. 

# Improvement
- In order to avoid performance issues as earlier described, it may be important for the app to have the ability
to check for the file sizes as a prerequisite before it attempts to perform its original functionality. 
- The current interface of the app is not user-friendly, it will be important to incorporate a graphical interface
that is easily accessible to users and improve the user experience. 
- Since the goal of the app is to mimic the functionality of it will important for the app to have more commands 
like the Linux command 