<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HtmlVidget.aspx.cs" Inherits="vshow.HtmlVidget" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div runat="server" id="EditDiv">
            <dx:ASPxHyperLink ID="btSave" runat="server" Text="Изменить" NavigateUrl="~/editopisan.aspx" Target="_blank">
            </dx:ASPxHyperLink>

            <asp:SqlDataSource ID="qVidgetList" runat="server" ConnectionString="<%$ ConnectionStrings:wrkBoard %>" 
                ProviderName="<%$ ConnectionStrings:wrkBoard.ProviderName %>" SelectCommand="Select vm.idall, vm.params, mm.guid, vv.url, vm.html, vv.name, vm.savedlayot
 from vidg_inmonitor vm
 left join vidjet vv on vv.idall = vm.idvidget
 left join monitors mm on mm.cntmon = vm.cntmon and mm.idmonitor = vm.idmon
 Where vm.idmon = ? and vm.cntmon = ? and vm.idall= ?" 
UpdateCommand="update vidg_inmonitor vm
 set vm.savedlayot = ?
Where vm.idall = ?
">
                     <SelectParameters>
                         <asp:SessionParameter DbType="Int32" DefaultValue="-1" Name="Idmonitor" 
                             SessionField="Idmonitor" />
                         <asp:SessionParameter DbType="Int32" DefaultValue="0" Name="cntmon" 
                             SessionField="cntmon" />
                         <asp:SessionParameter DbType="Int32" DefaultValue="0" Name="cntmon" 
                             SessionField="IDALL" />
                     </SelectParameters>

                     <UpdateParameters>
                         <asp:SessionParameter DefaultValue="  " Name="newparameter" SessionField="savedlayot" />
                         <asp:SessionParameter DefaultValue="0" Name="newparameter" SessionField="IDALL" />
                     </UpdateParameters>

            </asp:SqlDataSource>

        </div>
        <asp:Repeater runat="server" DataSourceID="qVidgetList">
            <ItemTemplate>
              <dx:ASPxLabel ID="HtmlLab" runat="server" Text= '<%# Eval("HTML").ToString() %>' EncodeHtml="False" Width="100%" ></dx:ASPxLabel>
            </ItemTemplate>
        </asp:Repeater>
    </form>
</body>
</html>
