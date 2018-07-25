#!/bin/bash
#create gradebook output file. erase the old version if one currently exists. 
rm -f student_grades.csv
touch student_grades.csv
#for each directory in the student submissions:
for student in ./student_submissions/*/; 
do
	cp AutoGrader.java ${student}AutoGrader.java
	# if the project reads from a data set directory, copy that into the student's directory
	cp -r ./datasets ${student}
	# hope into their directory to shorten the next two lines
	cd ${student}
	javac InputHandler.java Grapher.java BreastCancerClassify.java BreastCancerClassifyTest.java AutoGrader.java 
	java AutoGrader >> ../../student_grades.csv
	# by changing directories earlier, we need to get back to the project root directory
	cd ../..
done
