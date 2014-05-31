
using System.Collections.Generic;
using TaskSystem;
using System;
using TaskSystem.DataAccess;
using System.Linq;
public class AssignmentManager {
	public bool create(List<Problem> problems, Assignment thisAssignment){ // 创建作业
        ProblemManager pm = new ProblemManager();
        DataBaseAccess.da.Assignment.InsertOnSubmit(thisAssignment);
        DataBaseAccess.da.SubmitChanges();
        foreach (Problem s in problems)
        {
            pm.create(s);
        }
        return true;
	}
    public bool update(List<Problem> problems, Assignment thisAssignment) // 更新作业
    {
        DataClassesDataContext da = new DataClassesDataContext();
        da.SubmitChanges();
        return true;
	}
	public bool delete(int id){ // 通过作业id删除作业
        DataClassesDataContext da = new DataClassesDataContext();
        var problems = from s in da.Problem
                       where s.assignment == id
                       select s;
        da.Problem.DeleteAllOnSubmit(problems);

        var assignment = from s in da.Assignment
                         where s.id == id
                         select s;
        da.Assignment.DeleteAllOnSubmit(assignment);
        da.SubmitChanges();
        return true;
	}
	public List<Assignment> getAssignment(String course){ // 根据课程主键获取该课程所有作业
        DataClassesDataContext da = new DataClassesDataContext();

        var p = from s in da.Assignment
                where s.course == course
                select s;
        List<Assignment> ret = new List<Assignment>();
        foreach (var n in p)
            ret.Add(n);
        return ret;
	}
}
