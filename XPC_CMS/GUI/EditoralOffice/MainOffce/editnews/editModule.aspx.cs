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
using Portal.BO.Editoral.EditNews;
using Portal.API;
using System.IO;

namespace Portal.GUI.EditoralOffice.MainOffce.editnews
{
	public partial class editModule : System.Web.UI.Page
	{
		string moduleType = string.Empty;
		string moduleReference = string.Empty;

		protected void Page_Load(object sender, EventArgs e)
		{
			if (Request.QueryString["moduleType"] == null) return;
			moduleType = Request.QueryString["moduleType"];
			arg1.Text = moduleType;

			moduleReference = string.IsNullOrEmpty(arg2.Text) ? Request.QueryString["moduleReference"] : arg2.Text;
			if (string.IsNullOrEmpty(moduleReference))
			{
				moduleReference = Guid.NewGuid().ToString();
			}
			arg2.Text = moduleReference;

			if (!string.IsNullOrEmpty(moduleType))
			{
				Block block = new Block(moduleReference, moduleType);

				if (!string.IsNullOrEmpty(block.ObjectEditFormName))
				{
					Module moduleControl = (Module)LoadControl(block.ObjectEditFormVirtualPath);
					// Khởi tạo nội dung Module
					moduleControl.InitModule(null,
												 block.ObjectReference,
												 block.ObjectType,
												 block.ObjectEditFormVirtualPath,
												 true);

					container.Controls.Add(moduleControl);
				}

			}
			if (!IsPostBack)
			{
				// bind default style value
				if (Request.QueryString["moduleType"].IndexOf("OtherNews") > -1 && string.IsNullOrEmpty(Request.QueryString["moduleReference"]))
				{
					Select2.SelectedIndex = 1;
					Text8.Text = "0px 10px 0px 0px";
					//js.Text = "<script>onunload = enableParent;</script>";
				}
				//else if (string.IsNullOrEmpty(Request.QueryString["moduleReference"]))
				//    //loadPresentationModule(moduleType, moduleReference);
				//    js.Text = "<script>onunload = enableParent;</script>";
				//else
				//js.Text = "<script>addLoadEvent(bindData);</script>";

				loadPresentationModule(moduleType, moduleReference);

				ltrStyleSheet.Text = string.Empty;
				addStyleSheetOfModule(moduleType);
			}
		}

		void Page_Init(object sender, EventArgs e)
		{

		}
		public void loadPresentationModule(string moduleType, string moduleReference)
		{
			Block block = new Block(moduleReference, moduleType);
			// presentation module
			if (!string.IsNullOrEmpty(block.ObjectPresentationName))
			{
				Module moduleControl2 = (Module)LoadControl(block.ObjectVirtualPath);
				// Khởi tạo nội dung Module
				moduleControl2.InitModule(null,
											 block.ObjectReference,
											 block.ObjectType,
											 block.ObjectVirtualPath,
											 true);

				presentationContainer.Controls.Add(moduleControl2);
			}
		}

		private void addStyleSheetOfModule(string moduleType)
		{
			DirectoryInfo d = new DirectoryInfo(Server.MapPath("~/GUI/" + moduleType));

			// style
			FileInfo[] files = d.GetFiles("*.css");
			foreach (FileInfo file in files)
			{
				ltrStyleSheet.Text += string.Format("<link rel=\"stylesheet\" type=\"text/css\" href=\"/GUI/{0}\" />", moduleType + "/" + file.Name) + Environment.NewLine;
			}

			// script
			files = d.GetFiles("*.js");
			foreach (FileInfo file in files)
			{
				ltrStyleSheet.Text += string.Format("<script type=\"text/javascript\" src=\"/GUI/{0}\"></script>", moduleType + "/" + file.Name) + Environment.NewLine;
			}
		}
	}
}
