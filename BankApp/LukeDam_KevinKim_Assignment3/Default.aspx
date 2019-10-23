<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="LukeDam_KevinKim_Assignment3.Default" %>

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
        
        .auto-style4 {
            margin-left: 40px;
        }
        
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 33px">
            <br />
            <br />
            <br />
        </div>
        <h1 class="auto-style4">Car Sales</h1>
        <p style="margin-left: 40px">
            <asp:Label ID="Username" runat="server" CssClass="auto-style1" Text="Username: "></asp:Label>
            <br />
            <asp:TextBox ID="UsernameText" runat="server" BorderColor="#99CCFF" style="font-size: large"></asp:TextBox>
            <br />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="UsernameText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
            <br />
            <asp:Label ID="Password" runat="server" CssClass="auto-style1" Text="Password:"></asp:Label>
            <br />
            <asp:TextBox ID="PasswordText" runat="server" TextMode ="Password" BorderColor="#99CCFF" style="font-size: large"></asp:TextBox>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="SignInBtn" runat="server" CssClass="auto-style2" Text="Sign In" OnClick="SignInBtn_Click" />
        &nbsp;
        </p>
        <p style="margin-left: 40px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="PasswordText" Display="Dynamic" ErrorMessage="Required" ForeColor="Red"></asp:RequiredFieldValidator>
        </p>
        <p style="margin-left: 40px">
            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Not registered?&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="RegisterBtn" runat="server" CssClass="auto-style2" style="background-color: #FF0000" OnClick="RegisterBtn_Click" Text="Create Account" />
            <br />
        </p>
    </form>
</body>
</html>
