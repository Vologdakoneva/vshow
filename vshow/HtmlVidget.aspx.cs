using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace vshow
{
    public partial class HtmlVidget : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
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
            btSave.NavigateUrl = "~/editopisan.aspx" + "?IDALL=" + idall.ToString();
            EditDiv.Visible = isEdit > 0;
        }
    }
}