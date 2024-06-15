<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeBehind="TrangChu.aspx.cs" Inherits="PET_SHOP.TrangChu" %>
<%@ Register src="UserUI/index.ascx" tagname="index" tagprefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:index ID="index" runat="server" />
</asp:Content>
