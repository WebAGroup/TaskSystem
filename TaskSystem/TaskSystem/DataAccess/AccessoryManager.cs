using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskSystem.DataAccess
{
    public class AccessoryManager
    {
       
        public bool Create(Accessory accessory)
        {
            DataClassesDataContext da = new DataClassesDataContext();
            da.Accessory.InsertOnSubmit(accessory);
            da.SubmitChanges();
            return true;
        }

        public Accessory GetAccessory(String stu, int assignment)
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var a = from s in da.Accessory
                    where s.student == stu && s.assignment == assignment
                    select s;

            return a.FirstOrDefault();
        }
    }
}