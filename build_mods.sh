rm -rf output/classes
mkdir -p output/mlib
mkdir -p output/classes

#Use this to compile the same jar just for classpath use
# It is crucial to compile both code and moduleinfo.java for jar to work as modules
javac -d output/classes data/org/tw/javamods/data/SomeData.java data/module-info.java
jar -c -f output/mlib/data.jar -C output/classes .


rm -rf output/classes

mkdir -p output/classes

#This is a module path based compilation again using moduleinfo.java to compile
javac -d output/classes -p output/mlib/data.jar service/org/tw/javamods/service/SomeService.java service/module-info.java
jar -c -f output/mlib/service.jar -C  output/classes/ .

rm -rf output/classes
echo "----Run on class path ---------"

#This runs the code in module path
java -p output/mlib/ -m twservice/org.tw.javamods.service.SomeService

#This runs same jars on classpath
java -classpath output/mlib/data.jar:output/mlib/service.jar org.tw.javamods.service.SomeService

#Below commands get descriptor of jars and derive module names
# jar -f output/mlib/service.jar -d
# jar -f output/mlib/data.jar -d
