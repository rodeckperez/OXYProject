using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OXYProject
{
    public partial class LoginForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
       //  RadFormDecorator1.DecoratedControls = UI.FormDecoratorDecoratedControls.All;
        }

        protected void Login2_LogginIn(object sender, LoginCancelEventArgs e)
        {
            e.Cancel = true;
        //    LabelLogin.Text = "Welcome back, " + (Login2.FindControl("UserName") as TextBox).Text;
        }

        protected void ChangePassword1_ChangingPassword(Object sender, LoginCancelEventArgs e)
        {
            e.Cancel = true;
           // LabelChangePassword.Text = "You have successfully changed your password!";
        }

        protected void CreateUserWizard2_OnCreatingUser(object sender, LoginCancelEventArgs e)
        {
            e.Cancel = true;
         //   LabelCreateUser.Text = "User <i>" + (sender as CreateUserWizard).UserName + "</i> created! Welcome aboard!";
        }
    }

}