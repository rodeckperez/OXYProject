<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RegisterForm.aspx.cs" Inherits="OXYProject.RegisterForm" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" type="text/css" href="vendor/bootstrap/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="fonts/font-awesome-4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" type="text/css" href="vendor/animate/animate.css">
    <link rel="stylesheet" type="text/css" href="vendor/animsition/css/animsition.min.css">
    <link rel="stylesheet" type="text/css" href="css/util.css">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <style>
        #RadAutoCompleteBox1_Input {
            height: 100%;
        }

        .racTextToken {
            padding: 15px 0 0 4px !important;
        }

        .RadAutoCompleteBox .racEmptyMessage {
            font-style: normal !important;
            color: black !important;
            filter: alpha(opacity=80);
            opacity: .8;
        }
    </style>
</head>
<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" id="form2" runat="server">
                    <telerik:RadScriptManager ID="RadScriptManager1" runat="server" />
                    <span class="login100-form-title">Ingreso
                    </span>


                    <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">
                        <asp:TextBox ID="IdentificationNumber" placeholder="Numero de identificación" class="input100" runat="server" required="true"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter password">
                        <asp:TextBox ID="Names" placeholder="Nombre completo" class="input100" runat="server" required="true"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter password">
                        <telerik:RadAutoCompleteBox class="input100" RenderMode="Lightweight" runat="server"
                            ID="RadAutoCompleteBox1" EmptyMessage="Empresa"
                            DataSourceID="SqlDataSource1" DataTextField="nombre_empresa"
                            InputType="Text" Width="300">
                        </telerik:RadAutoCompleteBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input m-b-16">
                        <asp:TextBox ID="Mail" placeholder="Correo" class="input100" runat="server"></asp:TextBox>
                      </div>

                    <div>
                        <asp:RequiredFieldValidator ID="emailvalidator" runat="server"
                            ControlToValidate="Mail" ErrorMessage="El correo es obligatorio" ForeColor="Red">
                        </asp:RequiredFieldValidator>
                    </div>
                      <div class="flex-col-c p-t-10 p-b-12">
                        <asp:Label ID="lblResponse" runat="server"></asp:Label>
                    </div>
                    <div class="flex-col-c p-t-15 p-b-10">
                        <asp:Button ID="BtnSaveEmployee" Text="Registrarme" class="login100-form-btn" runat="server" OnClick="SaveEmployee"></asp:Button>
                    </div>

                    <div class="flex-col-c p-t-10 p-b-40">
                        <button type="button" class="btn btn-danger" data-dismiss="modal" onclick="RedirectPage()">Cancelar</button>
                    </div>

                    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
                        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id_empresa], nombre_empresa FROM empresa" />

                    <telerik:RadAjaxManager ID="RadAjaxManager1" runat="server">
                        <AjaxSettings>
                            <telerik:AjaxSetting AjaxControlID="ConfigurationPanel1">
                                <UpdatedControls>
                                    <telerik:AjaxUpdatedControl ControlID="ConfigurationPanel1" LoadingPanelID="RadAjaxLoadingPanel1" />
                                    <telerik:AjaxUpdatedControl ControlID="RadAutoCompleteBox1" />
                                </UpdatedControls>
                            </telerik:AjaxSetting>
                        </AjaxSettings>
                    </telerik:RadAjaxManager>

                    <div id="MyPopup" class="modal fade" role="dialog">
                        <div class="modal-dialog" role="document">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title"></h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="RedirectPage()">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>

                    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                    <script src="vendor/bootstrap/js/popper.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
                    <script>
                        $(".racTokenList").addClass("input100");
                        $(".racTokenList").removeClass("racTokenList");
                        function ShowPopup(title, body) {
                            $("#MyPopup .modal-title").html(title);
                            $("#MyPopup .modal-body").html(body);
                            $("#MyPopup").modal("show");
                        }

                        function RedirectPage() {
                            location.href = 'LoginForm';
                        }
                    </script>
                    <telerik:RadAjaxLoadingPanel runat="server" ID="RadAjaxLoadingPanel1" />
                </form>
            </div>
        </div>
    </div>
</body>
</html>
