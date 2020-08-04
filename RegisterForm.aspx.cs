using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Input;
using Telerik.Web.UI;

namespace OXYProject
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        LogicOXY.Employee.EmployeeLogic employeeLogic = new LogicOXY.Employee.EmployeeLogic();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                RadAutoCompleteBox1.Filter = (RadAutoCompleteFilter)Enum.Parse(typeof(RadAutoCompleteFilter), "Contains", true);
                RadAutoCompleteBox1.TextSettings.SelectionMode = (RadAutoCompleteSelectionMode)Enum.Parse(typeof(RadAutoCompleteSelectionMode), "Single", true);
            }
        }

        public void SaveEmployee(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                string Response = "";
                ModelOXY.Employee.Employee employee = new ModelOXY.Employee.Employee();
                employee.IdentificationNumber = IdentificationNumber.Text;
                employee.Names = Names.Text;
                employee.Mail = Mail.Text;
                employee.Company = RadAutoCompleteBox1.Text;
                Response = employeeLogic.RegisterEmloyee(employee);
                if (Response == "OK")
                {
                    string title = "Aviso";
                    string body = "Cuenta creada exitosamente, te hemos enviado un correo electronico";
                    ClientScript.RegisterStartupScript(this.GetType(), "Popup", "ShowPopup('" + title + "', '" + body + "');", true);
                    ClearControls();
                }
                else
                {
                    lblResponse.ForeColor = Color.Red;
                    lblResponse.Text = Response;
                }
            }
        }


        private void ClearControls()
        {
            IdentificationNumber.Text = "";
            Names.Text = "";
            Mail.Text = "";
            RadAutoCompleteBox1.Entries.Clear();
        }

        public void RedirectPage(object sender, EventArgs e)
        {
            Response.Redirect(Page.ResolveClientUrl("/LoginForm.aspx"));
        }

        public void CompanyEntry(object sender, EventArgs e)
        {

        }

        private void OnKeyDown(object sender, KeyEventArgs e)
        {
            if (e.Key == Key.Enter)
            {
                var autoComplete = (RadAutoCompleteBox)sender;

            }
        }


    }
}