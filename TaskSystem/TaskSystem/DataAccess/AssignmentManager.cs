
using System.Collections.Generic;
using TaskSystem;
using System;
using TaskSystem.DataAccess;
using System.Linq;
public class AssignmentManager {
	public bool create(Assignment thisAssignment){ // ������ҵ
        DataClassesDataContext da = new DataClassesDataContext();
        da.Assignment.InsertOnSubmit(thisAssignment);
        da.SubmitChanges();
        return true;
	}

    public bool update(List<Problem> problems, Assignment thisAssignment) // ������ҵ
    {
        DataClassesDataContext da = new DataClassesDataContext();
        da.SubmitChanges();
        return true;
	}
	public bool delete(int id){ // ͨ����ҵidɾ����ҵ
        DataClassesDataContext da = new DataClassesDataContext();
        var problems = from s in da.Problem
                       where s.assignment == id
                       select s;
        da.Problem.DeleteAllOnSubmit(problems);

        var assignment = from s in da.Assignment
                         where s.id == id
                         select s;
        da.Assignment.DeleteAllOnSubmit(assignment);

        var accessory = from s in da.Accessory
                        where s.assignment == id
                        select s;
        if (accessory.Count() > 0)
            da.Accessory.DeleteAllOnSubmit(accessory);
        da.SubmitChanges();
        return true;
	}
	public List<Assignment> getAssignment(String course){ // ���ݿγ�������ȡ�ÿγ�������ҵ
        DataClassesDataContext da = new DataClassesDataContext();

        var p = from s in da.Assignment
                where s.course == course
                select s;
        List<Assignment> ret = new List<Assignment>();
        foreach (var n in p)
            ret.Add(n);
        return ret;
	}
    public List<Assignment> getAllAssignment()          //���������ҵ
    {
        DataClassesDataContext da = new DataClassesDataContext();
        var p = from s in da.Assignment
                select s;
        List<Assignment> ret = new List<Assignment>();
        foreach (var n in p)
            ret.Add(n);
        return ret;
    }
}
