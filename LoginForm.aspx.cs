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
            string Response = "";
            Response = employeeLogic.LoginEmployee(Identificacion.Text, int.Parse(password.Text));
            if (Response == "OK")
            {
                lblResponse.ForeColor = Color.Green;
                lblResponse.Text = "Bienvenido";
                Identificacion.Text = "";
                password.Text = "";
            }
            else
            {
                string title = "Aviso";
                string body = Response;
                ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
            }
        }

      
    }

}