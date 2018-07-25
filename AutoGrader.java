import java.lang.Class;
import org.junit.runner.JUnitCore;
import org.junit.runner.Result;

public class AutoGrader {
    public static void main(String[] args) {
        // Run all of the unit tests for the Project
        // Replace with the name of the class containing the author method
        String author = BreastCancerClassify.author();
        // Replace with the name of the class containing the testing suite
        Class test_class = BreastCancerClassifyTest.class;
        Result result = JUnitCore.runClasses(test_class);
        int total_tests = result.getRunCount();
        double successful_tests = total_tests - result.getFailureCount();
        String student_score = String.format("%.2f", (successful_tests / total_tests));
        System.out.println(author + ", " + student_score);
    }
}
