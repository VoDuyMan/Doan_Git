<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeBehind="CTSP.aspx.cs" Inherits="PET_SHOP.CTSP" %>
<%@ Register src="UserUI/detail_product.ascx" tagname="detail_product" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <uc1:detail_product ID="detail_product1" runat="server" />

</asp:Content>
