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

namespace Portal.GUI.Administrator.AdminPortal
{
    public partial class TemplatePreview : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string strTemplateReference = Request.QueryString["TemplateReference"].ToString();
                if (!string.Empty.Equals(strTemplateReference))
                {
                    LoadData(strTemplateReference);
                }
            }
        }

        private void LoadData(string strTemplateReference)
        {
            TemplateDefinition td = TemplateDefinition.Load();
            TemplateDefinition.Template t = td.GetTemplate(strTemplateReference);

            //Add HTML Table Cell
            //Start with columns whose level is minimum : -1, then end of template.
            int _iMaxColumnLevel_0 = t.GetMaxLevelOfColumnsInTemplate();
            int _iMinColumnLevel_0 = t.GetMinLevelOfColumnsInTemplate();
            
            for (int currentColumnLevel_0 = _iMinColumnLevel_0; currentColumnLevel_0 <= _iMaxColumnLevel_0; currentColumnLevel_0++)
            {
                //lay ve tat ca cac column co cung level ma se duoc chua tren cung 1 dong
                ArrayList _arrayListColumns = t.GetArrayColumnWithLevel(currentColumnLevel_0);

                //khoi tao dong moi
                TableRow parentRow = new TableRow();
                parentRow.Width = Unit.Percentage(100);

                //khoi tao cell moi trong dong moi
                TableCell parentCell = CreateTableCell("", "", "","");
                parentCell.Width = parentRow.Width;
                parentRow.Cells.Add(parentCell);

                //Khoi tao mot bang moi trong cell moi (khong dung colspan hoac rowspan) de khong anh huong cau truc cua dong tiep theo
                Table childrenTable = new Table();
                childrenTable.Width = parentCell.Width;
                parentCell.Controls.Add(childrenTable);

                TableRow childrenRow = new TableRow();
                childrenRow.Width = childrenTable.Width;
                childrenTable.Rows.Add(childrenRow);
                
                foreach (PortalDefinition.Column column in _arrayListColumns)
                {
                    TableCell cellColumn = AnalyseColumn(column);
                    if (_arrayListColumns.Count == 1)
                    {
                        cellColumn.Width = childrenRow.Width;
                    }
                    childrenRow.Cells.Add(cellColumn);
                }

                //Them dong moi vao bang
                Table1.Rows.Add(parentRow);
            }
        }

        private TableCell AnalyseColumn(PortalDefinition.Column column)
        {
            if (column.Columns.Count == 0)
            {
                TableCell cellColumn;
                if (column.ModuleList.Count >= 1)
                {
                    string strModuleTitle_0 = "";
                    for (int i = 0; i < column.ModuleList.Count; i++)
                    {
                        PortalDefinition.Module tempModule_0 = (PortalDefinition.Module)column.ModuleList[i];
                        if (i == 0)
                        {
                            strModuleTitle_0 += tempModule_0.title;
                        }
                        else
                        {
                            strModuleTitle_0 += " <br> " + tempModule_0.title;
                        }
                    }

                    cellColumn = CreateTableCell(strModuleTitle_0, "child-cell", column.ColumnCustomStyle, column.ColumnWidth);
                }
                else
                {
                    cellColumn = CreateTableCell("cột mới chưa có module", "child-cell", column.ColumnCustomStyle, column.ColumnWidth);
                }
                return cellColumn;
            }
            // if this column has more one children
            else
            {
                TableCell cellColumn;
                cellColumn = CreateTableCell("", "", column.ColumnCustomStyle, column.ColumnWidth);
                
                //Moi dong cua mot level tuong ung voi mot bang duoc chua trong mot cell
                Table childrenTable = new Table();
                childrenTable.Width = cellColumn.Width;
                cellColumn.Controls.Add(childrenTable);

                int _iMaxColumnLevel = column.GetMaxLevelOfChildrenColumns();
                int _iMinColumnLevel = column.GetMinLevelOfChildrenColumns();

                for (int currentColumnLevel_1 = _iMinColumnLevel; currentColumnLevel_1 <= _iMaxColumnLevel; currentColumnLevel_1++)
                {
                    //Get all column have same level
                    ArrayList _arrayListColumns = column.GetArrayChildrenColumnWithLevel(currentColumnLevel_1);

                    TableRow childrenRow = new TableRow();
                    childrenRow.Width = childrenTable.Width;
                    childrenTable.Rows.Add(childrenRow);

                    TableCell cellChildrenColumn = CreateTableCell("", "", "", "");
                    cellChildrenColumn.Width = childrenRow.Width;
                    childrenRow.Cells.Add(cellChildrenColumn);

                    Table grandChildrenTable = new Table();
                    grandChildrenTable.Width = cellChildrenColumn.Width;
                    cellChildrenColumn.Controls.Add(grandChildrenTable);

                    TableRow grandChildrenRow = new TableRow();
                    grandChildrenRow.Width = grandChildrenTable.Width;
                    grandChildrenTable.Rows.Add(grandChildrenRow);

                    foreach (PortalDefinition.Column childrenColumn in _arrayListColumns)
                    {
                        TableCell cellGradnChildrenColumn = AnalyseColumn(childrenColumn);
                        if (_arrayListColumns.Count == 1)
                        {
                            cellGradnChildrenColumn.Width = grandChildrenRow.Width;
                        }
                        grandChildrenRow.Cells.Add(cellGradnChildrenColumn);
                    }
                }

                //if this colum has more one module
                if (column.ModuleList.Count >= 1)
                {
                    TableRow childrenRow = new TableRow();
                    childrenRow.Width = childrenTable.Width;
                    childrenTable.Rows.Add(childrenRow);

                    string strModuleTitle_0 = "";
                    for (int i = 0; i < column.ModuleList.Count; i++)
                    {
                        PortalDefinition.Module tempModule_0 = (PortalDefinition.Module)column.ModuleList[i];
                        if (i == 0)
                        {
                            strModuleTitle_0 += tempModule_0.title;
                        }
                        else
                        {
                            strModuleTitle_0 += " <br> " + tempModule_0.title;
                        }
                    }

                    TableCell cellChildrenColumn = CreateTableCell(strModuleTitle_0, "child-cell", column.ColumnCustomStyle, column.ColumnWidth);
                    cellChildrenColumn.Width = childrenRow.Width;
                    childrenRow.Cells.Add(cellChildrenColumn);
                }
                return cellColumn;
            }
        }

        private TableCell CreateTableCell(string strText, string strClass, string strStyle,string strWidth)
        {
            TableCell tbCell = new TableCell();
            tbCell.Height = 100;
            
            //if width parameter is empty then set default width
            if(string.Empty.Equals(strWidth))
            {
                tbCell.Width = Unit.Percentage(100);
            }
            else
            {
                if(strWidth.Contains("%"))
                {
                    tbCell.Width = Unit.Percentage(Convert.ToDouble(strWidth.Replace('%',' ')));
                }
                else
                {
                    tbCell.Width = Unit.Pixel(Convert.ToInt32(strWidth));
                }
            }

            tbCell.Attributes.Add("class", strClass);
            tbCell.Attributes.Add("align", "center");
            tbCell.Attributes.Add("style", strStyle);
            tbCell.Text = strText;
            return tbCell;
        }
    }
}
