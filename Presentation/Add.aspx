<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Add.aspx.cs" Inherits="THE_PROJECT_E_PERSONAL.Add" %>
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
        width: 268px;
    }
    .style4
    {
        width: 197px;
        height: 21px;
    }
    .style5
    {
        width: 268px;
        height: 21px;
    }
    .style6
    {
        height: 21px;
    }
    .style7
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
                    ImageUrl="~/Resources/Update Drivers.png" Width="77px" />
            </td>
            <td class="style3">
                <span class="style7">****</span><asp:Label ID="Label5" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: small; color: #CCCCCC; " 
                    Text="Add New Employee Information" BorderStyle="Groove" BorderWidth="1px"></asp:Label>
                <span class="style7">****</span></td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style4">
                </td>
                <font size="4" face="Square721 BT" color=pink><marquee behavior=SCROLL scrollamount="3" HEIGHT=25 WIDTH=300 BGColor=#336699>Enter employee information and select departement then press SAVE, to add a new employee to the system.</marquee></font>
            <td class="style5">
                </td>
            <td class="style6">
                &nbsp;</td>
            <td class="style6">
                </td>
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
            <td>
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
                &nbsp;</td>
            <td>
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
                <asp:TextBox ID="txtname" runat="server" Width="182px"></asp:TextBox>
            </td>
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtname"
                    ErrorMessage="*Please enter employee name" 
                    style="color: #000000; font-size: small; background-color: #FF0000;"></asp:RequiredFieldValidator>
            </td>
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
            <td>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtdesi"
                    ErrorMessage="*Please enter correct designation" 
                    style="color: #000000; font-size: small; background-color: #FF0000;"></asp:RequiredFieldValidator>
            </td>
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
                <asp:DropDownList ID="dropDept" runat="server" Width="189px" 
                    AutoPostBack="True">
                </asp:DropDownList>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                <asp:Button ID="btnSave" runat="server" Height="37px" Text="SAVE" 
                    Width="88px" onclick="btnSave_Click" OnClientClick = "if(!confirm('Are are sure you want to add employee information?')) return false;" />
            </td>
            <td>
                <asp:Label ID="errorDuplicate" runat="server" 
                    
                    style="color: #000000; font-size: medium; font-family: 'Square721 BT'; background-color: #FF0000;"></asp:Label>
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
                    <ContentTemplate>
                    <Triggers>
                <asp:AsyncPostBackTrigger runat="server" controlid="Timer1" eventname="Tick" />
            </Triggers>
                        <asp:Label ID="succes" runat="server" 
                            style="font-size: large; font-family: 'Square721 BT'; color: #FFFFFF; background-color: #CC66FF"></asp:Label>
                        <asp:Timer ID="Timer1" runat="server" Interval="7000" ontick="Timer1_Tick">
                        </asp:Timer>
                    </ContentTemplate>
                </asp:UpdatePanel>
                
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style2">
                &nbsp;</td>
            <td class="style3">
                &nbsp;</td>
            <td>
                <asp:Label ID="Label7" runat="server" 
                    style="font-family: 'Square721 BT'; font-size: x-small; color: #CCCCCC; text-decoration: underline;" 
                    Text="© Powered by Virtual-Brain. Lab "></asp:Label>
                </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>

</asp:Content>
