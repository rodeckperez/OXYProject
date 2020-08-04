using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Security.Principal;
using System.Globalization;
using System.Data;

namespace WorkingInfo
{
    public partial class _Symptoms : Page
    {

        protected void Page_Load(object sender, EventArgs e)
        {
            //if (!IsPostBack)
            //{
            WindowsIdentity wId = (WindowsIdentity)HttpContext.Current.User.Identity;
            username.Text = wId.Name.ToUpper();
            Name.Text = username.Text.Replace("NAOXY\\", "");
            Name.Text = "xardilaf";
            //Check if exists answer for current day
            ndate.Text = DateTime.Today.ToString();

            SqlDataUsername.SelectParameters["Name"].DefaultValue = Name.Text;
            DataView dvSql1 = (DataView)SqlDataUsername.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql1 in dvSql1)
            {
                Nid.Text = drvSql1["Nid"].ToString();
                EmployeeName.Text = drvSql1["Name"].ToString();
                //TextAlertName.Text = EmployeeName.Text;
                TextAccessName.Text = EmployeeName.Text;
                TextDeniedName.Text = EmployeeName.Text;
                RadBarcode3.Text = Nid.Text;
                RadBarcode1.Text = Nid.Text;
                FirstName.Text = drvSql1["First_Name"].ToString();
                LastName.Text = drvSql1["Last_Name"].ToString();
            }
            AccessDate.Text = Convert.ToDateTime(ndate.Text).ToString("dd/MMM/yyyy");
            DeniedDate.Text = Convert.ToDateTime(ndate.Text).ToString("dd/MMM/yyyy");

            SqlDataSymptoms.SelectParameters["id"].DefaultValue = Nid.Text;
            SqlDataSymptoms.SelectParameters["ndate"].DefaultValue = DateTime.Today.ToString();



            DataView dvSql = (DataView)SqlDataSymptoms.Select(DataSourceSelectArguments.Empty);
            foreach (DataRowView drvSql in dvSql)
            {
                TextBox1.Text = drvSql["resultado"].ToString();
            }


            if (TextBox1.Text == "0")
            {

                var tab = RadTabStrip1.FindTabByText("Access");
                tab.Visible = false;

                var tab1 = RadTabStrip1.FindTabByText("Survey");
                tab1.Visible = true;

                Symptoms.Visible = true;
                results.Visible = false;
                nonresults.Visible = false;
                Symptoms.Selected = true;

            }
            else
            {
                var tab = RadTabStrip1.FindTabByText("Access");
                tab.Visible = true;

                var tab2 = RadTabStrip1.FindTabByText("Denied");
                tab2.Visible = true;

                var tab1 = RadTabStrip1.FindTabByText("Survey");
                tab1.Visible = false;

                tab.Selected = true;

                Symptoms.Visible = false;
                results.Visible = true;
                nonresults.Visible = true;
                results.Selected = true;

            }




        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            string Answergroup1 = string.Join(",", RadioButtonList1.SelectedIndices);
            string Answergroup2 = string.Join(",", RadRadioButtonList3.SelectedIndices);
            string resultadosother = RadioButtonList2.SelectedValue.ToString();
            if (Answergroup1 != null && Answergroup1 != "" && TextBox1.Text == "0" && Answergroup2 != null && Answergroup2 != "" && resultadosother != null && resultadosother != "")
            {
                if (resultadosother == "0" || (resultadosother == "1" && comments.Text != null && comments.Text != ""))
                {
                    WindowsIdentity wId = (WindowsIdentity)HttpContext.Current.User.Identity;
                    username.Text = wId.Name.ToUpper();
                    answer1.Text = Answergroup1;
                    answer2.Text = Answergroup2;
                    answer3.Text = resultadosother;
                    ndate.Text = DateTime.Now.ToString();

                    Symptoms.Visible = false;
                    results.Visible = true;
                    nonresults.Visible = true;

                    var tab = RadTabStrip1.FindTabByText("Access");
                    tab.Visible = true;
                    var tab2 = RadTabStrip1.FindTabByText("Denied");
                    tab2.Visible = true;

                    var tab1 = RadTabStrip1.FindTabByText("Survey");
                    tab1.Visible = false;
                    Button1.Enabled = false;
                    results.Selected = true;
                    tab.Selected = true;


                    SqlDataSymptoms.Insert();


                }
            }
            else
            {
                if (TextBox1.Text == "0")
                {
                    string Message = "Informacion incompleta";


                    if (Answergroup1 == null || Answergroup1 == "")
                    {

                        Message = Message + "\\n -Reporte Sintomas para hoy? / Symptoms Report for today";
                    }
                    if (Answergroup2 == null || Answergroup2 == "")
                    {
                        Message = Message + "\\n -Información de Contactos y Viajes? / Contact & Travels information";

                    }
                    if (resultadosother == null || resultadosother == "")
                    {
                        Message = Message + "\\n -Informacion de grupo familiar (convivientes)";
                    }
                    if (resultadosother == "1" && (comments.Text == null || comments.Text == ""))
                    {
                        Message = Message + "\\n -Comentarios de Informacion de grupo familiar (convivientes)";
                    }
                    MsgBox(Message, this.Page, this);
                }
            }

        }

        public void MsgBox(String ex, Page pg, Object obj)
        {
            string s = "<SCRIPT language='javascript'>alert('" + ex.Replace("\r\n", "\\n").Replace("'", "") + "'); </SCRIPT>";
            Type cstype = obj.GetType();
            ClientScriptManager cs = pg.ClientScript;
            cs.RegisterClientScriptBlock(cstype, s, s.ToString());
        }
    }
}