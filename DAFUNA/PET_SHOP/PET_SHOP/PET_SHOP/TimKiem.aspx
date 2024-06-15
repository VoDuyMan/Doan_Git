<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeBehind="TimKiem.aspx.cs" Inherits="PET_SHOP.TimKiem" %>
<%@ Register src="UserUI/search.ascx" tagname="search" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:search ID="search" runat="server" />
</asp:Content>
