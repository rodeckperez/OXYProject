<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginForm.aspx.cs" Inherits="OXYProject.LoginForm" %>

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
</head>
<body>

    <div class="limiter">
        <div class="container-login100">
            <div class="wrap-login100">
                <form class="login100-form validate-form p-l-55 p-r-55 p-t-178" id="form2" runat="server">
                    <span class="login100-form-title">Ingreso
                    </span>

                    <div class="wrap-input100 validate-input m-b-16" data-validate="Please enter username">

                        <asp:TextBox ID="Identificacion" placeholder="Numero de Identificación" class="input100" runat="server" required="true"></asp:TextBox>
                        <span class="focus-input100"></span>
                    </div>

                    <div class="wrap-input100 validate-input" >
                        <asp:TextBox runat="server" class="input100" type="password" name="pass" placeholder="Contraseña" MaxLength="4"
                            ID="password" onfocus="showKeyboard()" required="true"> </asp:TextBox>

                        <div id="divKeyboard">
                            <div id="cryxpad-clavier" style="position: relative; left: 50%;">
                                <div class="cryxpad-container"></div>

                            </div>

                            <div id="cryxpad-clavier" style="position: relative; left: 40%; padding-top: 15px;">
                                <button id="cryxpad-remove-btn" type="button" class="btn btn-danger">Borrar</button>
                            </div>
                            <span class="focus-input100"></span>
                        </div>
                    </div>

                    <div class="text-right p-t-13 p-b-23">
                        <asp:HyperLink runat="server" href="RecoverForm" class="txt2">Olvide mi contraseña
                        </asp:HyperLink>
                    </div>

                    <div class="flex-col-c p-t-10 p-b-12">
                        <asp:Label ID="lblResponse" runat="server"></asp:Label>
                    </div>

                    <div class="container-login100-form-btn">
                        <asp:Button ID="BtnLogin" Text="Ingresar" class="login100-form-btn" runat="server" OnClick="LoginUser"></asp:Button>
                    </div>

                    <div class="flex-col-c p-t-170 p-b-40">
                        <span class="txt1 p-b-9">¿No tienes una contraseña asignada?
                        </span>

                        <asp:HyperLink runat="server" href="RegisterForm" class="txt3">Registrarse
                        </asp:HyperLink>
                    </div>

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
                                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Aceptar</button>
                                </div>
                            </div>
                        </div>
                    </div>


                    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
                    <script src="vendor/bootstrap/js/popper.js"></script>
                    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
                    <script src="js/jquery.cryxpad.js"></script>
                    <script src="js/LoginJS.js"></script>
                    <script type="text/javascript">
                        $(function () {
                            $('.cryxpad-container').cryxpad({
                                'inputFormId': 'password',
                                'removeButtonId': 'cryxpad-remove-btn',
                                'validateButtonId': 'cryxpad-validate-btn',
                                'carreaux': 4,
                                'width': 50,
                                'height': 50,

                            });
                            $("#divKeyboard").hide();
                        });

                        function ShowPopup(title, body) {
                            $("#MyPopup .modal-title").html(title);
                            $("#MyPopup .modal-body").html(body);
                            $("#MyPopup").modal("show");
                        }
                    </script>
                </form>
            </div>
        </div>
    </div>
</body>
</html>
