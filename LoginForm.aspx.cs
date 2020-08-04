using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OXYProject
{
    public partial class LoginForm : System.Web.UI.Page
    {
        LogicOXY.Employee.EmployeeLogic employeeLogic = new LogicOXY.Employee.EmployeeLogic();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        public void LoginUser(object sender, EventArgs e)
        {
            string Result = "";
            Result = employeeLogic.LoginEmployee(Identificacion.Text, int.Parse(password.Text));
            if (Result == "OK")
            {
                Response.Redirect("~/Symptoms");
                Identificacion.Text = "";
                password.Text = "";
            }
            else
            {
                string title = "Aviso";
                string body = Result;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
        }

      
    }

}