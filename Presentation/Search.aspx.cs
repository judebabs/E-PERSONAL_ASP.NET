using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THE_PROJECT_E_PERSONAL
{
    public partial class Search : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                txtcode.Focus();
            }

        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            
            txtdept.Text = "";
            txtname.Text = "";
            txtyears.Text = "";
            txtdesi.Text = "";
            CsEmployee objEmp = new CsEmployee();
            try
            {
                
                

                if (txtcode.Text.Length == 6)
                {
                    Int32 num = Convert.ToInt32(txtcode.Text.Trim());
                    bool result = objEmp.validateEmpCode(num);
                    if (!result)
                    {
                        notFound.Visible = true;
                        notFound.Text = "Employee code not found! ";
                    }
                    else
                    {
                        //After the Business logic has searched the datasource it retrieve information
                        //for the corresponded employee code.
                        notFound.Visible = false;
                        objEmp.getEmployee(num);

                        txtname.Text = objEmp._Name;
                        txtdesi.Text = objEmp._Designation;
                        txtdept.Text = objEmp._deptName;
                        txtyears.Text = objEmp._yearsOfService.ToString();
                        
                    }
                    
                }
                else
                {
                    //retrieves an error message when the user has typed an employee code less or greater than 
                    //6 digits long.
                    notFound.Text = "Employee code should be 6 digits long without space and special characters.";
                    notFound.Visible = true;
                }
            }
            catch
            {
                //retrieve an error message when a user has typed letter in the employee code textbox
                //while doing a search operation
                notFound.Text = "Incorrect Employee Code! Please Use only Numeric values without space and special characters for employee code";
                txtcode.Focus();
            }

        }
    }
}