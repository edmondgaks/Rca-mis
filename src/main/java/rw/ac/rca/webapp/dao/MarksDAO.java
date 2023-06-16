package rw.ac.rca.webapp.dao;
import java.util.List;
import rw.ac.rca.webapp.orm.Marks;
import rw.ac.rca.webapp.orm.Student;
public interface MarksDAO {
    public void saveMarks(Marks marks);
    public Marks updateMarks(Marks marks);
    public Marks saveOrUpdateMarks(Marks marks);
    public boolean deleteMarks(Marks marks);
    public Marks getMarksById(int marksId);
    public List<Marks> getAllMarks();
    List<Marks> getMarksByStudent(Student student);
}