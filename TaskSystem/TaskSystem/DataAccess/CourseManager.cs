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

        public Course GetOneCourse(String teachername, String coursename)         //通过老师账号名和课程名获得指定课程
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var c = from s in da.Course
                    where s.teacher == teachername && s.name == coursename
                    select s;
            return c.FirstOrDefault();
        }

        public List<Course> GetCourseForStudent(String stuname)         //通过学生账号名，获取该学生课程的List
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var course_num = from s in da.Student_Course
                         where s.student == stuname
                         select s.course;
             StudentCourse = new List<Course>();
             foreach (var c in course_num)
             {
                 var result = from s in da.Course
                              where s.num == c
                              select s;
                 StudentCourse.AddRange(result);
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
            da.Course.InsertOnSubmit(course);
            da.SubmitChanges();
            return true;
        }

        public bool ChooseCourse(String stuname, String course_num)         //学生选课
        {
            DataClassesDataContext da = new DataClassesDataContext();
            Student_Course sc = new Student_Course();
            sc.course = course_num;
            sc.student = stuname;
            da.Student_Course.InsertOnSubmit(sc);
            da.SubmitChanges();
            return true;

        }
        public bool DeleteCourse(Course course)         //删除课程
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var c=from s in da.Course
                  where s.teacher==course.teacher && s.name==course.name
                  select s;
            var cin = from s in da.Student_Course
                      where s.course == c.First().num
                      select s;
            var ca = from s in da.Assignment           
                     where s.course == c.First().num
                     select s;
            if (ca.Count() > 0)
            {
                foreach (var n in ca)
                {
                    var p = from s in da.Problem
                            where s.assignment == n.id
                            select s;
                    if (p.Count() > 0)
                    {
                        var answer = from s in da.Answer
                                     where s.problem == p.First().id
                                     select s;
                        if (answer.Count() > 0)
                        {
                            da.Answer.DeleteAllOnSubmit(answer);            //删除answer
                        }
                    }
                    var accessory = from s in da.Accessory
                                    where s.assignment == n.id
                                    select s;
                    if (accessory.Count() > 0)
                        da.Accessory.DeleteAllOnSubmit(accessory);

                    da.Problem.DeleteAllOnSubmit(p);            //删除Problem
                }


                da.Assignment.DeleteAllOnSubmit(ca);           //删除assignment
            }
            if (cin.Count() > 0)
            {
                da.Student_Course.DeleteAllOnSubmit(cin);       //删除student_course
            }
            da.Course.DeleteAllOnSubmit(c);             //删除Course
            da.SubmitChanges();
            return true;
        
        }
        public Course GetCourseByNum(string number)
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var cou = from s in da.Course
                      where s.num == number
                      select s;
            if (cou.Count() > 0)
                return cou.First();
            else
                return null;
        }
    }
}
