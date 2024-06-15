<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="About" %>

<%@ Register src="UserUI/founder.ascx" tagname="founder" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:founder ID="founder1" runat="server" />
</asp:Content>

