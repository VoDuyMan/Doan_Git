<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="DangKy.aspx.cs" Inherits="DangKy" %>

<%@ Register src="UserUI/create_acount.ascx" tagname="create_acount" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:create_acount ID="create_acount1" runat="server" />
</asp:Content>

