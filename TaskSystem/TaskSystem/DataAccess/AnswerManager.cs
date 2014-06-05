
using System;
using System.Collections.Generic;
using TaskSystem;
using System.Linq;
using TaskSystem.DataAccess;
public class AnswerManager
{
    private List<Answer> AnswerList;

    public List<Answer> GetAnswerList(String student, int assignment)       //student��ʾѧ���˺����� assignment��ʾ��ҵ��
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

    public bool AddAnswer(List<Answer> answer)          //��Ӵ�
    {
        DataClassesDataContext da = new DataClassesDataContext();
        da.Answer.InsertAllOnSubmit(answer);
        da.SubmitChanges();
        return true;
    }

    public bool UpdateAnswer(List<Answer> answer)       //���´�
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
            }
        }
        return true;
    }

}
