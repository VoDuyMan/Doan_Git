<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<%@ Register src="UserUI/cart.ascx" tagname="cart" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:cart ID="cart1" runat="server" />
</asp:Content>

