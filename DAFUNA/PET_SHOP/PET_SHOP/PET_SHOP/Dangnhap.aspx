<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="Dangnhap.aspx.cs" Inherits="Dangnhap" %>

<%@ Register src="UserUI/logon.ascx" tagname="logon" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:logon ID="logon1" runat="server" />
</asp:Content>

