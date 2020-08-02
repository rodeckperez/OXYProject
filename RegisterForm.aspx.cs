using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
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
            string Response = "";
            ModelOXY.Employee.Employee employee = new ModelOXY.Employee.Employee();
            employee.IdentificationNumber = IdentificationNumber.Text;
            employee.Names = Names.Text;
            employee.Mail = Mail.Text;
            employee.Company = RadAutoCompleteBox1.Text;
            Response = employeeLogic.RegisterEmloyee(employee);
            if (Response == "OK")
            {
                lblResponse.ForeColor = Color.Green;
                lblResponse.Text = "Cuenta creada exitosamente, te hemos enviado un correo electronico";
                ClearControls();
            }
            else
            {
                lblResponse.ForeColor = Color.Red;
                lblResponse.Text = Response;
            }
        }


        private void ClearControls() {
            IdentificationNumber.Text = "";
            Names.Text = "";
            Mail.Text = "";
            RadAutoCompleteBox1.Entries.Clear();
        }
    }
}