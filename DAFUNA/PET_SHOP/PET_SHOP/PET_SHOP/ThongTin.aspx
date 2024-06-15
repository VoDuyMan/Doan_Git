<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="ThongTin.aspx.cs" Inherits="ThongTin" %>

<%@ Register src="UserUI/account.ascx" tagname="account" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:account ID="account1" runat="server" />
</asp:Content>

