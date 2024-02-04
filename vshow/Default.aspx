<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="vshow._Default" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

     <asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
         <div class="jumbotron">
        <h1>Показ виджетов на многих мониторах.</h1>
        <p class="lead" Этот сервер предназначен для отображения виджетов на многих мониторах и их настройки.</p>
        <p><a href="" class="btn btn-primary btn-lg" style="display:none">Learn more &raquo;</a></p>
    </div>
        <dx:ASPxDockManager ID="dockManager" runat="server" FreezeLayout="false" OnClientLayout="dockManager_ClientLayout">
        </dx:ASPxDockManager>
</asp:Content>

