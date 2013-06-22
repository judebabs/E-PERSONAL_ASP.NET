using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace THE_PROJECT_E_PERSONAL
{
    public partial class Add : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                populate_drp();
            }
            

        }
        private void populate_drp()
        {
            dropDept.Items.Clear();
            csDepartment obj = new csDepartment();
            dropDept.DataSource = obj.getDepartment();
            dropDept.DataBind();
          
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

            Int32 cod;
           try
            {
                cod = Convert.ToInt32(txtcode.Text.Trim());
                if (txtcode.Text.Trim().Length == 6)
                {
                     
                    
                    Int16 val = Convert.ToInt16(dropDept.SelectedIndex);
                    String _name = txtname.Text.Trim();
                    String _des = txtdesi.Text.Trim();
                    String dep_name = Convert.ToString(dropDept.Items[val]);

                    CsEmployee test = new CsEmployee();
                    // call the function validate which is in the class CSemployee in order 
                    //to verify if the typed code already exist within the database if yes the the program
                    //display a message error
                    bool result = test.validateEmpCode(cod);
                    if (!result)
                    {
                        errorDuplicate.Visible = false;
                        CsEmployee obj = new CsEmployee(cod, _name, _des, dep_name);
                        obj.AddEmployee();
                        txtcode.Text = "";
                        txtdesi.Text = "";
                        txtname.Text = "";
                        succes.Text = "Information has been succesfully saved";
                        succes.Visible = true;
                        updateTimer();
                        populate_drp();
                        
                    }
                    else
                    {
                        errorDuplicate.Visible = true;
                        errorDuplicate.Text = "Employee code already exists.Please re-enter employee code";
                        txtcode.Focus();
                        succes.Visible = false;

                    }
                }
                else
                {
                    errorDuplicate.Text = "Employee Code Must be 6 digits long without space and special characters.";
                    txtcode.Focus();
                    succes.Visible = false;
                    errorDuplicate.Visible = true;
                }
           }
           catch
           {
               errorDuplicate.Visible = true;
               errorDuplicate.Text = "Please Use only Numeric values without space and special characters for employee code";
               txtcode.Focus();
               succes.Visible = false;
          }
         
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

        
    }
}