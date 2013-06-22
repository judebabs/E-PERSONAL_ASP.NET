<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DeleteForm.aspx.cs" Inherits="THE_PROJECT_E_PERSONAL.DeleteForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
            background-color: #336699;
        }
        .style2
        {
            width: 197px;
        }
        .style3
        {
        width: 247px;
    }
    .style4
    {
        color: #CCCCCC;
    }
    .style5
    {
        width: 345px;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Image ID="Image1" runat="server" Height="66px" 
                    ImageUrl="~/Resources/notes_delete.png" Width="70px" />
            </td>
            <td class="style3">
                <span class="style4">****<asp:Label ID="Label8" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: small; color: #CCCCCC; " 
                    Text="Delete Employee" BorderStyle="Groove" BorderWidth="1px"></asp:Label>
                ****</span></td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
                <font size="4" face="Square721 BT" color="pink"><marquee behavior=SCROLL scrollamount="3" HEIGHT=25 WIDTH=300 BGColor=#336699>Enter the unique code of the employee you would like to Delete then press find after the information has been displayed press delete</marquee></font>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label1" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: medium; color: #CCCCCC" 
                    Text="Enter Employee Code :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtcode" runat="server"></asp:TextBox>
            </td>
            <td class="style5">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtcode"
                    ErrorMessage="*Please enter correct code for the Employee" 
                    style="color: #000000; font-size: small; background-color: #FF0000;"></asp:RequiredFieldValidator>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnFind" runat="server" Height="33px" 
                    style="font-family: 'Square721 BT'" Text="FIND" Width="85px" 
                    onclick="btnFind_Click" />
                <asp:Button ID="btnAnother" runat="server" Height="33px" 
                    onclick="btnAnother_Click" Text="Find Another" />
            </td>
            <td class="style5">
                <asp:Label ID="notFound" runat="server" 
                    style="color: #FFFFFF; font-size: medium; background-color: #9933FF;" 
                    BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label2" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: medium; color: #CCCCCC" 
                    Text="Name :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtname" runat="server" Width="182px" Enabled="False"></asp:TextBox>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label3" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: medium; color: #CCCCCC" 
                    Text="Designation :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtdesi" runat="server" Width="182px" Enabled="False"></asp:TextBox>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label4" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: medium; color: #CCCCCC" 
                    Text="Departement :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtdept" runat="server" Width="182px" Enabled="False"></asp:TextBox>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                <asp:Label ID="Label5" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: medium; color: #CCCCCC" 
                    Text="Years Of Service :"></asp:Label>
            </td>
            <td class="style3">
                <asp:TextBox ID="txtyears" runat="server" Width="182px" Enabled="False"></asp:TextBox>
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnDelete" runat="server" Height="36px" 
                    onclick="btnDelete_Click" OnClientClick = "if(!confirm('Do you really want to delete employee information?')) return false;" Text="Delete" Width="106px" />
            </td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style5">
                <asp:Label ID="Label7" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: x-small; color: #CCCCCC; text-decoration: underline;" 
                    Text="© Powered by Virtual-Brain. Lab "></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
