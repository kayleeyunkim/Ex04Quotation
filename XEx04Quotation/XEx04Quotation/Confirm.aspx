<!--
  Yun Kim
  WLAC COS 963
  WEB APPLICATION USING ASP.NET
  Project 3: Enhance te Quotation Application
  Oct. 17, 2016
-->

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Confirm.aspx.cs" Inherits="XEx04Quotation.Confirm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Confirm quotation</title>
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Content/site.css" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            left: 0px;
            top: 0px;
        }
        .auto-style3 {
            color: #31708f;
            left: -1010px;
            width: 639px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" class="form-horizontal">

        <main class="container">

            <h1 class="jumbotron">Quotation confirmation</h1>

            <div class="form-group">
                <label class="col-sm-3 control-label">Sales price</label>
                <asp:Label ID="lblSalesPrice" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Discount amount</label>
                <asp:Label ID="lblDiscountAmount" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div>

            <div class="form-group">
                <label class="col-sm-3 control-label">Total price</label>
                <asp:Label ID="lblTotalPrice" runat="server" CssClass="col-sm-3 bold"></asp:Label>
            </div> 

            <div class="row">
                <h3 class="col-sm-offset-2 col-sm-10">Send confirmation to</h3>
            </div>
            
            <div class="form-group">
                <label class="col-sm-3 control-label">Name</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtName" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtName" 
                        Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>  
            </div>  
            
            <div class="form-group">
                <label class="col-sm-3 control-label">Email address</label>
                <div class="col-sm-3">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"></asp:TextBox>
                </div>
                <div class="col-sm-6">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtEmail" 
                        Display="Dynamic" ErrorMessage="Required" CssClass="text-danger"></asp:RequiredFieldValidator>
                </div>  
            </div>  

            <%-- Quotation and Return buttons --%>
            <div class="form-group">
                <div class="col-sm-offset-3 col-sm-9">
                    <asp:Button ID="btnSendQuotation" runat="server" Text="Send Quotation"
                         CssClass="btn btn-primary" OnClick="btnSendQuotation_Click"/> 
                    <asp:Button ID="btnReturn" runat="server" Text="Return" CausesValidation="false"
                         CssClass="btn btn-primary" PostBackUrl="~/Default.aspx"/>
                </div>
            </div> 
            
            <%-- message label --%>
            <div class="form-group">
                <div class="auto-style1">
                    <%-- message label goes here --%>
                    <label class="text-info">Click the Send Quotation button to send the quotation via email</label>
                    <asp:Label ID="lblMassage" runat="server" CssClass="col-sm-3 control-label"></asp:Label>
                    <br />

                    <h2>
                        <label class="col-lg-3 control-label"></label>
                        <asp:Label ID="lblConfirmMessage" runat="server" CssClass="bg-success"></asp:Label>
                    </h2>

            </div>

        </main>

        <p>
                </p>

    </form>
</body>
</html>
