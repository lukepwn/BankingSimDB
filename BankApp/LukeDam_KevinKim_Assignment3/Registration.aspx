<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="LukeDam_KevinKim_Assignment3.Registration" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            text-align: center;
        }

        #form1 {
            font-family: 'Comic Sans MS';
            background-color: #6a8a82;
            width: 623px;
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
            <h1>Customer Registration</h1>
        </div>
        &nbsp;
        <asp:Label ID="Label2" runat="server" Text="Customer Name:"></asp:Label>
&nbsp;
        <asp:TextBox ID="CustNameTxt" runat="server" Height="16px"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CustNameTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label3" runat="server" Text="Address: "></asp:Label>
&nbsp;<asp:TextBox ID="AddressTxt" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="AddressTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label4" runat="server" Text="Postal Code: "></asp:Label>
&nbsp;<asp:TextBox ID="PostalTxt" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="PostalTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;<asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="PostalTxt" ErrorMessage="Wrong Format (A1B 2C3)" OnServerValidate="CustomValidator1_ServerValidate" ForeColor="Red"></asp:CustomValidator>
        &nbsp;<br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <br />
&nbsp;&nbsp;
        <asp:Label ID="Label5" runat="server" Text="Phone Number: "></asp:Label>
&nbsp;<asp:TextBox ID="PhoneTxt" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="PhoneTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label6" runat="server" Text="Email: "></asp:Label>
&nbsp;<asp:TextBox ID="EmailTxt" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="EmailTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        &nbsp;<asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="EmailTxt" Display="Dynamic" ErrorMessage="Missing @" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
        &nbsp;<br />
        <br />
&nbsp;&nbsp;&nbsp;<asp:Label ID="Label7" runat="server" Text="Confirm Email: "></asp:Label>
&nbsp;<asp:TextBox ID="ConfirmTxt" runat="server"></asp:TextBox>
        &nbsp;<asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="EmailTxt" ControlToValidate="ConfirmTxt" Display="Dynamic" ErrorMessage="Must Match Email" ForeColor="Red"></asp:CompareValidator>
        <br />
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label8" runat="server" Text="Password: "></asp:Label>
&nbsp;<asp:TextBox ID="PasswordTxt" runat="server"></asp:TextBox>
        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="PasswordTxt" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        <br />
        <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="RegisterBtn" runat="server" CssClass="auto-style2" Text="Register" OnClick="RegisterBtn_Click" />
    </form>
</body>
</html>
