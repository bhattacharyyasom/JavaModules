#Remove and recreate output folders
rm -rf output/classes
rm -rf output/mlib

mkdir -p output/mlib
mkdir -p output/classes

#Use this to compile the source code for data 
javac -d output/classes data/org/tw/javamods/data/SomeData.java
# Create a jar using classes
jar -c -f output/mlib/data.jar -C output/classes .

#Use below command to generate a jar file that is old and with a automatic module name
#jar -c -m data/MANIFEST.MF -f output/mlib/data.jar -C output/classes .
#At the end of this we have a jar file

#Remove and recreate classes folder
rm -rf output/classes
mkdir -p output/classes

#Use this to compile source code for service code.
#Note we are passing the above created data.jar as a compilation dependency
javac -d output/classes -classpath output/mlib/data.jar service/org/tw/javamods/service/SomeService.java 
jar -c -f output/mlib/service.jar -C  output/classes/ .

rm -rf output/classes
echo "----Run on class path ---------"
#This runs the code in classpath.
# Note : We have to remember and pass data.jar along with service.jar again during runtime
# All classes in jars are lumped into one module(unnamed module)
java -classpath output/mlib/data.jar:output/mlib/service.jar  org.tw.javamods.service.SomeService

#Use this to use "old jars" on module path
#Results in the jars being aautomatically "modulifed" and used.
#java -p output/mlib/  -m service/org.tw.javamods.service.SomeService


