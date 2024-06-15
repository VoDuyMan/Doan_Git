<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeBehind="DMSP.aspx.cs" Inherits="PET_SHOP.DMSP" %>

<%@ Register src="UserUI/detail_menu.ascx" tagname="detail_menu" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <uc1:detail_menu ID="detail_menu1" runat="server" />
</asp:Content>
