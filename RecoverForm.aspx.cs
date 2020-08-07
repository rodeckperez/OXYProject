using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OXYProject
{
    public partial class RecoverForm : System.Web.UI.Page
    {

        LogicOXY.Employee.EmployeeLogic employeeLogic = new LogicOXY.Employee.EmployeeLogic();
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public void RecoverPassword(object sender, EventArgs e)
        {
            BtnRecover.Enabled = false;
            if (Page.IsValid) {
                string Response = "";
                Response = employeeLogic.RecoverPassword(Mail.Text);
                if (Response == "OK")
                {
                    string title = "Aviso";
                    string body = "Te hemos enviado un correo electronico con tu nueva contraseña";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    Mail.Text = "";
                }
                else


                {
                    lblResponse.ForeColor = Color.Red;
                    lblResponse.Text = Response;
                }
            }
            BtnRecover.Enabled = true;
        }

        public void RedirectPage(object sender, EventArgs e)
        {
            Response.Redirect(Page.ResolveClientUrl("/LoginForm.aspx"));
        }
    }
}