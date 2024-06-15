<%@ Page Title="" Language="C#" MasterPageFile="~/PET_SHOP.Master" AutoEventWireup="true" CodeFile="DonHang.aspx.cs" Inherits="DonHang" %>

<%@ Register src="UserUI/ThongTinDonHang.ascx" tagname="ThongTinDonHang" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:ThongTinDonHang ID="ThongTinDonHang1" runat="server" />
</asp:Content>

