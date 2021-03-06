package spring.database;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import spring.database.model.Student;
import spring.database.model.StudentDetail;
import spring.database.repository.StudentRepository;

import java.util.ArrayList;
import java.util.List;

@SpringBootApplication
public class DatabaseApplication implements CommandLineRunner {

    private static final Logger logger = LoggerFactory.getLogger(DatabaseApplication.class);

    @Autowired
    private StudentRepository studentRepository;

    public static void main(String[] args) {
        SpringApplication.run(DatabaseApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {

        // fetch all students before update
//        logger.info("============ Fetch all students before update ============");
//        for (Student student : studentRepository.findAll()) {
//            logger.info(student.toString());
//        }

        // save a couple of students
        logger.info("============ Save a couple of students ============");
        List<Student> students = new ArrayList<>();
        students.add(new Student("Student A",  new StudentDetail(10, "ma5d@gmail.com")));
        students.add(new Student("Student B", new StudentDetail(11, "mydinexd@gmail.com")));
        students.add(new Student("Halid", new StudentDetail(32, "mads5d@gmail.com")));
        students.add(new Student("Bob", new StudentDetail(8, "deepd@gmail.com")));
        students.add(new Student("Tom", new StudentDetail(18, "myindexuz@gmail.com")));
        students.add(new Student("Lain", new StudentDetail(82, "myindexuz@gmail.com")));

        studentRepository.saveAll(students);

        // Delete all value in the db (MySQL)
         // studentRepository.deleteAll();



        // fetch all students
//        logger.info("============ Fetch all students after update ============");
//        for (Student student : studentRepository.findAll()) {
//            logger.info(student.toString());
//        }
    }
}
