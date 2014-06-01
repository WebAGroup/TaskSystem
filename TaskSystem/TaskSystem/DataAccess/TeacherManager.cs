using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskSystem.DataAccess
{
    public class TeacherManager
    {
        private List<Teacher> TeacherList;

        public Teacher GetTeacher(String name)      //根据teacher账号名获取teacher信息
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var t = from s in da.Teacher
                    where s.username == name
                    select s;
            return t.FirstOrDefault();

        }

        public bool AddTeacher(Teacher teacher)     //插入teacher
        {
            DataClassesDataContext da = new DataClassesDataContext();
            Teacher t = new Teacher();
            t = teacher;
            da.Teacher.InsertOnSubmit(t);
            da.SubmitChanges();
            return true;
        }

        public List<Teacher> GetAllTeacher()              //获得所有老师
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var t = from s in da.Teacher
                    select s;
            TeacherList = new List<Teacher>();
            foreach (var n in t)
            {
                TeacherList.Add(n);
            }
            return TeacherList;
        }

    }
}