using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THE_PROJECT_E_PERSONAL
{
    public partial class DeleteForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            btnDelete.Enabled=false;
        }

        protected void btnFind_Click(object sender, EventArgs e)
        {
            CsEmployee objEmp = new CsEmployee();
            bool flag;
            try
            {
                Int32 _codeofEmp=Convert.ToInt32(txtcode.Text.Trim());
                flag = objEmp.validateEmpCode(_codeofEmp);
                if (flag)
                {
                    btnDelete.Enabled = true;
                    txtcode.Enabled = false;
                    objEmp.getEmployee(_codeofEmp);
                    notFound.Visible = false;
                    txtdept.Text = objEmp._deptName;
                    txtdesi.Text = objEmp._Designation; 
                    txtname.Text = objEmp._Name;
                    txtyears.Text = objEmp._yearsOfService.ToString();
                    txtdept.Enabled = false;
                    txtdesi.Enabled = false;
                    txtname.Enabled = false;
                    txtyears.Enabled = false;
                }
                else
                {
                    notFound.Text = "Employee code not found!";
                    notFound.Visible = true;
                    txtcode.Focus();
                }
            }
            catch
            {
                notFound.Text = "Please Use only Numeric values without space and special characters for employee code";
                txtcode.Focus();
            }
            


        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                CsEmployee objEmp = new CsEmployee();
                Int32 _codeofEmp = Convert.ToInt32(txtcode.Text.Trim());
                objEmp.deleteEmployee(_codeofEmp);

                txtcode.Text = "";
                txtdept.Text = "";
                txtdesi.Text = "";
                txtname.Text = "";
                txtyears.Text = "";
                notFound.Text = "Information about  " + _codeofEmp + " has been deleted";
                notFound.Visible = true;
                btnDelete.Enabled = false;
                txtcode.Enabled = true;
            }
            catch
            {
                notFound.Text = "You must first enter a code in the code field and click find in order to delete";
                txtcode.Focus();
            }

        }

        protected void btnAnother_Click(object sender, EventArgs e)
        {
            Server.Transfer("DeleteForm.aspx");
            txtcode.Focus();
        }
    }
}