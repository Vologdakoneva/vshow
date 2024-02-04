<%@ Page Title="Контакты" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="vshow.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Контакты.</h3>
    <address>
        Адрес<br />
        <br />
        <abbr title="Phone">P:</abbr>
        +7921 716 1979
    </address>

    <address>
        <strong>Покупка:</strong>   <a href="mailto:vologdakonea@mail.ru">Связаться</a><br />
        <strong>Поддержка:</strong> <a href=""></a>
    </address>
</asp:Content>
