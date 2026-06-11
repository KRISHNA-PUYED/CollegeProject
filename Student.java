public class Student {
    private int sid;
    private String sname;
    private String sclass;

    // Default Constructor
    public Student() {
    }

    // Parameterized Constructor
    public Student(int sid, String sname, String sclass) {
        this.sid = sid;
        this.sname = sname;
        this.sclass = sclass;
    }

    // Getters
    public int getSid() {
        return sid;
    }

    public String getSname() {
        return sname;
    }

    public String getSclass() {
        return sclass;
    }

    // Setters
    public void setSid(int sid) {
        this.sid = sid;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public void setSclass(String sclass) {
        this.sclass = sclass;
    }

    // toString() method
    @Override
    public String toString() {
        return "Student{" +
                "sid=" + sid +
                ", sname='" + sname + '\'' +
                ", sclass='" + sclass + '\'' +
                '}';
    }
}
