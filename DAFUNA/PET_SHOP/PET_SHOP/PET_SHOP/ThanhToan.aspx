<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="ThanhToan.aspx.cs" Inherits="ThanhToan" %>

<%@ Register src="UserUI/pay.ascx" tagname="pay" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:pay ID="pay1" runat="server" />
</asp:Content>

