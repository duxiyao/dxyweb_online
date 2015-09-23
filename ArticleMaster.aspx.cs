using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using BLL;

public partial class ArticleMaster : System.Web.UI.Page
{
    protected Article art;
    protected List<Review> listReview;
    protected string fileName;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BLArticle bll = new BLArticle();
            art = bll.SelectOne(Request.QueryString["Id"]);
            if (art != null)
            { 
                this.artName.InnerText = art.ArticleName;
                this.artDate.InnerText = art.AddDate.ToString("yyyy-MM-dd HH:mm:ss");

                string path = GetPath(art.ArticlePath);
                string artContent="出错了...";
                try
                {
                    artContent = System.Text.Encoding.Default.GetString(System.IO.File.ReadAllBytes(path));                    
                }
                catch { }
               
                //artContent = System.Text.Encoding.Default.GetString(System.IO.File.ReadAllBytes(art.ArticlePath));
                this.articleContent.InnerHtml = artContent;
                fileName=art.ArticleName+art.AddDate.ToString("yyyy-MM-dd.HH-mm-ss");

                listReview = new BLReview().SelectByArticleId(art.Id.ToString());
            }
        }
    }

    private string GetPath(string artPath)
    {
        string path = artPath;
        string basePath = AppDomain.CurrentDomain.BaseDirectory;
        string[] str = new string[] { "articles" };
        string[] paths = path.Split(str, StringSplitOptions.None);
        path = basePath + @"\articles" + paths[1];
        return path;
    }
}