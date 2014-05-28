using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskSystem.DataAccess
{
    public class CourseManager
    {
        private List<Course> TeacherCourse;
        private List<Course> StudentCourse;
        private List<Course> Course;



        public List<Course> GetCourseForTeacher(String teachername)         //通过老师账号名，获取课程List
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var c = from s in da.Course
                    where s.teacher == teachername
                    select s;
            TeacherCourse = new List<Course>();
            foreach (var n in c)
            {
                TeacherCourse.Add(n);
            }
            return TeacherCourse;
        }

        public List<Course> GetCourseForStudent(String stuname)         //通过学生账号名，获取该学生课程的List
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var major = from s in da.Student
                      where s.username == stuname
                      select s.major;
            var course_num = from s in da.Major_Course
                         where s.major == (major.First())
                         select s.course;
            var course = from s in da.Course
                         where s.num == (course_num.First())
                         select s;
            StudentCourse = new List<Course>();
            foreach (var n in course)
            {
                StudentCourse.Add(n);
            }
            return StudentCourse;
        }

        public List<Course> GetCourse()         //获取全部Course
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var c = from s in da.Course
                    select s;
            Course = new List<Course>();
            foreach (var n in c)
            {
                Course.Add(n);
            }
            return Course;
        }

        public bool AddCourse(Course course)        //添加课程
        {
            DataClassesDataContext da = new DataClassesDataContext();
            Course cou = new Course();
            cou = course;
            da.Course.InsertOnSubmit(cou);
            da.SubmitChanges();
            return true;
        }

        public bool AddMajorToCourse(String major, String course) // 为课程添加专业
        {
            DataClassesDataContext da = new DataClassesDataContext();
            Major_Course mc = new Major_Course();
            mc.course = course;
            mc.major = major;
            da.Major_Course.InsertOnSubmit(mc);
            da.SubmitChanges();
            return true;
        }

        public bool DeleteCourse(Course course)         //删除课程
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var c=from s in da.Course
                  where s.teacher==course.teacher && s.name==course.name
                  select s;
            var cin = from s in da.Major_Course
                      where s.course == c.First().num
                      select s;
            var ca = from s in da.Assignment
                     where s.course == c.First().num
                     select s;
            da.Major_Course.DeleteAllOnSubmit(cin);
            da.Assignment.DeleteAllOnSubmit(ca);
            da.Course.DeleteAllOnSubmit(c);
            da.SubmitChanges();
            return true;
        
        }
    }
}
