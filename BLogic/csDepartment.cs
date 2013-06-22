using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace THE_PROJECT_E_PERSONAL
{
    public class csDepartment
    {
        public Int32 dept_Code { get; set; }
        public String dep_Name { get; set; }

        public csDepartment()
        {
        }
        #region "Validate if the departement is correct"
        public bool validateDept(String deptN)
        {
            using (DataAcc.HR_DeptEntities obj = new DataAcc.HR_DeptEntities())
            {
                bool flag = false;
                var result = from d in obj.Departments select d;
                foreach (var e in result)
                {
                    if (deptN.ToLower().Equals(e.dept_name.ToLower()))
                    {
                        flag = true;
                    }

                }
                return flag;
                            
            }

            
        }
        #endregion

        #region "Retrieve Data from The department table"
        public List<String> getDepartment()
        {
            List<String> myList = new List<String>();

            DataAcc.HR_DeptEntities obj = new DataAcc.HR_DeptEntities();
            foreach (var d in obj.Departments)
            {
                myList.Add(d.dept_name.Trim());

            }
            return myList;
        }
        #endregion
    }
}