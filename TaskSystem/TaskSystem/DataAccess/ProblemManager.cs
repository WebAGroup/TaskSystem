using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskSystem.DataAccess
{
    public class ProblemManager
    {
        private List<Problem> pro;

        public bool create(Problem obj)     // 新建问题
        {
            DataClassesDataContext da = new DataClassesDataContext();
            da.Problem.InsertOnSubmit(obj);
            da.SubmitChanges();
            return true;
        }

        public List<Problem> GetProblem(int assignment_id)      //根据assignment的ID获取该作业的problem的List
        {
            
            DataClassesDataContext da = new DataClassesDataContext();
            var p = from s in da.Problem
                    where s.assignment == assignment_id
                    select s;
            pro = new List<Problem>();
            foreach (var n in p)
                pro.Add(n);
            return pro;
        }

        public bool Score(int pro_id,float score)           //评分，pro_id代表问题ID，score代表分数
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var p = from s in da.Problem
                    where s.id == pro_id
                    select s;
            p.First().score = score;
            da.SubmitChanges();
            return true;
        }

        public List<Problem> getAllProblem()                //得到所有问题
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var p = from s in da.Problem
                    select s;
            pro = new List<Problem>();
            foreach (var n in p)
                pro.Add(n);
            return pro;
        }

        public bool DeleteProblem(int pro_id)           //根据Problem的Id来删除作业
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var answer = from s in da.Answer
                         where s.problem == pro_id
                         select s;
            da.Answer.DeleteAllOnSubmit(answer);
            var p = from s in da.Problem
                    where s.id == pro_id
                    select s;
            da.Problem.DeleteAllOnSubmit(p);
            da.SubmitChanges();
            return true;

        }


        public bool UpdateProblem(Problem pro)      //更新问题
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var p = from s in da.Problem
                    where s.id == pro.id
                    select s;
            foreach (Problem problem in p)
            {
                problem.id = pro.id;
                problem.assignment = pro.assignment;
                problem.title = pro.title;
                problem.descrip = pro.descrip;
                problem.score = pro.score;
            }
            da.SubmitChanges();
            return true;

        }
    }
}