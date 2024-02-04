<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RASPISAN.aspx.cs" Inherits="vshow.RASPISAN" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-x:hidden;overflow-y:hidden;overflow:hidden;">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <style>
            .WindowShow {
                overflow:hidden!important;
                overflow-y: hidden!important;  
            }
        </style>
 <script type="text/javascript">
     var scrollPosition = 0;
     var PartialPosition = 0;
     function onInit(s, e) {
         setInterval(function () { PartialPosition = 50;}, 10000);
         setInterval(function () {
             if (PartialPosition != 0) {
                 PartialPosition--;
             s.SetVerticalScrollPosition(scrollPosition);
                 if ((s.GetVerticalScrollPosition() < scrollPosition) && (PartialPosition == 0)) { scrollPosition = 0; s.SetVerticalScrollPosition(scrollPosition);}
             scrollPosition++;
             }
          }, 100);
         
     }
     function OnEndCallback(s, e) {
            AdjustSize();
        }
        function OnControlsInitialized(s, e) {
                ASPxClientUtils.AttachEventToElement(window, "resize", function (evt) {
                grid.PerformCallback( window.innerHeight+"|"+ grid.GetHeight()+"|"+grid.GetPageCount ());
            });
        }
        function AdjustSize() {
            var height = Math.max(0,  window.innerHeight);
            grid.SetHeight(height);
            alert(height);
        }
    </script>
       
        

        <div id="RaspDiv" runat="server" style="overflow:hidden;">
            <asp:SqlDataSource ID="qRaspisan" runat="server" ConnectionString="<%$ ConnectionStrings:wrkBoard %>" ProviderName="<%$ ConnectionStrings:wrkBoard.ProviderName %>" SelectCommand="Select *
 from GetRaspisan(?)
">
                <SelectParameters>
                    <asp:SessionParameter DefaultValue="0" Name="newparameter" SessionField="idworkplace" />
                </SelectParameters>

            </asp:SqlDataSource>
        <dx:ASPxTimer ID="ASPxTimer1" runat="server" Interval="3000" Enabled="False">
            <ClientSideEvents Tick="function(s, e) {
alert( grid.GetVisibleRowsOnPage() );
grid.MakeRowVisible(21 );
	//callbackPages.PerformCallback();
}" />
        </dx:ASPxTimer>

            <dx:ASPxCallbackPanel ID="callbackPages" runat="server" Width="100%" ClientIDMode="Static" ClientInstanceName="callbackPages" OnCallback="callbackPages_Callback" Height="100%" EnableClientSideAPI="True">
                <ClientSideEvents Init="function(s, e) {
                    OnControlsInitialized(s, e);
grid.PerformCallback( window.innerHeight+&quot;|&quot;+ grid.GetHeight()+&quot;|&quot;+grid.GetPageCount ());
}" />
                <PanelCollection>
<dx:PanelContent runat="server">
    <dx:ASPxGridView ID="grid" runat="server" AutoGenerateColumns="False" DataSourceID="qRaspisan" EnableTheming="True" Font-Size="16pt" Font-Bold="false" KeyFieldName="IDALL" OnClientLayout="grid_ClientLayout" OnCustomButtonCallback="grid_CustomButtonCallback" OnRowCommand="grid_RowCommand" OnToolbarItemClick="grid_ToolbarItemClick" Theme="Default" Width="100%" ClientIDMode="Static" ClientInstanceName="grid" OnCustomCallback="grid_CustomCallback" OnHtmlDataCellPrepared="grid_HtmlDataCellPrepared" OnHtmlRowCreated="grid_HtmlRowCreated" OnHtmlRowPrepared="grid_HtmlRowPrepared" CssClass="WindowShow" >
        <ClientSideEvents ToolbarItemClick="function(s, e) {
  e.processOnServer=true; 	}" Init="function(s, e) {
  onInit(s, e);
}"
 />
        <SettingsContextMenu EnableColumnMenu="True" Enabled="True">
        </SettingsContextMenu>
        <SettingsAdaptivity AdaptivityMode="HideDataCells">
        </SettingsAdaptivity>
        <SettingsCustomizationDialog Enabled="True" />
        <SettingsPager PageSize="2" Mode="ShowAllRecords">
        </SettingsPager>
        <Settings VerticalScrollableHeight="50" VerticalScrollBarMode="Auto" />
        <SettingsDataSecurity AllowDelete="False" AllowEdit="False" AllowInsert="False" />
        <Columns>
            <dx:GridViewDataTextColumn FieldName="IDALL" ShowInCustomizationForm="True" Visible="False" VisibleIndex="0">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IDWORKPLACE" ShowInCustomizationForm="True" Visible="False" VisibleIndex="1">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn FieldName="IDPEPLE" ShowInCustomizationForm="True" Visible="False" VisibleIndex="2">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Кабинет" FieldName="KAB" ShowInCustomizationForm="True" VisibleIndex="5">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Этаж" FieldName="ETAG" ShowInCustomizationForm="True" VisibleIndex="6">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Пн." FieldName="PON" ShowInCustomizationForm="True" VisibleIndex="7">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Вт." FieldName="VTOR" ShowInCustomizationForm="True" VisibleIndex="8">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Ср." FieldName="SRED" ShowInCustomizationForm="True" VisibleIndex="9">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Чт." FieldName="CHET" ShowInCustomizationForm="True" VisibleIndex="10">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Пт." FieldName="PATN" ShowInCustomizationForm="True" VisibleIndex="11">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Сб." FieldName="SUB" ShowInCustomizationForm="True" VisibleIndex="12">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Вс." FieldName="VOSK" ShowInCustomizationForm="True" VisibleIndex="13">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Врач" FieldName="FIO" ShowInCustomizationForm="True" VisibleIndex="3">
            </dx:GridViewDataTextColumn>
            <dx:GridViewDataTextColumn Caption="Специальность" FieldName="SPECIALIZATION" ShowInCustomizationForm="True" VisibleIndex="4">
            </dx:GridViewDataTextColumn>
        </Columns>
        <Toolbars>
            <dx:GridViewToolbar>
                <Items>
                    <dx:GridViewToolbarItem Name="btSave" Text="Сохранить">
                    </dx:GridViewToolbarItem>
                    <dx:GridViewToolbarItem Name="btReset" Text="Сбросить настройки">
                    </dx:GridViewToolbarItem>
                </Items>
            </dx:GridViewToolbar>
        </Toolbars>
        <Styles>
            <Header BackColor="#0040bd" ForeColor="White">
            </Header>
            <AlternatingRow Enabled="True">
            </AlternatingRow>
        </Styles>
    </dx:ASPxGridView>
                    </dx:PanelContent>
</PanelCollection>
            </dx:ASPxCallbackPanel>
        </div>
            <asp:SqlDataSource ID="qVidgetList" runat="server" ConnectionString="<%$ ConnectionStrings:wrkBoard %>" 
                ProviderName="<%$ ConnectionStrings:wrkBoard.ProviderName %>" SelectCommand="Select vm.idall, vm.params, mm.guid, vv.url, vv.html, vv.name, vm.savedlayot
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
    </form>
</body>
</html>
