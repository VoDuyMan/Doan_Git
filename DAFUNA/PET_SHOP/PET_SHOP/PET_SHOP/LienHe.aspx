<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeBehind="KhuyenMai.aspx.cs" Inherits="PET_SHOP.TrangChu" %>

<%@ Register src="UserUI/contact.ascx" tagname="contact" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   
    <uc1:contact ID="contact1" runat="server" />
   
    </asp:Content>
