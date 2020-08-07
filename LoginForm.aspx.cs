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
            if (!Page.IsPostBack) {
                Session["EMPLOYEE"] = null;
            }
        }

        public void LoginUser(object sender, EventArgs e)
        {
            ModelOXY.Employee.Employee employee = new ModelOXY.Employee.Employee();
            if (password.Text.Trim().Length > 0)
            {
                string Result = "";
                Result = employeeLogic.LoginEmployee(Identificacion.Text, int.Parse(password.Text), out employee);
                if (Result == "OK")
                {
                    Session["EMPLOYEE"] = employee;
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

}