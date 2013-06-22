<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Update.aspx.cs" Inherits="THE_PROJECT_E_PERSONAL.Update" %>
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
            width: 236px;
        }
        .style4
        {
            width: 363px;
        }
        .style5
        {
            color: #CCCCCC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <table class="style1">
        <tr>
            <td class="style2">
                <asp:Image ID="Image1" runat="server" Height="54px" 
                    ImageUrl="~/Resources/Update.jpg" Width="77px" />
            </td>
            <td class="style3">
                <span class="style5">***<asp:Label ID="Label5" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: small; color: #CCCCCC; " 
                    Text="Update Employee Information" BorderStyle="Groove" BorderWidth="1px"></asp:Label>
                ***</span></td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
                <font size="4" face="Square721 BT" color=pink><marquee behavior=SCROLL scrollamount="3" HEIGHT=25 WIDTH=300 BGColor=#336699>Enter employee code and press FIND, and then enter information to be updated and press UPDATE</marquee></font>
            <td class="style4">
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
                <asp:TextBox ID="txtcode" runat="server" ontextchanged="txtcode_TextChanged"></asp:TextBox>
            </td>
            <td class="style4">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtcode"
                    ErrorMessage="*Please enter a correct code" 
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
            </td>
            <td class="style4">
                &nbsp;</td>
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
                <asp:TextBox ID="txtname" runat="server" Width="182px" 
                    ontextchanged="txtname_TextChanged"></asp:TextBox>
            </td>
            <td class="style4">
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
                <asp:TextBox ID="txtdesi" runat="server" Width="182px"></asp:TextBox>
            </td>
            <td class="style4">
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
                <asp:TextBox ID="txtdept" runat="server" Width="182px" 
                    ontextchanged="txtdept_TextChanged"></asp:TextBox>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnUpdate" runat="server" Height="37px" Text="UPDATE" 
                    Width="88px" onclick="btnUpdate_Click" OnClientClick = "if(!confirm('Are are sure you want to update employee information?')) return false;" />
            </td>
            <td class="style4">
                <asp:Label ID="errorDeptDuplicated" runat="server" 
                    
                    style="color: #000000; font-family: 'Square721 BT'; font-size: small; background-color: #FF0000;"></asp:Label>
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <asp:UpdatePanel ID="UpdatePanel1" runat="server">
                <Triggers>
                <asp:AsyncPostBackTrigger runat="server" controlid="Timer1" eventname="Tick" />
            </Triggers>
                    <ContentTemplate>
                        <asp:Label ID="succes" runat="server" 
                            style="font-size: large; font-family: 'Square721 BT'; color: #FFFFFF; background-color: #CC66FF"></asp:Label>
                        <asp:Timer ID="Timer1" runat="server" Interval="5000" ontick="Timer1_Tick">
                        </asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td class="style4">
                <asp:Label ID="Label7" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: x-small; color: #CCCCCC; text-decoration: underline;" 
                    Text="© Powered by Virtual-Brain. Lab "></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
