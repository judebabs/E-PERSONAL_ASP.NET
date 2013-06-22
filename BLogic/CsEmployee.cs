using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;

namespace THE_PROJECT_E_PERSONAL
{
    public class CsEmployee
    {
        #region "Instance Variable"
        public String _Name { get; set; }
        public Int32 _Code { get; set; }
        public String _Designation { get; set; }
        public Int16 _Date_Appointed { get; set; }
        public Int32 _dept_Code { get; set; }
        public String _deptName { get; set; }
        public Int32 _yearsOfService { get; set; }
        #endregion

        #region "Default and Overloaded Constructors"
        public CsEmployee()
        {
            
        }
        public CsEmployee(Int32 code, String name, String des, String dept_name)
        {
            _Name = name;
            _Code = code;
            _Date_Appointed = Convert.ToInt16(DateTime.Now.Year);
            _Designation = des;
            _dept_Code = converterDep(dept_name);
            _deptName = dept_name; 

        }
        public CsEmployee(String name, String des, String dept_name, Int32 code)
        {
            _Name = name;
            _Code = code;
            _Date_Appointed = Convert.ToInt16(DateTime.Now.Year);
            _Designation = des;
            _dept_Code = converterDep(dept_name);
            
            _deptName = dept_name.ToUpper(); 
            
        }
        #endregion


        #region "Convertion Of The Departement to appropriate code"
        private Int32 converterDep(String nameOfDep)
        {
            nameOfDep = nameOfDep.Trim().ToUpper();
            Int32 _dept_Code1 = 0;
          
            if (nameOfDep.Equals("IT"))
            {
                _dept_Code1 = 20;
            }
            else if (nameOfDep.Equals("SALES"))
            {
                _dept_Code1 = 30;

            }
            else if (nameOfDep.Equals("MARKETING"))
            {
                _dept_Code1 = 40;
            }
            else if (nameOfDep.Equals("PURCHASING"))
            {
                _dept_Code1 = 50;
            }
            else
            {
                _dept_Code1 = 10;
            }

            return _dept_Code1;


        }
        #endregion

        #region "Function add employee using the stored procedure"
        public void AddEmployee()
        {
            using (DataAcc.HR_DeptEntities myEnt = new DataAcc.HR_DeptEntities())
            {
                DataAcc.Employee newEmployee = new DataAcc.Employee()
                {

                    emp_code = _Code,
                    emp_name = _Name,
                    emp_designation = _Designation,
                    emp_date_appointed = _Date_Appointed,
                    dept_code = _dept_Code
                };

                myEnt.AddToEmployees(newEmployee);
                myEnt.SaveChanges();
            }
        }
        #endregion

        #region "Validate if the employee code is not duplicated"
        public Boolean validateEmpCode(Int32 _code)
            {
                using(DataAcc.HR_DeptEntities myEnt = new DataAcc.HR_DeptEntities())
                {
                    var result = from p in myEnt.Employees
                                 select p;

                    bool found = false;

                    foreach(var d in result)
                    {
                        if(d.emp_code == _code)
                        {
                            found = true;
                            
                        }
                    }

                    return found;
                }
            }
        #endregion

        #region "Fuction Update using the stored procedure"
        public void Update(Int32 _code, String _name, String _designation, String depnm)
        {
            using (DataAcc.HR_DeptEntities obj = new DataAcc.HR_DeptEntities())
            {
                var emp = obj.Employees.Where(x => x.emp_code == _code).First();
                emp.emp_name = _name;
                emp.emp_designation = _designation;
                emp.dept_code = converterDep(depnm);
                obj.SaveChanges();
            }
        }
        #endregion

        #region "Search for employee using the stored procedure"
        public void getEmployee(Int32 _emp_code)
        {
            using (DataAcc.HR_DeptEntities objE = new DataAcc.HR_DeptEntities())
            {
                var result = from d in objE.sp_search_emp(_emp_code)
                             select d;
              
                foreach (var t in result)
                {
                    _Name = t.emp_name;
                    _Designation = t.emp_designation;
                    _deptName = t.dept_name;
                    _yearsOfService = Convert.ToInt32(t.Years_of_service);
                }
               
            }
        }
        public void searchEmp(Int32 _empCode)
        {
            using (DataAcc.HR_DeptEntities empObj = new DataAcc.HR_DeptEntities())
            {

                var result = from p in empObj.Employees
                             where (p.emp_code) == _empCode
                             select p;
                foreach (var e in result)
                {
                    if (e.emp_code == _empCode)
                    {

                        _Name = e.emp_name;
                        _Designation = e.emp_designation;
                        _dept_Code = Convert.ToInt32(e.dept_code);
                    }

                }


            }
        }
        #endregion


        #region "Delete Employee from the database"

        public void deleteEmployee(Int32 _code)
        {
            using (DataAcc.HR_DeptEntities context = new DataAcc.HR_DeptEntities())
            {
                var per = context.Employees.Where(p => p.emp_code == _code).First();
                context.DeleteObject(per);
                context.SaveChanges();
            }
        }



        #endregion

    }
}