using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.GUI
{
    public partial class TopMenu : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtNews = XpcHelper.GetCategoryByParentV2(0, false, 1, 1);
            if (dtNews != null && dtNews.Rows.Count > 0)
            {
                rptNewsCat.DataSource = dtNews;
                rptNewsCat.DataBind();
            }
            int CatID = Lib.QueryString.ParentCategory;
            if (CatID == 0)
                CatID = Lib.QueryString.CategoryID;
            ltrActiveMenu.Text = "<script>ActiveMenu('li" + CatID + "');</script>";
        }
    }
}