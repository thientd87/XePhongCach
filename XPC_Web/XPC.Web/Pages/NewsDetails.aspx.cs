using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BO;

namespace XPC.Web.Pages
{
    public partial class NewsDetails : System.Web.UI.Page
    {
        
        protected void Page_Load(object sender, EventArgs e)
        {

            if (!IsPostBack)
            {
                int _catID = Lib.QueryString.ParentCategory != 0 ? Lib.QueryString.ParentCategory : Lib.QueryString.CategoryID;
                long newsID = Lib.QueryString.NewsID;
                DataTable objCat = XpcHelper.SelectCategory(_catID);
                if (objCat != null && objCat.Rows.Count > 0)
                {
                   // CatName = string.Format("<a title=\"{1}\" href=\"{0}\">{1} </a>", objCat.Rows[0]["Cat_URL"], objCat.Rows[0]["Cat_Name"]);
                    Utility.SetPageHeader(this.Page, objCat.Rows[0]["Cat_Name"].ToString(), objCat.Rows[0]["Cat_Name"] + "-" + ", " + objCat.Rows[0]["Cat_displayURL"], objCat.Rows[0]["Cat_Name"] + ", " + objCat.Rows[0]["Cat_displayURL"], Lib.QueryString.PageIndex > 1);
                    //ltrCatName.Text = CatName;


                }
                DataTable detail = XpcHelper.displayMicrof_Detail(newsID);
                string imgTo;
                if (detail != null && detail.Rows.Count > 0)
                {
                    
                    DataRow row = detail.Rows[0];
                    ltrSapo.Text = row["News_InitContent"].ToString().Replace("[xevaphongcach.net]","");
                    ltrTitle.Text = row["News_Title"].ToString();
                    ltrContent.Text = row["News_Content"] != null ? row["News_Content"].ToString() : string.Empty;
                    imgTo = row["News_Image"] != null ? row["News_Image"].ToString().StartsWith("http:") ? row["News_Image"].ToString() : Utility.ImagesStorageUrl + "/" + row["News_Image"].ToString() : "";
                    ltrPublishDate.Text = row["PublishDate"].ToString();
                    //imgBigImage.ImageUrl = imgTo;
                    //imgBigImage.Visible = row["News_Image"].ToString().Length > 0;

                    if (!string.IsNullOrEmpty(row["Icon"].ToString()))
                    {
                        string txtTags = string.Empty;
                        string[] arrayTag = row["Icon"].ToString().Split(',');
                        if (arrayTag.Length > 0)
                        {
                            foreach (string s in arrayTag)
                            {
                                txtTags +=
                                    "<a title=\"" + s + "\" href=\"/tag/" + Utility.UnicodeToKoDauAndGach(s) + ".htm\"><strong>" + s + "</strong></a>, ";
                            }
                            ltrTags.Text = txtTags.TrimEnd(' ').TrimEnd(',');
                        }
                        else
                        {
                            divTags.Visible = false;    
                        }
                    }
                    else
                    {
                        divTags.Visible = false;
                    }


                    string Seo_Title = row["News_Title"].ToString();
                    string Seo_Des = row["News_InitContent"].ToString();
                    string Seo_KeyWord = !String.IsNullOrEmpty(row["Extension3"].ToString()) ? row["Extension3"].ToString() : "";

                    Utility.SetPageHeaderDetail(this.Page, Seo_Title, objCat.Rows[0]["Cat_Name"].ToString(), Seo_Des, Seo_KeyWord);

                    // Truong hop Title bi thay doi, URL se thay doi theo. Khi đó ta chuyển Link về theo URL mới.                
                    Utility.SetCanonicalLink(this.Page, row["NewsURL"].ToString());



                    // Bao cho Google biet la Link đa bi xoa 
                    if (String.IsNullOrEmpty(row["News_Title"].ToString()))
                    {
                        Utility.DeletedLinkNotify();
                    }

                    //Đặt SEO cho Facebook
                    Utility.SetFaceBookSEO(this.Page, Seo_Title, Seo_Des, "", System.Configuration.ConfigurationManager.AppSettings["WebDomain"] + row["NewsURL"].ToString());


                    DataTable dtTinKhac = XpcHelper.displayGetTinKhac(10, _catID, newsID);
                    if (dtTinKhac != null && dtTinKhac.Rows.Count > 0)
                    {
                        rptTinKhac.DataSource = dtTinKhac;
                        rptTinKhac.DataBind();
                    }

                    
                    DataTable dtTinMoiCapNhat = XpcHelper.displayGetTinMoiCapNhat(10, _catID, newsID);
                    if (dtTinMoiCapNhat != null && dtTinMoiCapNhat.Rows.Count > 0)
                    {
                        rptTinMoiCapNhat.DataSource = dtTinMoiCapNhat;
                        rptTinMoiCapNhat.DataBind();
                    }
                    else
                    {
                        divTinMoiCapNhat.Visible = false;
                    }


                }
            }
        }
    }
}