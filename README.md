# AP CS Project Autograder
### Summary
This Bash script is used to run an autograder for an entire collection of students in the AP CS A classroom. This can easily be re-purposed for other Java-based CS classes. At the conclusion of running the script, a single CSV file will contain the percentage of passed test cases for each student, sorted alphabetically by last name. 
___________

### Project Dependencies 
* Java (verify system installation in Terminal with `java -v`
* [JUnit 4.X](https://junit.org/junit4/)


### Project Configuration Before Grading
Each project/assignment that will be graded should have its own unique directory (e.g. `Chatbot/` or `PictureLab/`), hereafter generically called `Project/`. 
1. Place `grade_student_work.sh` and `AutoGrader.java` inside `Project/`.
2. Modify both files by inserting the correct class names for this project. See the [Example Script](#example-script) below for an example. 
3. Create the directory `Project/student_submissions/`. 
4. Place the directory of each student's submitted project in `Project/student_submissions/`. For example:
  * `Project/student_submissions/jones_alice_project01/`
  * `Project/student_submissions/smith_bob_project01/`



### Example Script 
Below is an example of `grade_student_work.sh` repurposed for a [project implmenting K-Nearest Neighbors to classify breast cancer tumors](https://github.com/ianframe/BreastCancerClassifier). 
```
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
	# hop into their directory to shorten the next two lines
	cd ${student}
	javac InputHandler.java Grapher.java BreastCancerClassify.java BreastCancerClassifyTest.java AutoGrader.java 
	java AutoGrader >> ../../student_grades.csv
	# by changing directories earlier, we need to get back to the project root directory
	cd ../..
done
```

### Example Usage

### Configuring JUnit 






