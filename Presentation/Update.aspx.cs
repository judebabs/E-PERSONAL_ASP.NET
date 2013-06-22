using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THE_PROJECT_E_PERSONAL
{
    public partial class Update : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnUpdate.Enabled = false;
               
            }
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            
            CsEmployee emp = new CsEmployee();
            //The program find the previous information about the employee enable the update button
            //once the employee has been found the program display his/her information then allow
            //the user to make an update 
            #region "Find previous information about the employee"
            try
            {
                Int32 needeedCd = Convert.ToInt32(txtcode.Text);
                if (txtcode.Text.Length == 6)
                {
                    bool result = emp.validateEmpCode(needeedCd);
                    if (!result)
                    {
                        succes.Text = "Employee code not found! ";
                        btnUpdate.Enabled = false;
                        errorDeptDuplicated.Visible = false;
                        succes.Visible = true;
                    }
                    else
                    {
                        //call the the methode getEmployee with then class CsEmployee which retrieve information
                        //about the employee whose the code correspond to the one typed in the textbox employee code
                        errorDeptDuplicated.Visible = false;
                        succes.Visible = false;
                        emp.getEmployee(Convert.ToInt32(txtcode.Text));
                        txtname.Text = emp._Name;
                        txtdesi.Text = emp._Designation;
                        txtdept.Text = emp._deptName;
                        btnUpdate.Enabled = true;
                        txtcode.Enabled = false;
                       
                    }
                    
                }
                else
                {
                    //validate that the employee code typed by the user is 6 digits long
                    //otherwise it displays an appropriate error message to the user.
                    errorDeptDuplicated.Text = "Employee code should be 6 digits long without space and special characters.";
                    txtcode.Focus();
                    errorDeptDuplicated.Visible = true;
                    btnUpdate.Enabled = false;
                    succes.Visible = false;
                   
                }
            }
            catch
            {
                //verify that the user has typed only numeric values for thr employee code
                errorDeptDuplicated.Text = "Please Use only Numeric values without space and special characters for employee code";
                txtcode.Focus();
                errorDeptDuplicated.Visible = true;
                succes.Visible = false;

            }
            #endregion

        }

        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            //This button is enabled only if the find button has been clicked and the employee code typed by the user
            //has been found in the database other wise it will remain disabled.
            CsEmployee emp = new CsEmployee();
            csDepartment test = new csDepartment();
            #region "verify that all textboxes have been completed"
            if (txtname.Text.Trim().Length < 1)
            {
                errorDeptDuplicated.Text = "Please Enter Correct name";
                errorDeptDuplicated.Visible = true;
                txtname.Focus();
                return; 
            }
            if (txtdesi.Text.Trim().Length < 1)
            {
                errorDeptDuplicated.Text = "Please Enter Correct designation";
                errorDeptDuplicated.Visible = true;
                txtdesi.Focus();
                return;
            }
            if (txtdept.Text.Trim().Length < 1)
            {
                errorDeptDuplicated.Text = "Please Enter Correct departement";
                errorDeptDuplicated.Visible = true;
                txtdept.Focus();
                return;
            }
            #endregion
            #region "Update employee information"
            //update information of the employee found when the button find was clicked
            try
            {
                Int32 emp_code = Convert.ToInt32(txtcode.Text);
                String xCodD = txtdept.Text.Trim().ToUpper();
                
                bool validated = test.validateDept(xCodD);
                if (!validated)
                {
                    errorDeptDuplicated.Visible = true;
                    errorDeptDuplicated.Text = "Invalid Department.Please eneter valid Department name \n[SALES, IT, FINANCE, MARKETING, PURCHASING] ";
                    succes.Visible = false;
                  
                }
                else
                {
                    String xName = txtname.Text.Trim();
                    String xDesi = txtdesi.Text.Trim();
                    
                    errorDeptDuplicated.Visible = false;
                    emp.Update(emp_code, xName, xDesi, xCodD);
                    succes.Text = "Information has been succesfully updated";
                    succes.Visible = true;
                    txtcode.Text = "";
                    txtdept.Text = "";
                    txtdesi.Text = "";
                    txtname.Text = "";
                    txtcode.Enabled = true;
                    txtcode.Focus();
                    btnUpdate.Enabled = false;
                    updateTimer();
                   
                }
            }
            catch
            {
                errorDeptDuplicated.Visible = true;
                errorDeptDuplicated.Text = "Incorrect Employee Number!";


            }
            #endregion

        }
        private void updateTimer()
        {

            Timer tm = new Timer();
            tm.Interval = 3000;

        }
        protected void Timer1_Tick(object sender, EventArgs e)
        {
            succes.Text = "";


        }

        protected void txtname_TextChanged(object sender, EventArgs e)
        {
           
        }

        protected void txtdept_TextChanged(object sender, EventArgs e)
        {

        }

        protected void txtcode_TextChanged(object sender, EventArgs e)
        {
            if (txtcode.Text != " ")
            {
                succes.Visible = false;
            }
        }
    }
}