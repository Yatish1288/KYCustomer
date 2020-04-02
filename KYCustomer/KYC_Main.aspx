<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KYC_Main.aspx.cs" Inherits="KYCustomer.KYC_Main" MasterPageFile="~/Site.Master" %>


<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" runat="server">  
    <table>  
        <tr>  
            <td class="td" colspan="5">
                <asp:Label ID="Label1" runat="server" Text="Customer Contact Detail" Font-Bold="true" ForeColor="Brown"></asp:Label>
            </td>  
            <td class="td">
                &nbsp;</td>  
        </tr>  
        <tr>  
            <td class="td">&nbsp;</td>  
            <td class="td"><asp:Label ID="Label7" runat="server" Text="Space" Visible="false"></asp:Label></td>  
            <td>  
                &nbsp;</td>  
            <td style="width: 200px">  
                &nbsp;</td>  
            <td style="width: 45px">  
                &nbsp;</td>  
        </tr>  
        <tr>  
            <td class="td"> <asp:Label ID="Label2" runat="server" Text="First Name" Font-Bold="True" ForeColor="Black"></asp:Label></td>  
            <td class="td"> &nbsp;</td>  
            <td>  
                <asp:TextBox ID="txtName" runat="server" BorderColor="Turquoise" Width="175px"></asp:TextBox></td>  
            <td style="width: 200px">  
                <asp:RequiredFieldValidator ID="ReName" runat="server" 
               ControlToValidate="txtName" ErrorMessage="Enter first name" ValidationGroup="ValidateForm" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>  
            <td style="width: 45px">  
                <asp:Label ID="lblCID" runat="server" Visible="false"></asp:Label> </td>  
        </tr>  
        <tr>  
            <td class="td">&nbsp;</td>  
            <td class="td">&nbsp;</td>  
            <td>  
                &nbsp;</td>  
            <td style="width: 200px">  
                &nbsp;</td>  
            <td style="width: 45px">  
                &nbsp;</td>  
        </tr>  
        <tr>  
            <td class="td" style="height: 22px"><asp:Label ID="Label3" runat="server" Text="Last Name" Font-Bold="true" ForeColor="Black"></asp:Label></td>  
            <td class="td" style="height: 22px">&nbsp;</td>  
            <td style="height: 22px">  
                <asp:TextBox ID="txtLastName" runat="server" BorderColor="Turquoise" Width="175px"></asp:TextBox></td>  
            <td style="height: 22px; width: 200px;">   
                <asp:RequiredFieldValidator ID="ReLastName" runat="server" 
               ControlToValidate="txtLastName" ErrorMessage="Enter last name" ValidationGroup="ValidateForm" ForeColor="Red">
               </asp:RequiredFieldValidator> </td>  
            <td style="height: 22px; width: 45px;"> &nbsp;</td>  
        </tr> 
        <tr>  
            <td class="td">&nbsp;</td>  
            <td class="td">&nbsp;</td>  
            <td>  
                &nbsp;</td>  
            <td style="width: 200px"> &nbsp;</td>  
            <td style="width: 45px"> &nbsp;</td>  
        </tr> 
        <tr>  
            <td class="td"><asp:Label ID="Label4" runat="server" Text="Email ID" Font-Bold="true" ForeColor="Black"></asp:Label></td>  
            <td class="td">&nbsp;</td>  
            <td>  
                <asp:TextBox ID="txtEmail" runat="server" BorderColor="Turquoise" Width="175px"></asp:TextBox></td>  
            <td style="width: 200px">   
                 <asp:RequiredFieldValidator ID="ReEmailId" runat="server" 
               ControlToValidate="txtEmail" ErrorMessage="Enter email Id" ValidationGroup="ValidateForm" ForeColor="Red">
               </asp:RequiredFieldValidator>
&nbsp;</td>  
            <td style="width: 45px"> &nbsp;</td>  
        <tr>  
            <td class="td">&nbsp;</td>  
            <td class="td">&nbsp;</td>  
            <td>  
                <asp:RegularExpressionValidator ID="Reemail" runat="server" 
               ControlToValidate="txtEmail" ErrorMessage="Enter correct email Id" 
               ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="ValidateForm" ForeColor="Red">
            </asp:RegularExpressionValidator>
