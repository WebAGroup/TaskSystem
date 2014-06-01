
using System;
using System.Collections.Generic;
using TaskSystem;
using System.Linq;
using TaskSystem.DataAccess;
public class AnswerManager
{
    private List<Answer> AnswerList;

    public List<Answer> GetAnswerList(String student, int assignment)       //student表示学生账号名， assignment表示作业号
    {
        DataClassesDataContext da = new DataClassesDataContext();
        var pro = from s in da.Problem
                  where s.assignment == assignment
                  select s.id;
        var answer = from s in da.Answer
                     where s.student == student && s.problem == pro.First()
                     select s;
        if (answer.First() == null)
            return null;
        else
        {
            AnswerList = new List<Answer>();
            foreach (var n in answer)
            {
                AnswerList.Add(n);
            }
            return AnswerList;
        }

    }

    public bool AddAnswer(List<Answer> answer)          //添加答案
    {
        DataClassesDataContext da = new DataClassesDataContext();
        da.Answer.InsertAllOnSubmit(answer);
        da.SubmitChanges();
        return true;
    }

    public bool UpdateAnswer(List<Answer> answer)       //更新答案
    {
        DataClassesDataContext da = new DataClassesDataContext();
        foreach (Answer a in answer)
        {
            var ans = from s in da.Answer
                      where s.student == a.student && s.problem == a.problem
                      select s;
            foreach (Answer answ in ans)
            {
                answ.comment = a.comment;
                answ.cont = a.cont;
                answ.score = a.score;
            }
        }
        return true;
    }

}
