<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="TinTuc_1.aspx.cs" Inherits="TinTuc_1" %>

<%@ Register src="UserUI/tintuc_1.ascx" tagname="tintuc_1" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:tintuc_1 ID="tintuc_11" runat="server" />
</asp:Content>