<br />
                </td>  
            <td style="width: 200px"> &nbsp;</td>  
            <td style="width: 45px"> &nbsp;</td>  
        <tr>  
            <td class="td"><asp:Label ID="Label5" runat="server" Text="Phone No" Font-Bold="true" ForeColor="Black"></asp:Label></td>  
            <td class="td">&nbsp;</td>  
            <td>  
                <asp:TextBox ID="txtPhoneNo" runat="server" MaxLength="10" BorderColor="Turquoise" Width="175px"></asp:TextBox></td>  
            <td style="width: 200px">   
               <asp:RequiredFieldValidator ID="RePhoneNo" runat="server" 
               ControlToValidate="txtPhoneNo" ErrorMessage="Enter phone no" ValidationGroup="ValidateForm" ForeColor="Red">
               </asp:RequiredFieldValidator>
            </td>  
            <td style="width: 45px"> &nbsp;</td>  
        </tr> 
        <tr>  
            <td class="td">&nbsp;</td>  
            <td class="td">&nbsp;</td>  
            <td>  

               <asp:RegularExpressionValidator ID="RegularExpressionValidator1"
    ControlToValidate="txtPhoneNo" runat="server" ForeColor="Red"
    ErrorMessage="Only Numbers allowed"
    ValidationExpression="\d+">

</asp:RegularExpressionValidator>

            </td>  
            <td style="width: 200px"> &nbsp;</td>  
            <td style="width: 45px"> &nbsp;</td>  
        </tr> 
         <tr>  
            <td class="td"><asp:Label ID="Label6" runat="server" Text="Status" Font-Bold="true" ForeColor="Black"></asp:Label></td>  
            <td class="td">&nbsp;</td>  
            <td>  
                <asp:RadioButtonList ID="RBLStatus" runat="server" RepeatDirection="Horizontal">
            <asp:ListItem>Active</asp:ListItem>
            <asp:ListItem>Inactive</asp:ListItem>
        </asp:RadioButtonList>
        
            <td style="width: 200px">   
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
            ControlToValidate="RBLStatus" ErrorMessage="Select status" ForeColor="Red" ValidationGroup="ValidateForm"></asp:RequiredFieldValidator> </td>  
        
            <td style="width: 45px"> &nbsp;</td>  
        </tr> 
         <tr>  
            <td class="td">&nbsp;</td>  
            <td class="td">&nbsp;</td>  
            <td>  
                &nbsp;<td style="width: 200px"> &nbsp;</td>  
             <td style="width: 45px"> &nbsp;</td>  
        </tr> 
        <tr>  
            <td></td>  
            <td>&nbsp;</td>  
            <td>  
                <asp:Button ID="btnSubmit" runat="server" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="ValidateForm"/>  
                <asp:Button ID="btnUpdate" runat="server" Text="Update" Visible="false"  ValidationGroup="ValidateForm"
OnClick="btnUpdate_Click" />  
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" OnClick="btnCancel_Click" /></td>  
            <td style="width: 200px"></td>  
            <td style="width: 45px">&nbsp;</td>  
        </tr>  
    </table>  
  
    <div style="padding: 10px; margin: 0px; width: 100%;">  
        <p>  
            Total Records :<asp:Label ID="lbltotalcount" runat="server" Font-Bold="true"></asp:Label>  
        </p>  
        <asp:GridView ID="GridViewCustomer" runat="server" DataKeyNames="SrNo"   
            OnSelectedIndexChanged="GridViewCustomer_SelectedIndexChanged"  
OnRowDeleting="GridViewCustomer_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridViewCustomer_PageIndexChanging">  
            <Columns>  
                <asp:CommandField HeaderText="EDIT" ShowSelectButton="True" />  
                <asp:CommandField HeaderText="DELETE" ShowDeleteButton="True" />  
            </Columns>  
            <HeaderStyle BackColor="#6699FF" />
        </asp:GridView>  
    </div>  
</asp:Content>