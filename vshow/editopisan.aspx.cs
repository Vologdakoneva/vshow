using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;

namespace OpisanEdit
{
    public partial class _default : System.Web.UI.Page
    {
        private int id=0;
        protected void Page_Load(object sender, EventArgs e)
        {
            id=-99;
            string username="nothigs", password="987uuuuuu";
            if (!IsCallback)
            {
                if (HttpContext.Current.Request.QueryString.Count > 0)
                {
                    int idmonitor;
                    int cntmon;
                    int isEdit;
                    int idall = 0;
                    try
                    {
                        idmonitor = Convert.ToInt32(HttpContext.Current.Request.QueryString["IDMONITOR"]);
                        cntmon = Convert.ToInt32(HttpContext.Current.Request.QueryString["cntmon"]);
                        idall = Convert.ToInt32(HttpContext.Current.Request.QueryString["IDALL"]);
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
                }

            }
            if (!IsPostBack) {
                try
                {
                    DataView adata;
                    adata = opisanTov.Select(DataSourceSelectArguments.Empty) as DataView;
                    if (adata.Count != 0)
                        opisanEdit.Html = adata[0]["html"].ToString();


                }
                catch (Exception)
                {

                    opisanEdit.Html = "Редактирование и показ не возможны";
                    opisanEdit.Enabled = false;
                    btSave.Enabled = false;
                }
            }
        }

        protected void opisanEdit_HtmlChanged(object sender, EventArgs e)
        {

        }

        protected void btSave_Click(object sender, EventArgs e)
        {
            btSave.Focus();
            opisanTov.UpdateParameters.Clear();
            opisanTov.UpdateParameters.Add("HTML", System.Data.DbType.String, opisanEdit.Html);
            opisanTov.UpdateParameters.Add("IDALL", System.Data.DbType.Int32, Session["IDALL"].ToString());
            opisanTov.Update();
        }
    }
}