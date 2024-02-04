<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Widget.aspx.cs" Inherits="vshow.Widget" %>

<%@ Register assembly="DevExpress.Web.v18.2, Version=18.2.6.0, Culture=neutral, PublicKeyToken=b88d1754d700e49a" namespace="DevExpress.Web" tagprefix="dx" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-x:hidden;overflow-y:hidden;overflow:hidden;"> 
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
      .WidgetCSS{
          background-color:transparent;
      }
      .dxpc-content, .dxpc-contentWrapper {  
            overflow-y: hidden!important;  
         }          

      .auto-style1 {
            height: 18px;
        }
        .auto-style2 {
            height: 18px;
            width: 99px;
        }
        .ZIndexPanel
            {  
                z-index:0 !important;  
            }  
        .ZIndexPanel1
            {  
                z-index:1 !important;  
            }  
        .ZIndexPanel2
            {  
                z-index:2 !important;  
            }  
        .ZIndexPanel3
            {  
                z-index:3 !important;  
            }  
        .ZIndexPanel4
            {  
                z-index:4 !important;  
            }  
        .ZIndexPanel5
            {  
                z-index:5 !important;  
            }  
        .ZIndexPanel6
            {  
                z-index:6 !important;  
            }  
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div style="background-color:transparent;">
        <dx:ASPxDockManager ID="dockManager" runat="server" FreezeLayout="false" OnClientLayout="dockManager_ClientLayout">
        </dx:ASPxDockManager>
            <asp:SqlDataSource ID="qVidgetList" runat="server" ConnectionString="<%$ ConnectionStrings:wrkBoard %>" 
                ProviderName="<%$ ConnectionStrings:wrkBoard.ProviderName %>" SelectCommand="Select vm.idall,vm.params, mm.guid, vv.url, vv.html, vv.name, mm.savedlayot, vm.prims, vm.sorts
 from vidg_inmonitor vm
 left join vidjet vv on vv.idall = vm.idvidget
 left join monitors mm on mm.cntmon = vm.cntmon and mm.idmonitor = vm.idmon
 Where vm.idmon = ? and vm.cntmon = ?
order by vm.sorts DESC
" 
                
UpdateCommand="update monitors mm
   set mm.savedlayot = ?
 Where mm.idmonitor = ? and mm.cntmon = ?">

                     <SelectParameters>
                         <asp:SessionParameter DbType="Int32" DefaultValue="-1" Name="Idmonitor" 
                             SessionField="Idmonitor" />
                         <asp:SessionParameter DbType="Int32" DefaultValue="0" Name="cntmon" 
                             SessionField="cntmon" />
                     </SelectParameters>

                     <UpdateParameters>
                         <asp:SessionParameter DefaultValue=" " Name="newparameter" SessionField="SavedLayot" />
                         <asp:SessionParameter DefaultValue="0" Name="newparameter" SessionField="IDMONITOR" />
                         <asp:SessionParameter DefaultValue="0" Name="newparameter" SessionField="CNTMON" />
                     </UpdateParameters>

            </asp:SqlDataSource>
            <dx:ASPxDockPanel ID="DockPanEdit" runat="server" PanelUID="PanEdit" HeaderText="Редактирование" Width="345px" TabIndex="100" >
                <ContentCollection>
<dx:PopupControlContentControl runat="server" Visible="true">
    <table style="width:100%;">
        <tr>
            <td class="auto-style2">
                <dx:ASPxButton ID="ASPxButton1" runat="server" Text="Сохранить" Theme="Glass" OnClick="ASPxButton1_Click">
                </dx:ASPxButton>
            </td>
            <td class="auto-style1">
                <dx:ASPxButton ID="ASPxButton2" runat="server" Text="Восстановить умолчания" Theme="Glass" OnClick="ASPxButton2_Click">
                </dx:ASPxButton>
            </td>
            <td class="auto-style1">&nbsp;</td>
        </tr>
    </table>
                    </dx:PopupControlContentControl>
</ContentCollection>
            </dx:ASPxDockPanel>
        </div>
    </form>
</body>
</html>
