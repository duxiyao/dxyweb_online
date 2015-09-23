<%@ WebHandler Language="C#" Class="VCardRegister" %>

using System;
using System.Web; 

public class VCardRegister : IHttpHandler {
    
    public void ProcessRequest (HttpContext context) {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        string jsonStr = context.Request.Form["jsonStr"];
        try
        {
            if (!string.IsNullOrEmpty(jsonStr))
                System.IO.File.WriteAllText(AppDomain.CurrentDomain.BaseDirectory+@"articles\1.txt", jsonStr);
            string FullFileName = AppDomain.CurrentDomain.BaseDirectory + @"images\dxy.jpg";// context.Server.MapPath(@"\images\dxy.jpg"); //FileName--要下载的文件名 
            System.IO.FileInfo DownloadFile = new System.IO.FileInfo(FullFileName);
            if (DownloadFile.Exists)
            {
                context.Response.Clear();
                context.Response.ClearHeaders();
                context.Response.Buffer = false;
                //context.Response.ContentType = "application/octet-stream";
                context.Response.ContentType = "image/jpeg";
                context.Response.AppendHeader("Content-Disposition", "attachment;filename=" + HttpUtility.UrlEncode(DownloadFile.Name, System.Text.Encoding.ASCII));
                context.Response.AppendHeader("Content-Length", DownloadFile.Length.ToString());
                context.Response.WriteFile(DownloadFile.FullName);
                context.Response.Flush();
                context.Response.End();
            }
            else
            {
                //文件不存在 
            }
        }
        catch(Exception e)
        {
            //文件不存在
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}