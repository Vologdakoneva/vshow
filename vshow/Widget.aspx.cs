using DevExpress.Web;
using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vshow
{
    public partial class Widget : System.Web.UI.Page
    {
        string LayoutSessionKey;
        bool saveLayout = false;

        protected void Page_Load(object sender, EventArgs e)
        {
            int idmonitor;
            int cntmon;
            int isEdit = 0;
            int idworkplace = 0;
            try
            {
                idmonitor = Convert.ToInt32(HttpContext.Current.Request.QueryString["IDMONITOR"]);
                cntmon = Convert.ToInt32(HttpContext.Current.Request.QueryString["cntmon"]);
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
            string parametr = "";
            DataView adata;
            adata = qVidgetList.Select(DataSourceSelectArguments.Empty) as DataView;
            try
            {

                if (adata.Table.Rows.Count > 0)
                {
                    LayoutSessionKey = adata.Table.Rows[0]["GUID"].ToString();
                    Session[LayoutSessionKey] = adata.Table.Rows[0]["savedlayot"].ToString();


                    for (int i = 0; i < adata.Table.Rows.Count; i++)
                    {
                        parametr = adata.Table.Rows[i]["params"].ToString();
                        ASPxDockPanel NewPanel = new ASPxDockPanel();
                        NewPanel.HeaderText = adata.Table.Rows[i]["PRIMS"].ToString() + " " + adata.Table.Rows[i]["NAME"].ToString();
                        NewPanel.ID = "widget" + i.ToString();
                        NewPanel.ClientInstanceName = "ClientDockPanel" + "widget" + i.ToString();
                        NewPanel.ContentUrl = adata.Table.Rows[i]["URL"].ToString() +
                                              "?IDMONITOR=" + idmonitor.ToString() +
                                              "&CNTMON=" + cntmon.ToString() +
                                              "&isEdit=" + isEdit.ToString() +
                                              "&IDALL=" + adata.Table.Rows[i]["IDALL"].ToString() +
                                              parametr;
                        //NewPanel.CssClass = "ZIndexPanel" + adata.Table.Rows[i]["sorts"].ToString();
                        // forEdit;
                        if (isEdit > 0)
                        {
                            NewPanel.AllowedDockState = AllowedDockState.FloatOnly;
                            NewPanel.AllowResize = true;
                        }
                        // not edit
                        else
                        {
                            for (int k = 0; k < Page.Form.Controls.Count; k++)
                            {
                                if (Page.Form.Controls[k].ID == "DockPanEdit")
                                {
                                    Page.Form.Controls[k].Visible = false;
                                }
                            }
                            NewPanel.ShowHeader = false;
                            NewPanel.Border.BorderWidth = 0;
                            NewPanel.ShowShadow = false;


                        }
                        //NewPanel.ShowHeader = false;
                        NewPanel.ScrollBars = ScrollBars.None;
                        Page.Form.Controls.Add(NewPanel);
                        adata.Table.Rows[0]["URL"].ToString();
                    }
                }
                else
                {
                    for (int k = 0; k < Page.Form.Controls.Count; k++)
                    {
                        if (Page.Form.Controls[k].ID == "DockPanEdit")
                        {
                            Page.Form.Controls[k].Visible = false;
                        }
                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void dockManager_ClientLayout(object sender, DevExpress.Web.ASPxClientLayoutArgs e)
        {
            if (e.LayoutMode == ClientLayoutMode.Saving && this.saveLayout)
            {
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

        protected void ASPxButton2_Click(object sender, EventArgs e)
        {
            this.dockManager.ResetLayoutToInitial();
        }

        protected void ASPxButton1_Click(object sender, EventArgs e)
        {
            this.saveLayout = true;
            Response.Redirect(Request.Url.AbsoluteUri, false);
        }
    }
}