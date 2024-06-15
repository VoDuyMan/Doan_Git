<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeBehind="SanPham.aspx.cs" Inherits="PET_SHOP.SanPham" %>
<%@ Register src="UserUI/product.ascx" tagname="product" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:product ID="product" runat="server" />
</asp:Content>
