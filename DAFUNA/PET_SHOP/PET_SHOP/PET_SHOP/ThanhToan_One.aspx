<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="ThanhToan_One.aspx.cs" Inherits="ThanhToan_One" %>

<%@ Register src="UserUI/Pay_one.ascx" tagname="Pay_one" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Pay_one ID="Pay_one1" runat="server" />
</asp:Content>

