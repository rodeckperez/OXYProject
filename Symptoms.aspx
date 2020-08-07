<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Symptoms.aspx.cs" Inherits="WorkingInfo._Symptoms" %>

<%@ Register Assembly="Telerik.Web.UI" Namespace="Telerik.Web.UI" TagPrefix="telerik" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script src="vendor/jquery/jquery-3.2.1.min.js"></script>
    <script src="vendor/bootstrap/js/popper.js"></script>
    <script src="vendor/bootstrap/js/bootstrap.min.js"></script>
    <script>
    </script>
     <style>
        .rbCheckBox {
            text-align: justify;
        }

        .RadButton .rbText {
            display: contents !important;
            vertical-align: top;
        }
    </style>

    <telerik:RadTabStrip RenderMode="Lightweight" runat="server" ID="RadTabStrip1" MultiPageID="RadMultiPage2" SelectedIndex="0">
        <Tabs>
            <telerik:RadTab Text="Survey" PageViewID="Symptoms" Visible="false"></telerik:RadTab>
            <telerik:RadTab Text="Access" PageViewID="results" Visible="false"></telerik:RadTab>
            <telerik:RadTab Text="Denied" PageViewID="nonresults" Visible="false"></telerik:RadTab>


        </Tabs>
    </telerik:RadTabStrip>
    <br />
    <div class="flex-col-c p-t-0 p-b-40" style="text-align-last: end;">
        <asp:Button ID="BtnCloseSession" Text="Cerrar Sesión" class="btn btn-danger" runat="server" OnClick="BtnCloSession_Click"></asp:Button>
    </div>
    <br />
    <telerik:RadMultiPage runat="server" ID="RadMultiPage2" SelectedIndex="0">
        <telerik:RadPageView runat="server" ID="Symptoms" Visible="true">
            <div class="jumbotron">
                <h1>Estado Actual / Current Status  </h1>
            </div>




            <asp:Table runat="server" ID="HealthInfo">
                <asp:TableRow>
                    <asp:TableCell>
                        Hello,<asp:LoginName ID="loginname1" runat="server" />
                        !
        <h1>Declaración sobre Estado de Salud / Health Status Declaration</h1>
                        <h6>Por favor informe si usted o algún miembro de sus familia, que viva con usted, ha presentado alguno de los siguientes síntomas* en las últimas 24 horas.<br />
                            Fiebre (igual o mayor a 38°C),  Tos seca,  Fatiga o Dificultad para respirar,  - Pérdida del olfato y el gusto<br />
                            *Fuente CDC<br />
                            Si su respuesta es afirmativa, por favor especifique. La información que usted suministre, solamente será conocida por el área de salud ocupacional.
                            <br />
                            En caso de presentar al menos uno de esos síntomas, por favor informe a su servicio médico, EPS o Empresa de Medicina Prepagada </h6>
                        <h6>Please inform if you or any of your family members, that live with you, have presented any of the following symptoms* in the last 24 hours. 
                            <br />
                            *Source: CDC
                            <br />
                            Fever (equal to or greater than 38°C, Dry cough, Fatigue or difficulty breathing,  Loss of smell and taste<br />
                            If your answer is affirmative, please specify. The information you provide will only be known by the Occupational Health area.
                            <br />
                            In case of presenting at least one of these symptoms, please inform your medical service, EPS or Supplemental Medicine Provider<br />
                        </h6>
                        <br />
                    </asp:TableCell>
                </asp:TableRow>
            </asp:Table>
            <div class="row">
                <div class="col-md-8">
                    <h1>
                        <asp:Label ID="Label2" runat="server" Text="Reporte Sintomas para hoy? / Symptoms Report for today?" /></h1>
                    <telerik:RadCheckBoxList runat="server" ID="RadioButtonList1" DataSourceID="SqlDataSource1" AutoPostBack="false" RenderMode="Lightweight" Columns="1" Layout="Flow">
                        <DataBindings DataTextField="Description" DataValueField="ID" />
                    </telerik:RadCheckBoxList>

                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <h1>
                        <asp:Label ID="Label3" runat="server" Text="Información de Contactos y Viajes? / Contact & Travels information?" /></h1>
                    <telerik:RadCheckBoxList runat="server" ID="RadRadioButtonList3"  DataSourceID="SqlDataSource5"  AutoPostBack="false" RenderMode="Lightweight" Columns="1" Layout="Flow">
                        <DataBindings DataTextField="Description" DataValueField="ID"/>
                    </telerik:RadCheckBoxList>

                </div>
            </div>

            <div class="row">
                <div class="col-md-8">
                    <h1>
                        <asp:Label ID="Label5" runat="server" Text="Informacion de grupo familiar (convivientes)" /></h1>
                    <h6>
                        <asp:Label ID="Label6" runat="server" Text=" Algún miembro de su familia que vive con usted? Ha consultado al médico de su proveedor de servicios médicos por sintomas descritos anteriorments?) / (Are you referring  any of your family members that live with you? Have you consulted your medical doctor in regards to previous described symptoms?) " /></h6>
                    <telerik:RadRadioButtonList runat="server" ID="RadioButtonList2" AutoPostBack="false">
                        <Items>
                            <telerik:ButtonListItem Text="No / Not" Value="0" />
                            <telerik:ButtonListItem Text="Si / Yes" Value="1" />
                        </Items>
                    </telerik:RadRadioButtonList>


                </div>
            </div>



            <div class="row">
                <div class="col-md-8">
                    <h6>
                        <asp:Label ID="Label4" runat="server" Text=" En caso afirmativo, especifique el parentesco y los sintomas del miembro de su familia/In case yes, please specify what the relationship and symptoms " /></h6>

                </div>
            </div>


            <asp:Table runat="server" ID="CommentTable">
                <asp:TableRow>
                    <asp:TableCell>
                        <asp:TextBox runat="server" ID="comments" Visible="true" Rows="5" TextMode="MultiLine" CssClass="textbox"></asp:TextBox>

                    </asp:TableCell>
                </asp:TableRow>

            </asp:Table>


            <br>
            <asp:Button ID="Button1" runat="server" Text="Submit" TabIndex="6" CssClass="btn btn-primary" OnClick="Button1_Click"></asp:Button>
            <br />
            <br />
        </telerik:RadPageView>

        <telerik:RadPageView runat="server" ID="results">
            <div class="jumbotron">
                <h1>Access Granted</h1>
                <h2>
                    <asp:TextBox ID="TextAccessName" runat="server" Visible="true" BackColor="#5cb85c" BorderStyle="None" Width="100%"></asp:TextBox></h2>
                <h2>
                    <asp:TextBox ID="AccessDate" runat="server" Visible="true" BackColor="#5cb85c" BorderStyle="None" Width="100%"></asp:TextBox></h2>
                <telerik:RadBarcode runat="server" ID="RadBarcode3" Type="Code11" Height="140px" ShowChecksum="false"
                    Width="250px" Style="margin-left: 30px" OutputType="SVG_VML">
                </telerik:RadBarcode>
                <br />
                Based on your answers at this time you have access to OXY offices

            </div>
        </telerik:RadPageView>


        <telerik:RadPageView runat="server" ID="nonresults">
            <div class="alertmsg">
                <h1>Access Denied</h1>
                <h2>
                    <asp:TextBox ID="TextDeniedName" runat="server" Visible="true" BackColor="Crimson" BorderStyle="None" Width="100%"></asp:TextBox></h2>
                <h2>
                    <asp:TextBox ID="DeniedDate" runat="server" Visible="true" BackColor="Crimson" BorderStyle="None" Width="100%"></asp:TextBox></h2>
                <telerik:RadBarcode runat="server" ID="RadBarcode1" Type="Code11" Height="140px" ShowChecksum="false"
                    Width="250px" Style="margin-left: 30px" OutputType="SVG_VML">
                </telerik:RadBarcode>
                <br />
                Based on your answers at this time you don't have access to OXY offices
            </div>
        </telerik:RadPageView>


    </telerik:RadMultiPage>
    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("resultado") %>' Visible="false"></asp:TextBox>
    <asp:TextBox ID="ndate" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="username" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="Name" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="answer1" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="answer2" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="answer3" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="Nid" Visible="false" runat="server"></asp:TextBox>
    <asp:TextBox ID="EmployeeName" Visible="false" runat="server"> </asp:TextBox>
    <asp:TextBox ID="FirstName" Visible="false" runat="server"> </asp:TextBox>
    <asp:TextBox ID="LastName" Visible="false" runat="server"> </asp:TextBox>

    <asp:SqlDataSource runat="server" ID="SqlDataSource3" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        SelectCommand="SELECT count(*) as resultado FROM [answers] where username=@username and cast(ndate as Date)=cast(@ndate as Date)">
        <SelectParameters>
            <asp:ControlParameter Name="username" ControlID="username" DbType="String" />
            <asp:ControlParameter Name="ndate" ControlID="ndate" DbType="Date" />
        </SelectParameters>

    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource1" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id], [description] FROM [symptoms_questions_tbl] where symptom_type=1" />

    <asp:SqlDataSource runat="server" ID="SqlDataSource5" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [id], [description] FROM [symptoms_questions_tbl] where symptom_type=2" />

    <asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        InsertCommand="INSERT answers (ndate,username,answer) values (@ndate,@username,@answer)"
        SelectCommand="SELECT count(*) as resultado FROM [answers] where username=@username and ndate=@ndate">
        <SelectParameters>
            <asp:ControlParameter Name="username" ControlID="username" DbType="String" />
            <asp:ControlParameter Name="ndate" ControlID="ndate" DbType="Date" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter Name="ndate" ControlID="ndate" DbType="DateTime" />
            <asp:ControlParameter Name="username" ControlID="username" DbType="String" />
            <asp:ControlParameter Name="answer" ControlID="answer" DbType="Int32" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataUsername" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        ProviderName="System.Data.SqlClient" SelectCommand="SELECT [Nid] ,Name,Last_Name ,[First_name] FROM [EmployeeMaster_V] where upper(User_ID)=@Name ">
        <SelectParameters>
            <asp:ControlParameter Name="Name" ControlID="Name" DbType="String" />
        </SelectParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSource4" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        InsertCommand="INSERT other_info (ndate,id,answer1,answer2,comments) values (@ndate,@username,@answer1,@answer2,@comments)">
        <InsertParameters>
            <asp:ControlParameter Name="ndate" ControlID="ndate" DbType="DateTime" />
            <asp:ControlParameter Name="id" ControlID="username" DbType="String" />
            <asp:ControlParameter Name="answer1" ControlID="answer1" DbType="String" />
            <asp:ControlParameter Name="answer2" ControlID="answer2" DbType="String" />
            <asp:ControlParameter Name="comments" ControlID="comments" DbType="String" />
        </InsertParameters>
    </asp:SqlDataSource>

    <asp:SqlDataSource runat="server" ID="SqlDataSymptoms" ConnectionString="<%$ ConnectionStrings:WorkInfoConnection %>"
        InsertCommand="INSERT symptoms_answers (ndate,id,answer1,answer2,answer3,comments) values (@ndate,@id,@answer1,@answer2,@answer3,@comments)"
        SelectCommand="SELECT count(*) as resultado FROM [symptoms_answers] where id=@id and cast(ndate as date)=cast(@ndate as date)">
        <SelectParameters>
            <asp:ControlParameter Name="id" ControlID="Nid" DbType="String" />
            <asp:ControlParameter Name="ndate" ControlID="ndate" DbType="Date" />
        </SelectParameters>
        <InsertParameters>
            <asp:ControlParameter Name="ndate" ControlID="ndate" DbType="DateTime" />
            <asp:ControlParameter Name="id" ControlID="Nid" DbType="String" />
            <asp:ControlParameter Name="answer1" ControlID="answer1" DbType="String" />
            <asp:ControlParameter Name="answer2" ControlID="answer2" DbType="String" />
            <asp:ControlParameter Name="answer3" ControlID="answer3" DbType="String" />
            <asp:ControlParameter Name="comments" ControlID="comments" DbType="String" />
        </InsertParameters>
    </asp:SqlDataSource>


</asp:Content>





