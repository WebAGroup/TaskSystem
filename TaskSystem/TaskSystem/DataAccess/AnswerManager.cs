
using System;
using System.Collections.Generic;
using TaskSystem;
using System.Linq;
using TaskSystem.DataAccess;
public class AnswerManager
{
    private List<Answer> AnswerList;
    private Answer oneanswer;

    public List<Answer> GetAnswerList(String student, int assignment)       //student表示学生账号名， assignment表示作业号
    {
        DataClassesDataContext da = new DataClassesDataContext();
        var pro = from s in da.Problem
                  where s.assignment == assignment
                  select s.id;
        var answer = from s in da.Answer
                     where s.student == student && s.problem == pro.First()
                     select s;
        AnswerList = new List<Answer>();
        foreach (var p in pro)
        {
            answer = from s in da.Answer
                         where s.student == student && s.problem == p
                         select s;
            foreach (var n in answer)
            {
                AnswerList.Add(n);
            }
        }

        if ((answer.Count()) > 0)
        {
            return AnswerList;
        }
        else
            return null;

    }

    public List<Answer> GetNoCheckAnswersofApro(int problem)       //获取一个问题的所有未批改的学生答案记录，problem表示问题id
    {
        DataClassesDataContext da = new DataClassesDataContext();
        List<Answer> answerlist = new List<Answer>();
        var answer = from s in da.Answer
                     where s.problem == problem && s.state == "2"
                     select s;
        foreach (var a in answer)
        {
            answerlist.Add(a);
        }
        return answerlist;
    }

    public Answer GetOneAnswer(String student, int problem)       //获取一个问题的一条学生答案记录，student表示学生账号名， problem表示问题id
    {
        DataClassesDataContext da = new DataClassesDataContext();
        var answer = from s in da.Answer
                     where s.student == student && s.problem == problem
                     select s;
        foreach (var a in answer)
            oneanswer = a;
            return oneanswer;
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
                answ.content = a.content;
                answ.score = a.score;
                answ.state = a.state;
            }
        }
        da.SubmitChanges();
        return true;
    }

}
