# AP CS Project Autograder
### Summary
This Bash script is used to run an autograder for an entire collection of students in the AP CS A classroom. This can easily be re-purposed for other Java-based CS classes. At the conclusion of running the script, a single CSV file will contain the percentage of passed test cases for each student, sorted alphabetically by last name. 
___________

### Project Dependencies 
* Java (verify system installation in Terminal with `java -v`
* [JUnit 4.X](https://junit.org/junit4/)


### Project Configuration Before Grading
1. Each project/assignment should have its own unique directory at a classroom-wide level (e.g. `Chatbot/` or `PictureLab/`), hereafter generically called `Project/`. There should be one `Project/` per assignment in the gradebook; individual directories for students will placed inside `Project\`. 

2. Place `grade_student_work.sh` and `AutoGrader.java` inside `Project/`.

3. Modify both files by inserting the correct class names for this project. See the [Example Script](#example-script) below for an example. 

4. Create the directory `Project/student_submissions/`. 

5. Place the directory of each student's submitted project in `Project/student_submissions/`. For example:
   - `Project/student_submissions/jones_alice_project01/`
   - `Project/student_submissions/smith_bob_project01/`

    These directories should be easily generated when downloading all of the assignment submissions for a project through your LMS (e.g., Canvas, PowerSchool, Moodle). 

6. (Optional) If there are any additional inputs needed for the programs to run, be sure to place those inside `Project/`. E.g., `Project/datasets/breast_cancer_train_data.csv`. There is a line in `grade_students_work.sh` to copy the input data into each student's directory. 

___

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
	# if there is no data to read from, comment the following line to avoid throwing an error.
	cp -r ./datasets ${student}
	# hop into their directory to shorten the next two lines
	cd ${student}
	# place all of the necessary Java files for the project on the following line for compilation. 
	javac InputHandler.java Grapher.java BreastCancerClassify.java BreastCancerClassifyTest.java AutoGrader.java 
	java AutoGrader >> ../../student_grades.csv
	# by changing directories earlier, we need to get back to the project root directory
	cd ../..
done
```
___
### Example Usage
1. In Terminal navigate to `Project/`. 

2. Ensure that `grade_student_work.sh` has permission to execute with `chmod 755 grade_student_work.sh`. 

3. Execute the script with `./grade_student_work.sh`. 

4. The results will be placed in `Project/student_grades.csv` for easy uploading of grades into the gradebook. 
___

### Configuring JUnit 
1. Download the latest [.jar of JUnit](http://sourceforge.net/project/showfiles.php?group_id=15278) (as of this writing, v4.12). 

2. Place the `junit-4.10.jar` file (again, exact version may vary) into the necessary directory for Java extensions (most likely `/Library/Java/Extensions/`).

3. Configure the environment variables in your `bash_profile`. To do this, execute `sudo nano ~/.bash_profile`. Note the dot prefix due to the file being a hidden file. You should be prompted to enter your account password to edit this file. Once inside, add the following three statements in addition to whatelse you may have:

    ```
    export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk-10.0.2.jdk/Contents/Home 
    export JUNIT_HOME=/Library/Java/Extensions
    export CLASSPATH=.:$JUNIT_HOME/junit-4.10.jar
    ```

	If you already have a configured `CLASSPATH`, then modify the last line to read:
    `export CLASSPATH=$CLASSPATH:.:$JUNIT_HOME/junit-4.10.jar`
    

4. Write the contents of this file out to `.bash_profile` with `CTRL + X`. 

5. Either restart your Terminal session or use `source .bash_profile`. 

6. You can quickly test if your system is configured with JUnit by following [Step 6 and Step 7 from this TutorialsPoint article](https://www.tutorialspoint.com/junit/junit_environment_setup.htm).

