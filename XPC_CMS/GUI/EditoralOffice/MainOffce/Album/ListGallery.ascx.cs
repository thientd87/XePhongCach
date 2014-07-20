using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DFISYS.BO;
using DFISYS.BO.CoreBO;
using System.Data;

namespace DFISYS.GUI.EditoralOffice.MainOffce.Tool
{
    public partial class ListGallery : System.Web.UI.UserControl
    {
        Gallery ga = new Gallery();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                var tbl = ga.SelectAllSearch(1000,1,"");
                grdListSupport.DataSource = tbl;
                grdListSupport.DataBind();
            }
        }
        protected void grdListNews_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "Edit")
            {

                int index = Convert.ToInt32(e.CommandArgument);
                GridViewRow row = grdListSupport.Rows[index];
                grdListSupport.EditIndex = index;
                var txtContent = row.FindControl("txtContent") as TextBox;
                if (txtContent != null) txtContent.Text = row.Cells[2].Text;
            }

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            var tbl = SupportOnline_Helper.SelectSupportOnline();
            grdListSupport.DataSource = tbl;
            grdListSupport.DataBind();
        }         

    }
}