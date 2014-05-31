using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskSystem.DataAccess
{
    public class StudentManager
    {
        private List<Student> StuListForMajor;
     
        private List<Student> StuListForCourse;

        public Student GetStudent(String name)            //根据账号名获取学生全部信息
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var stu = from s in da.Student
                      where s.username == name
                      select s;
            return stu.FirstOrDefault();
        }

        public List<Student> GetStudentByMajor(String major)            //  通过“专业”获取学生，返回该专业的全部学生信息的List
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var stu = from s in da.Student
                      where s.major == major
                      select s;
            StuListForMajor = new List<Student>();
            foreach (var n in stu)
            {
                StuListForMajor.Add(n);
            }
            return StuListForMajor;
        }

        public List<Student> GetStudentByCourse(String course)      //根据课程获取Student的列表
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var student = from s in da.Student_Course
                        where s.course == course
                        select s.student;
            StuListForCourse = new List<Student>();
            foreach (var n in student)
            {
                var stu = from s in da.Student
                          where s.username == n
                          select s;
                StuListForCourse.Add(stu.FirstOrDefault());
            }
            return StuListForCourse;
        }

        public bool AddStudent(Student stu)         // 添加学生
        {
            DataClassesDataContext da = new DataClassesDataContext();
            Student student = new Student();
            student = stu;
            da.Student.InsertOnSubmit(student);
            da.SubmitChanges();
            return true;
        }

    }
}