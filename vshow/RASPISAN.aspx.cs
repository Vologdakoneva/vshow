using DevExpress.Web;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vshow
{
    public partial class RASPISAN : System.Web.UI.Page
    {
        string LayoutSessionKey;
        bool saveLayout = false;
        int pageSizeStert = 1;
        Unit rowHight = 0;

        protected void Page_Load(object sender, EventArgs e)
        {
            pageSizeStert = grid.SettingsPager.PageSize;
            int idmonitor;
            int cntmon;
            int isEdit;
            int idall=0;
            int idworkplace = 0;
            try
            {
                idmonitor = Convert.ToInt32(HttpContext.Current.Request.QueryString["IDMONITOR"]);
                cntmon = Convert.ToInt32(HttpContext.Current.Request.QueryString["cntmon"]);
                idall = Convert.ToInt32(HttpContext.Current.Request.QueryString["IDALL"]);
                idworkplace = Convert.ToInt32(HttpContext.Current.Request.QueryString["idworkplace"]);
            }
            catch (Exception)
            {
                idmonitor = 0;
                cntmon = 0;
            }
            try
            {
                isEdit = Convert.ToInt32(HttpContext.Current.Request.QueryString["isEdit"]);
            }
            catch (Exception)
            {
                isEdit = 0;
            }
            Session["cntmon"] = cntmon;
            Session["idmonitor"] = idmonitor;
            Session["idall"] = idall;
            Session["idworkplace"] = idworkplace;
            DataView adata;
            adata = qVidgetList.Select(DataSourceSelectArguments.Empty) as DataView;
            if (adata.Table.Rows.Count > 0)
            {
                LayoutSessionKey = adata.Table.Rows[0]["GUID"].ToString()+ idall.ToString();
                Session[LayoutSessionKey] = adata.Table.Rows[0]["savedlayot"].ToString();
            }
            //GridViewFeaturesHelper.SetupGlobalGridViewBehavior(grid);

            grid.SettingsResizing.ColumnResizeMode = DevExpress.Web.ColumnResizeMode.Control; // (ColumnResizeMode)Enum.Parse(typeof(ColumnResizeMode), ddlResizingMode.Text, true);
            grid.SettingsResizing.Visualization = DevExpress.Web.ResizingMode.Live; // (ResizingMode)Enum.Parse(typeof(ResizingMode), ddlResizingVisualization.Text, true);
            grid.Toolbars[0].Visible = isEdit > 0;
            //grid.SaveClientLayout();
            //grid.ClientLayout;
            //grid.Toolbars[0].Items[0].Command = GridViewToolbarCommand.
            //GridViewToolbarItem.

        }

        protected void grid_ClientLayout(object sender, DevExpress.Web.ASPxClientLayoutArgs e)
        {
            if (e.LayoutMode == ClientLayoutMode.Saving && this.saveLayout) { 
                Session[LayoutSessionKey] = e.LayoutData;
                HttpCookie aLayot = new HttpCookie(LayoutSessionKey, Session[LayoutSessionKey].ToString());
                aLayot.Expires = DateTime.Now.AddDays(100);
                Response.Cookies.Add(aLayot);
                Session["SavedLayot"] = e.LayoutData;
                qVidgetList.Update();
            }
            if (e.LayoutMode == ClientLayoutMode.Loading)
                e.LayoutData = Session[LayoutSessionKey] as string;
        }

        protected void grid_RowCommand(object sender, ASPxGridViewRowCommandEventArgs e)
        {

        }

        protected void grid_CustomButtonCallback(object sender, ASPxGridViewCustomButtonCallbackEventArgs e)
        {

        }

        protected void grid_ToolbarItemClick(object source, DevExpress.Web.Data.ASPxGridViewToolbarItemClickEventArgs e)
        {
            if (e.Item.Index==0)
            {
                this.saveLayout = true;
            }
            //this.grid.LoadClientLayout() SaveClientLayout();

        }

        protected void callbackPages_Callback(object sender, CallbackEventArgsBase e)
        {
            if (grid.PageCount > 1)
            {
                if (grid.PageIndex + 1 < grid.PageCount)
                {
                    grid.PageIndex = grid.PageIndex + 1;
                }
                else
                    grid.PageIndex = 0;
            }

        }

        protected void grid_CustomCallback(object sender, ASPxGridViewCustomCallbackEventArgs e)
        {
            string[] Heights = e.Parameters.Split('|');
            int HeightRow = Convert.ToInt32(Heights[1]) / pageSizeStert+2;
            //grid.SettingsPager.PageSize = Convert.ToInt32(Heights[0]) / HeightRow;
            grid.Settings.VerticalScrollableHeight = Convert.ToInt32(Heights[0]) - 45;
            grid.DataBind();


        }

        protected void grid_HtmlRowCreated(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                rowHight =  e.Row.Height;
            }
        }

        protected void grid_HtmlRowPrepared(object sender, ASPxGridViewTableRowEventArgs e)
        {
            if (e.RowType == DevExpress.Web.GridViewRowType.Data)
            {
                rowHight = e.Row.Height;
            }
        }

        protected void grid_HtmlDataCellPrepared(object sender, ASPxGridViewTableDataCellEventArgs e)
        {

        }
    }
}