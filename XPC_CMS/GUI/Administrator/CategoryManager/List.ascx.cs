using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DFISYS.BO.Editoral.Category;
using DFISYS.BO.Editoral.EditionType;
using DFISYS.Core.DAL;

namespace DFISYS.GUI.Administrator.CategoryManager {
    public partial class List : DFISYS.API.Module {
        protected string ParentName = string.Empty;

        protected void Page_Load(object sender, EventArgs e) {
            if (!IsPostBack) {
                ViewState["ParentId"] = 0;
               // ViewState["EditionID"] = 0;
                CategoryHelper.TreebuildAllCat(cboLayout);
                cboLayout.Items[0].Text = string.Empty;
                ddlLanguage.DataSource =  EditionTypeHelper.SelectAllForDropdownlist();
                ddlLanguage.DataBind();
                if (Session["EditionType"] != null && Session["EditionType"] != "")
                {
                    ddlLanguage.SelectedValue = Session["EditionType"].ToString();
                }
                else
                {
                    Response.Redirect("/login.aspx");
                }
                bindData();
            }
        }

        private void bindData()
        {
            DataTable dt = new DataTable();
            if (Session["EditionType"] != null && Session["EditionType"] != "")
            {
                dt = CategoryHelper.GetCategoriesByParentAndEditionType((int)ViewState["ParentId"], Session["EditionType"].ToString());
            }
            else
            {
                Response.Redirect("/login.aspx");
            }

            if (!dt.Columns.Contains("EditionName")) dt.Columns.Add("EditionName");
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                DataTable dtEdtion = EditionTypeHelper.GetEditionTypeDetail(Convert.ToInt32(dt.Rows[i]["EditionType_ID"]));
                dt.Rows[i]["EditionName"] = dtEdtion.Rows[0]["EditionName"];
            }
            dt.AcceptChanges();
            grvCategories.DataSource = dt;
            grvCategories.DataBind();
        }

        protected void grvCategories_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e) {
            grvCategories.EditIndex = -1;
            bindData();
        }

        protected void grvCategories_RowUpdating(object sender, GridViewUpdateEventArgs e) {
            GridViewRow editRow = grvCategories.Rows[grvCategories.EditIndex];
            CategoryRow category = CategoryHelper.getCatInfoAsCategoryRow((int)grvCategories.DataKeys[grvCategories.EditIndex].Value);
            category.Cat_Name = (editRow.FindControl("txtCatName") as TextBox).Text;
            category.Cat_KeyWords = (editRow.FindControl("txtCatKeyWords") as TextBox).Text;
            category.Cat_Order = int.Parse((editRow.FindControl("txtCatOrder") as TextBox).Text);
            category.Cat_isHidden = (editRow.FindControl("chkIsHidden") as CheckBox).Checked;
            category.Cat_DisplayURL = (editRow.FindControl("txtCatDisplayURL") as TextBox).Text;
            category.Cat_ParentID = int.Parse((editRow.FindControl("cboParentCat") as DropDownList).SelectedValue);

            if (Session["EditionType"] != null && Session["EditionType"] != "")
            {
                category.EditionType_ID = int.Parse(Session["EditionType"].ToString());
            }
            else
            {
                Response.Redirect("/login.aspx");
            }

            CategoryHelper.UpdateCategoryRow(category);
            grvCategories.EditIndex = -1;
            bindData();
        }

        protected void grvCategories_RowDeleting(object sender, GridViewDeleteEventArgs e) {
            CategoryHelper.Delete((int)(grvCategories.DataKeys[e.RowIndex].Value));
            bindData();
        }

        protected void grvCategories_SelectedIndexChanged(object sender, EventArgs e) {
            ParentName = (grvCategories.SelectedRow.FindControl("btnCatName") as LinkButton).Text;
            lblParentCatName.Text = "Chuyên mục hiện tại: " + ParentName;
            ViewState["ParentId"] = grvCategories.DataKeys[grvCategories.SelectedIndex].Value;
            grvCategories.EditIndex = -1;
            grvCategories.SelectedIndex = -1;
            bindData();
            btnGoToRoot.Visible = true;
        }

        protected void grvCategories_RowDataBound(object sender, GridViewRowEventArgs e) {
           if (e.Row.RowType == DataControlRowType.DataRow) {
                if ((bool)(e.Row.DataItem as DataRowView)["Cat_isHidden"]) e.Row.CssClass = "highLight";

                
           }
            if ((e.Row.RowState & DataControlRowState.Edit) > 0) {

                //DropDownList ddlLanguage = e.Row.FindControl("ddlLanguage") as DropDownList;

                //ddlLanguage.DataSource = EditionTypeHelper.SelectAllForDropdownlist();
                //ddlLanguage.DataBind();
                //try
                //{
                //    if (Session["EditionType"] != null && Session["EditionType"] != "")
                //    {
                //        ddlLanguage.SelectedValue = Session["EditionType"].ToString();   
                //    }
                //}
                //catch (Exception ex)
                //{
                //    throw ex;
                //}

                DropDownList cboParentCat = e.Row.FindControl("cboParentCat") as DropDownList;
                {
                    if (Session["EditionType"] != null && Session["EditionType"] != "")
                    {
                        CategoryHelper.TreebuildAllCatWithEditionType(cboParentCat, Session["EditionType"].ToString());
                    }
                    else
                    {
                        Response.Redirect("/login.aspx");
                    }
                }
                
                cboParentCat.Items[0].Text = string.Empty;
                cboParentCat.Items[0].Value = "0";
                try {
                    cboParentCat.SelectedValue = ((DataRowView)e.Row.DataItem)["Cat_ParentID"].ToString();
                } catch (Exception ex){
                    throw ex;
                }
            }
        }

        protected void grvCategories_RowEditing(object sender, GridViewEditEventArgs e) {
            grvCategories.EditIndex = e.NewEditIndex;
            bindData();
        }

        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            //int editionTypeID = ddlLanguage.SelectedIndex == 0 ? 1 : ddlLanguage.SelectedIndex;
            //CategoryHelper.CreateCat2(txtCatName.Text, txtCatKeyWord.Text, int.Parse(txtCatOrder.Text), string.Empty, txtCatDisplayURL.Text, (int)ViewState["ParentId"], editionTypeID, string.Empty, false, false, cboLayout.SelectedIndex == 0 ? string.Empty : CategoryHelper.GetTabReferenceByCatId(int.Parse(cboLayout.SelectedValue)));
            //// reset form
            //txtCatDisplayURL.Text = string.Empty;
            //ddlLanguage.SelectedIndex = 0;
            //txtCatName.Text = string.Empty;
            //txtCatKeyWord.Text = string.Empty;
            //txtCatOrder.Text = string.Empty;
            //grvCategories.EditIndex = -1;
            //bindData();
            //UpdatePanel1.Update();
        }

        protected void btnGoToRoot_Click(object sender, EventArgs e) {
            lblParentCatName.Text = string.Empty;
            ViewState["ParentId"] = 0;
            grvCategories.EditIndex = -1;
            grvCategories.SelectedIndex = -1;
            bindData();
            btnGoToRoot.Visible = false;
        }
    }
}