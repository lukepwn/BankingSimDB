<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Profile.aspx.cs" Inherits="LukeDam_KevinKim_Assignment3.Profile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1 {
            font-family: 'Comic Sans MS';
            background-color: #6a8a82;
            width: 623px;
        }
        .auto-style1 {
            text-align: center;
        }
        .auto-style2 {
            border: 1px solid black;
            border-radius: 3px;
            font-size: 1em;
            font-family: Papyrus, cursive;
            color: white;
            background: #282726;
        }
        .auto-style2:hover {
            margin: 0;
            border: 1px solid white;
            box-shadow: 2px 2px 2px 0 rgba(0,0,0,0.2) ;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="auto-style1">
            <h1 class="auto-style1">Sheridan Car Sales</h1>
            <div class="auto-style1">
                <h3>Welcome
                    <asp:Label ID="NameLbl" runat="server" style="font-weight: 700" ForeColor="#6600FF"></asp:Label>
                    </h3>
                <p>
                    <asp:Label ID="UserLbl" runat="server" style="font-weight: 700" ForeColor="#6600FF"></asp:Label>
                    </p>
                <p style="text-align: left">
                    Brand:&nbsp;
                    <asp:TextBox ID="BrandTxt" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="BrandTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p style="text-align: left">
                    Model:
                    <asp:TextBox ID="ModelTxt" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ModelTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p style="text-align: left">
                    &nbsp;&nbsp;
                    Year:
                    <asp:TextBox ID="YearTxt" runat="server"></asp:TextBox>
                &nbsp;<asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="YearTxt" Display="Dynamic" ErrorMessage="RangeValidator" MaximumValue="2050" MinimumValue="1950" Type="Integer" ForeColor="Red"></asp:RangeValidator>
                </p>
                <p style="text-align: left">
                    &nbsp;
                    Color:
                    <asp:TextBox ID="ColorTxt" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ColorTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p style="text-align: left">
                    &nbsp;
                    Price:
                    <asp:TextBox ID="PriceTxt" runat="server"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="PriceTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
                </p>
                <p style="text-align: left">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="OrderBtn" runat="server" CssClass="auto-style2" Text="Order" OnClick="OrderBtn_Click" />
                </p>
                <p style="text-align: left">
                    <asp:Label ID="SuccessLbl" runat="server" ForeColor="Red"></asp:Label>
                </p>
                <p style="text-align: right">
                    <asp:Button ID="ViewBtn" runat="server" OnClick="ViewBtn_Click" Text="View Orders" />
                    <asp:ListBox ID="ViewBox" runat="server" Height="100px" Width="393px"></asp:ListBox>
                </p>
                <p style="text-align: left">
                    &nbsp;</p>
                <p style="text-align: left">
                    &nbsp;</p>
                <p style="text-align: left">
                    &nbsp;</p>
            </div>
        </div>
    </form>
</body>
</html>
