using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows;
using System.Windows.Forms;

namespace vshow
{
    public partial class _Default : Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }


        protected void btnEditLayout_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Docking/LayoutManagement/EditLayout.aspx", true);
        }


        protected void dockManager_ClientLayout(object sender, DevExpress.Web.ASPxClientLayoutArgs e)
        {
            /*string LayoutSessionKey = null;
            if (e.LayoutMode == DevExpress.Web.ClientLayoutMode.Loading)
                e.LayoutData = Session[LayoutSessionKey] as string;
            
      */
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {

        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {

        }

        protected void btnRestore_Click(object sender, EventArgs e)
        {
            this.dockManager.ResetLayoutToInitial();
        }
    }
}