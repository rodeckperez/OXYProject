using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Telerik.Web.UI;

namespace OXYProject
{
    public partial class RegisterForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            RadAutoCompleteBox1.Filter = (RadAutoCompleteFilter)Enum.Parse(typeof(RadAutoCompleteFilter), "Contains", true);
            RadAutoCompleteBox1.TextSettings.SelectionMode = (RadAutoCompleteSelectionMode)Enum.Parse(typeof(RadAutoCompleteSelectionMode), "Single", true);
        
        }
    }
}