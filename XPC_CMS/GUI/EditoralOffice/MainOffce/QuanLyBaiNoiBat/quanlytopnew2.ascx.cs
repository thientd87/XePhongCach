using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using DFISYS.BO.Editoral.Newslist;
using System.Collections.Generic;

namespace QuanLyBaiNoiBat {
    public partial class quanlytopnew2 : UserControl {
        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) bindData();
        }

        protected void bindData() {
            if (Session["EditionType"] != null && Session["EditionType"].ToString() != "")
            {
                DataTable dtData = NewslistHelper.BaiNoiBat_BaiNoiBat_Select(Session["EditionType"].ToString());
                grdTopClick.DataSource = dtData;
                grdTopClick.DataBind();

                if(dtData != null && dtData.Rows.Count > 0)
                {
                    btnUpdate.Visible = true;    
                }
                else
                {
                    btnUpdate.Visible = false;
                }
                    
            }
            else
            {
                Response.Redirect("/login.aspx");
            }
            
        }

        protected void btnUpdate_Click(object sender, EventArgs e) {
            List<int> thutu = new List<int>();
            List<long> newsIdSelected = new List<long>();
            string newsIdNotSelected = string.Empty;

            foreach (GridViewRow row in grdTopClick.Rows) {
                CheckBox chk = row.FindControl("chk") as CheckBox;
                if (chk != null) {
                    if (chk.Checked) {
                        newsIdSelected.Add((long)grdTopClick.DataKeys[row.RowIndex].Value);
                        TextBox txtThuTu = row.FindControl("txtThuTu") as TextBox;
                        if (string.IsNullOrEmpty(txtThuTu.Text)) txtThuTu.Text = "1"; // giá trị mặc định
                        thutu.Add(int.Parse(txtThuTu.Text));
                    } else
                        newsIdNotSelected += "," + grdTopClick.DataKeys[row.RowIndex].Value.ToString();
                }
            }

            if (newsIdNotSelected.StartsWith(",")) newsIdNotSelected = newsIdNotSelected.Substring(1);

            if (Session["EditionType"] != null && Session["EditionType"] != "")
            {
                NewslistHelper.BaiNoiBat_BaiNoiBat_Update(newsIdSelected.ToArray(), thutu.ToArray(), newsIdNotSelected, Session["EditionType"].ToString());
            }
            else
            {
                Response.Redirect("/login.aspx");
            }

            bindData();
            lblMessage.Text = "Bạn đã cập nhật thành công !";
        }

        protected void grdTopClick_PageIndexChanging(object sender, GridViewPageEventArgs e) {
            grdTopClick.PageIndex = e.NewPageIndex;
            bindData();

        }

        protected void grdTopClick_RowDataBound(object sender, GridViewRowEventArgs e) {
            if (e.Row.RowType == DataControlRowType.DataRow) {
                DataRowView data = e.Row.DataItem as DataRowView;
                Literal ltrInfo = e.Row.FindControl("ltrInfo") as Literal;

                TextBox txtThuTu = e.Row.FindControl("txtThuTu") as TextBox;
                if (txtThuTu != null)
                    txtThuTu.Text  = (((DataRowView)e.Row.DataItem)["ThuTu"]).ToString();

                ltrInfo.Text = "Người đưa: <b>{0}</b>, Ngày gửi: {1}";
                ltrInfo.Text = string.Format(ltrInfo.Text, NewslistHelper.GetSenderIDByNewsID(((DataRowView)e.Row.DataItem)["News_ID"].ToString()), ((DateTime)data["News_PublishDate"]).ToString("dd/MM/yyyy hh:mm tt"));
            }
        }

    }
}