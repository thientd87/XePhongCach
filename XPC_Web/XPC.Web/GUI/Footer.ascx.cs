﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.GUI
{
    public partial class Footer : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            DataTable dtNews = XpcHelper.GetCategoryByParentV2(0, false, 1, 1);
            if (dtNews != null && dtNews.Rows.Count > 0)
            {
                rptNewsCat.DataSource = dtNews;
                rptNewsCat.DataBind();
            }
        }
    }
}