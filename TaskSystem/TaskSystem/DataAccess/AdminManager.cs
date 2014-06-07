using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace TaskSystem.DataAccess
{
    public partial class AdminManager
    {
        public Admin GetAdmin(String name)
        {

            DataClassesDataContext da = new DataClassesDataContext();
            var admin = from s in da.Admin
                        where s.username == name
                        select s;
            if (admin.Count() > 0)
                return admin.First();
            else
                return null;
        }

        public bool Update(Admin newadmin)
        {
            DataClassesDataContext da = new DataClassesDataContext();
            var a = from s in da.Admin
                    where s.username == newadmin.username
                    select s;
            a.First().passwd = newadmin.passwd;
            da.SubmitChanges();
            return true;
        }
    }
}